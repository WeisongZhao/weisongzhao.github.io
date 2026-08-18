import { createHash } from "node:crypto";
import { mkdir, readFile, writeFile } from "node:fs/promises";
import { createRequire } from "node:module";
import path from "node:path";
import process from "node:process";

const require = createRequire(import.meta.url);
const { chromium } = require("playwright");

const root = process.cwd();
const statePath = path.join(root, ".github/readme-preview-state.json");
const width = 1126;
const height = 667;
const deviceScaleFactor = 2;
const zenodoDoiFallback = `data:image/svg+xml;charset=utf-8,${encodeURIComponent(`
  <svg xmlns="http://www.w3.org/2000/svg" width="184" height="20" role="img" aria-label="DOI: 10.5281/zenodo.5079743">
    <linearGradient id="s" x2="0" y2="100%"><stop offset="0" stop-color="#bbb" stop-opacity=".1"/><stop offset="1" stop-opacity=".1"/></linearGradient>
    <clipPath id="r"><rect width="184" height="20" rx="3"/></clipPath>
    <g clip-path="url(#r)"><rect width="31" height="20" fill="#555"/><rect x="31" width="153" height="20" fill="#007ec6"/><rect width="184" height="20" fill="url(#s)"/></g>
    <g fill="#fff" text-anchor="middle" font-family="Verdana,Geneva,DejaVu Sans,sans-serif" font-size="11">
      <text x="16" y="15" fill="#010101" fill-opacity=".3">DOI</text><text x="16" y="14">DOI</text>
      <text x="107" y="15" fill="#010101" fill-opacity=".3">10.5281/zenodo.5079743</text><text x="107" y="14">10.5281/zenodo.5079743</text>
    </g>
  </svg>
`)}`;
const projects = [
  {
    key: "Sparse-deconvolution",
    repo: "SR-Wiki/Sparse-deconvolution",
    output: "img/projects/OS1.jpg",
    format: "jpeg",
    imageFallbacks: [
      {
        includes: "zenodo.org/badge/DOI/10.5281/zenodo.5079743.svg",
        replacement: zenodoDoiFallback
      }
    ]
  },
  {
    key: "SACDj",
    repo: "WeisongZhao/SACDj",
    output: "img/projects/OS2.jpg",
    format: "jpeg"
  },
  {
    key: "PANELJ",
    repo: "WeisongZhao/PANELJ",
    output: "img/projects/OS3.jpg",
    format: "jpeg"
  }
];

async function readState() {
  try {
    return JSON.parse(await readFile(statePath, "utf8"));
  } catch (error) {
    if (error.code === "ENOENT") return {};
    throw error;
  }
}

async function getReadmeSha(repo) {
  const headers = {
    Accept: "application/vnd.github+json",
    "X-GitHub-Api-Version": "2022-11-28",
    "User-Agent": "weisongzhao-home-readme-preview"
  };
  if (process.env.GITHUB_TOKEN) {
    headers.Authorization = `Bearer ${process.env.GITHUB_TOKEN}`;
  }

  const response = await fetch(`https://api.github.com/repos/${repo}/readme`, { headers });
  if (!response.ok) {
    throw new Error(`${repo}: GitHub README API returned ${response.status}`);
  }
  return (await response.json()).sha;
}

async function sha256(filePath) {
  try {
    return createHash("sha256").update(await readFile(filePath)).digest("hex");
  } catch (error) {
    if (error.code === "ENOENT") return null;
    throw error;
  }
}

