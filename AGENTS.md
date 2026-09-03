# AGENTS.md

## Project

This repository contains the website for Zhao's Lab.

The website is a lightweight static site based primarily on:
- HTML
- CSS
- Bootstrap
- JavaScript
- GitHub Pages

Keep the website simple, lightweight, responsive, and easy to maintain.

## General Rules

- Make the smallest change necessary to complete the requested task.
- Preserve the existing website structure and visual style unless explicitly asked to redesign it.
- Do not refactor unrelated code.
- Do not rewrite entire files when a localized edit is sufficient.
- Do not modify unrelated pages.
- Do not introduce new frameworks or dependencies unless explicitly requested.
- Prefer existing Bootstrap classes and project CSS over new custom implementations.
- Preserve existing links, IDs, anchors, image paths, and functionality unless the task requires changing them.

## Scope

Before editing:

1. Inspect only the files directly relevant to the task.
2. Do not scan the entire repository unless necessary.
3. Do not inspect `vendor/`, third-party libraries, images, or large resource directories unless explicitly required.
4. If the requested change clearly concerns one file, start with that file only.
5. Expand the search to other files only when the dependency cannot be determined locally.

Typical files include:
- `index.html`
- `portfolio-1-col.html`
- project-specific HTML pages
- relevant files under `css/`

## HTML

- Preserve the existing Bootstrap-based layout.
- Keep HTML readable and consistently indented.
- Use semantic HTML where practical.
- Preserve existing `id` attributes used by internal links.
- Use `&amp;` instead of raw `&` where appropriate in HTML.
- External links should remain functional.
- Avoid unnecessary inline CSS when an existing class can achieve the same result.

## CSS and Responsive Design

- Maintain compatibility with the Bootstrap version already used by the project.
- Do not upgrade Bootstrap unless explicitly requested.
- Changes should work on both desktop and mobile layouts.
- Prefer responsive Bootstrap grid classes such as:
  - `col-lg-*`
  - `col-md-*`
  - `col-sm-*`
- Avoid fixed widths when responsive alternatives are available.
- Add custom CSS only when Bootstrap cannot reasonably achieve the desired result.

## Content

- Preserve scientific terminology, publication titles, method names, numerical values, and citations exactly unless explicitly asked to edit them.
- Do not invent or modify scientific claims.
- Do not alter publication links or DOI links unless requested.
- Preserve capitalization of established method names such as:
  - Sparse deconvolution
  - Sparse-SIM
  - SACD
  - RIED
  - SN2N
  - aSN2N
  - FLAME
  - COMET
- When editing English text, prefer concise academic English suitable for an international research-lab website.

## Images and Resources

- Do not rename, move, compress, regenerate, or delete images unless explicitly requested.
- Preserve existing relative resource paths.
- Do not inspect image contents unless the task specifically concerns an image.
- Do not modify files in third-party or generated resource directories.

## Validation

After editing:
- Check HTML structure around the modified section.
- Check that tags remain balanced.
- Check that internal anchors and links affected by the edit still work.
- Consider both desktop and mobile layout for responsive changes.
- Do not run unnecessary repository-wide tests or builds for simple HTML/CSS edits.

## Output

- Make the requested edits directly.
- Keep explanations concise.
- Summarize only the files and sections actually changed.
- Do not provide lengthy explanations of unchanged code.
- If no additional files need modification, do not inspect or edit them.