async function captureReadme(browser, project) {
  const page = await browser.newPage({
    viewport: { width, height },
    deviceScaleFactor
  });

  try {
    await page.goto(`https://github.com/${project.repo}`, {
      waitUntil: "domcontentloaded",
      timeout: 90_000
    });

    const readme = page.locator("article.markdown-body");
    await readme.waitFor({ state: "visible", timeout: 30_000 });

    await page.evaluate(({ width }) => {
      const original = document.querySelector("article.markdown-body");
      if (!original) throw new Error("GitHub README article was not found");

      const preview = original.cloneNode(true);
      document.body.replaceChildren(preview);
      document.documentElement.style.background = "#ffffff";
      document.body.style.margin = "0";
      document.body.style.background = "#ffffff";
      document.body.style.minWidth = `${width}px`;
      Object.assign(preview.style, {
        boxSizing: "border-box",
        width: `${width}px`,
        maxWidth: "none",
        minHeight: "100vh",
        margin: "0",
        padding: "24px 39px",
        background: "#ffffff"
      });
      window.scrollTo(0, 0);
    }, { width });

    await page.waitForFunction(
      () => Array.from(document.images).every((image) => image.complete),
      null,
      { timeout: 30_000 }
    );
    await page.evaluate((fallbacks) => {
      for (const image of document.images) {
        const fallback = fallbacks.find(({ includes }) => image.src.includes(includes));
        if (fallback && image.naturalWidth === 0) image.src = fallback.replacement;
      }
    }, project.imageFallbacks ?? []);
    await page.waitForFunction(
      (fallbacks) => Array.from(document.images)
        .filter((image) => fallbacks.some(({ includes }) => image.src.includes(includes)))
        .every((image) => image.complete && image.naturalWidth > 0),
      project.imageFallbacks ?? [],
      { timeout: 30_000 }
    );
    await page.evaluate(async () => {
      await document.fonts.ready;
      await Promise.all(
        Array.from(document.images, (image) => image.decode().catch(() => undefined))
      );
    });
    await page.waitForTimeout(1_000);

    const options = {
      type: project.format,
      clip: { x: 0, y: 0, width, height },
      animations: "disabled"
    };
    if (project.format === "jpeg") options.quality = 92;
    return await page.screenshot(options);
  } finally {
    await page.close();
  }
}

const state = await readState();
let stateChanged = false;
for (const retiredKey of ["Sparse-SIM", "SACDm", "RIEDm"]) {
  if (state[retiredKey]) {
    delete state[retiredKey];
    stateChanged = true;
  }
}
const launchOptions = { headless: true };
if (process.env.PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH) {
  launchOptions.executablePath = process.env.PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH;
}

const browser = await chromium.launch(launchOptions);
try {
  for (const project of projects) {
    const readmeSha = await getReadmeSha(project.repo);
    const outputPath = path.join(root, project.output);
    const previousHash = await sha256(outputPath);
    const sourceUnchanged =
      state[project.key]?.readme_sha === readmeSha &&
      state[project.key]?.output === project.output;
    if (sourceUnchanged && previousHash && process.env.FORCE_README_PREVIEWS !== "1") {
      console.log(`${project.key} README preview is unchanged (${readmeSha.slice(0, 12)}).`);
      continue;
    }

    const image = await captureReadme(browser, project);
    const nextHash = createHash("sha256").update(image).digest("hex");
    const previewChanged = previousHash !== nextHash;

    if (previewChanged) {
      await mkdir(path.dirname(outputPath), { recursive: true });
      await writeFile(outputPath, image);
    }

    const metadataChanged = !sourceUnchanged;
    if (previewChanged || metadataChanged) {
      state[project.key] = {
        repo: project.repo,
        readme_sha: readmeSha,
        source_url: `https://github.com/${project.repo}#readme`,
        output: project.output,
        generated_at: new Date().toISOString()
      };
      stateChanged = true;
      console.log(`Updated ${project.key} README preview from ${readmeSha.slice(0, 12)}.`);
    } else {
      console.log(`${project.key} README preview is unchanged (${readmeSha.slice(0, 12)}).`);
    }
  }
} finally {
  await browser.close();
}

if (stateChanged) {
  await writeFile(statePath, `${JSON.stringify(state, null, 2)}\n`);
}
