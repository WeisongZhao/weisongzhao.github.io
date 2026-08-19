# frozen_string_literal: true

ROOT = File.expand_path("..", __dir__)

def english_home(legacy_news)
  <<~HTML
    <main class="home-preview">
      <section class="preview-section" aria-labelledby="research-heading">
        <div class="container">
          <div class="preview-section-heading">
            <div>
              <h1 id="research-heading">Research</h1>
              <p>We integrate optical systems, computational imaging, and machine learning to advance biomedical microscopy and quantitative bioimage analysis.</p>
            </div>
            <a class="preview-section-link" href="projects.html">Explore Projects →</a>
          </div>
          <div class="preview-research-grid">
            <article class="preview-research-card">
              <figure class="preview-research-media"><img src="img/home/cell bio objective.png" alt="Microscopy systems and algorithms"></figure>
              <div class="preview-research-body">
                <h3>Microscopy: Systems &amp; Algorithms</h3>
                <p>We co-design optical instrumentation and computational reconstruction methods for fast, photon-efficient, high-resolution biomedical imaging.</p>
                <div class="preview-methods"><a href="projects.html#SparseDecon">Sparse deconvolution</a> · <a href="projects.html#SACD">SACD</a> · <a href="https://doi.org/10.1038/s41586-026-10889-7">RIED</a></div>
                <a class="preview-card-link" href="projects.html">Explore projects →</a>
              </div>
            </article>
            <article class="preview-research-card">
              <figure class="preview-research-media"><img src="img/home/NN-w.png" alt="Machine learning for biomedical imaging"></figure>
              <div class="preview-research-body">
                <h3>Machine Learning: Methods &amp; Applications</h3>
                <p>We combine physical, structural, and data-driven priors to develop interpretable and self-supervised methods for multidimensional biomedical signals.</p>
                <div class="preview-methods"><a href="projects.html#SN2N">SN2N</a> · <a href="https://www.sciengine.com/PXLIFE/doi/10.3724/PXLIFE.2025-0010">aSN2N</a> · Representation learning</div>
                <a class="preview-card-link" href="projects.html">Explore projects →</a>
              </div>
            </article>
            <article class="preview-research-card">
              <figure class="preview-research-media"><img src="img/home/bioimage-device.png" alt="Smart bioimage analysis and biomedical devices"></figure>
              <div class="preview-research-body">
                <h3>Bioimage Analysis &amp; Biomedical Devices</h3>
                <p>We develop quantitative image-analysis methods and compact imaging instruments for automated, high-throughput biological investigation.</p>
                <div class="preview-methods"><a href="projects.html#PANEL">PANEL</a> · <a href="projects.html#SOHA">Hematology analyzer</a> · <a href="projects.html#endoscope">Light-field endoscopy</a></div>
                <a class="preview-card-link" href="projects.html">Explore projects →</a>
              </div>
            </article>
          </div>
        </div>
      </section>

      <section class="preview-section" aria-labelledby="news-heading">
        <div class="container">
          <div class="preview-section-heading">
            <div>
              <h2 id="news-heading">News</h2>
              <p>Selected publications, research milestones, and updates from the lab.</p>
            </div>
          </div>
          <h3 class="preview-featured-title">Featured News</h3>
          <div class="preview-featured-grid">
            <a class="preview-feature-card" href="https://www.nature.com/articles/s41586-026-10889-7" target="_blank" rel="noopener noreferrer">
              <span class="preview-feature-media"><img src="https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41586-026-10889-7/MediaObjects/41586_2026_10889_Fig1_HTML.png" alt="RIED paper preview" onerror="this.onerror=null;this.src='img/projects/RIEDfig1.png';"></span>
              <span class="preview-feature-body"><span class="preview-feature-meta">Nature · August 2026</span><strong>RIED: excitation-free super-resolution imaging</strong><p>A reaction-luminescence framework for high-contrast 2D and 3D imaging under extremely photon-limited conditions.</p><span class="preview-feature-link">Read the paper ↗</span></span>
            </a>
            <a class="preview-feature-card" href="https://www.nature.com/articles/s41592-024-02400-9" target="_blank" rel="noopener noreferrer">
              <span class="preview-feature-media"><img src="https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41592-024-02400-9/MediaObjects/41592_2024_2400_Fig1_HTML.png" alt="SN2N paper preview" onerror="this.onerror=null;this.src='img/projects/SN2Npro.jpg';"></span>
              <span class="preview-feature-body"><span class="preview-feature-meta">Nature Methods · September 2024</span><strong>SN2N: self-inspired microscopy denoising</strong><p>Unsupervised denoising competitive with supervised learning, trained from a single noisy frame without clean ground truth.</p><span class="preview-feature-link">Read the paper ↗</span></span>
            </a>
            <a class="preview-feature-card" href="https://www.nature.com/nphoton/volumes/17/issues/9" target="_blank" rel="noopener noreferrer">
              <span class="preview-feature-media preview-feature-media--cover"><img src="https://media.springernature.com/w440/springer-static/cover-hires/journal/41566/17/9" alt="Nature Photonics September 2023 cover" onerror="this.onerror=null;this.src='img/projects/SACD.png';"></span>
              <span class="preview-feature-body"><span class="preview-feature-meta">Nature Photonics · Cover · September 2023</span><strong>Efficient super-resolution imaging</strong><p>SACD uses 20 frames to double axial and lateral resolution and image thousands of cells across 2 mm × 1.4 mm in 10 minutes at 128 nm resolution.</p><span class="preview-feature-link">View the issue ↗</span></span>
            </a>
          </div>

          <h3 class="preview-latest-title">Latest News</h3>
          <ul class="preview-news-timeline">
            <li><time datetime="2026-08">2026-08</time><span>Our <a href="https://www.nature.com/articles/s41586-026-10889-7">RIED work</a> is online at <i>Nature</i>.</span></li>
            <li><time datetime="2026-07">2026-07</time><span>Congrats to Jiahui Gui, the Ph.D. student from the lab and co-first author, on the acceptance of our RIED work in <i>Nature</i>.</span></li>
            <li><time datetime="2026-04">2026-04</time><span>Congrats to Deer Su on successfully defending his Ph.D. dissertation.</span></li>
            <li><time datetime="2026-04">2026-04</time><span>Two studies advancing light-field endoscopic probes were published in <a href="https://www.sciencedirect.com/science/article/pii/S0143816626002605">Optics and Lasers in Engineering</a> and <a href="https://opg.optica.org/oe/fulltext.cfm?uri=oe-34-8-15664">Optics Express</a>.</span></li>
            <li><time datetime="2026-02">2026-02</time><span><a href="https://www.biorxiv.org/content/10.64898/2026.02.04.703714v1">RIED</a> was released as a bioRxiv preprint with its <a href="https://github.com/SR-Wiki/RIEDm">MATLAB toolkit</a>.</span></li>
            <li><time datetime="2025-09">2025-09</time><span>The lab PI was promoted to <a href="http://homepage.hit.edu.cn/weisongzhao">Tenured Professor</a> at Harbin Institute of Technology.</span></li>
            <li><time datetime="2025-09">2025-09</time><span>Our commentary on SN2N was published in <a href="https://onlinelibrary.wiley.com/doi/10.1002/ctm2.70390">Clinical and Translational Medicine</a>.</span></li>
            <li><time datetime="2025-08">2025-08</time><span><a href="https://doi.org/10.1101/2025.08.20.671215">FLAME</a> was released as a preprint with its <a href="https://github.com/SR-Wiki/FLAMEm">MATLAB toolkit</a>.</span></li>
          </ul>
          <details class="preview-full-archive">
            <summary>Complete news archive</summary>
            #{legacy_news}
          </details>
        </div>
      </section>
    </main>
  HTML
end

def chinese_home(legacy_news)
  <<~HTML
    <main class="home-preview">
      <section class="preview-section" aria-labelledby="research-heading">
        <div class="container">
          <div class="preview-section-heading">
            <div>
              <h1 id="research-heading">研究</h1>
              <p>课题组融合光学系统、计算成像与机器学习，推动生物医学显微成像和定量生物图像分析技术的发展。</p>
            </div>
            <a class="preview-section-link" href="projects.html">查看项目 →</a>
          </div>
          <div class="preview-research-grid">
            <article class="preview-research-card">
              <figure class="preview-research-media"><img src="../img/home/cell bio objective.png" alt="显微成像系统与算法"></figure>
              <div class="preview-research-body"><h3>显微成像：系统与算法</h3><p>面向快速、光子高效和高分辨率生物医学成像，协同设计光学仪器与计算重建方法。</p><div class="preview-methods"><a href="projects.html#SparseDecon">稀疏解卷积</a> · <a href="projects.html#SACD">SACD</a> · <a href="https://doi.org/10.1038/s41586-026-10889-7">RIED</a></div><a class="preview-card-link" href="projects.html">查看项目 →</a></div>
            </article>
            <article class="preview-research-card">
              <figure class="preview-research-media"><img src="../img/home/NN-w.png" alt="面向生物医学成像的机器学习"></figure>
              <div class="preview-research-body"><h3>机器学习：方法与应用</h3><p>融合物理先验、结构先验与数据驱动先验，研究可解释、自监督的多维生物医学信号处理方法。</p><div class="preview-methods"><a href="projects.html#SN2N">SN2N</a> · <a href="https://www.sciengine.com/PXLIFE/doi/10.3724/PXLIFE.2025-0010">aSN2N</a> · 表征学习</div><a class="preview-card-link" href="projects.html">查看项目 →</a></div>
            </article>
            <article class="preview-research-card">
              <figure class="preview-research-media"><img src="../img/home/bioimage-device.png" alt="生物图像分析与生物医学装置"></figure>
              <div class="preview-research-body"><h3>生物图像分析与生物医学装置</h3><p>开发定量图像分析方法与紧凑型成像仪器，服务于自动化、高通量生物学研究。</p><div class="preview-methods"><a href="projects.html#PANEL">PANEL</a> · <a href="projects.html#SOHA">血液分析仪</a> · <a href="projects.html#endoscope">光场内窥成像</a></div><a class="preview-card-link" href="projects.html">查看项目 →</a></div>
            </article>
          </div>
        </div>
      </section>

      <section class="preview-section" aria-labelledby="news-heading">
        <div class="container">
          <div class="preview-section-heading"><div><h2 id="news-heading">新闻</h2><p>课题组的重要论文、研究进展与近期动态。</p></div></div>
          <h3 class="preview-featured-title">重要新闻</h3>
          <div class="preview-featured-grid">
            <a class="preview-feature-card" href="https://www.nature.com/articles/s41586-026-10889-7" target="_blank" rel="noopener noreferrer"><span class="preview-feature-media"><img src="https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41586-026-10889-7/MediaObjects/41586_2026_10889_Fig1_HTML.png" alt="RIED论文预览图" onerror="this.onerror=null;this.src='../img/projects/RIEDfig1.png';"></span><span class="preview-feature-body"><span class="preview-feature-meta">Nature · 2026年8月</span><strong>RIED：无激发超分辨成像</strong><p>面向极端光子受限条件，实现高对比度二维和三维成像的反应发光超分辨框架。</p><span class="preview-feature-link">阅读论文 ↗</span></span></a>
            <a class="preview-feature-card" href="https://www.nature.com/articles/s41592-024-02400-9" target="_blank" rel="noopener noreferrer"><span class="preview-feature-media"><img src="https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41592-024-02400-9/MediaObjects/41592_2024_2400_Fig1_HTML.png" alt="SN2N论文预览图" onerror="this.onerror=null;this.src='../img/projects/SN2Npro.jpg';"></span><span class="preview-feature-body"><span class="preview-feature-meta">Nature Methods · 2024年9月</span><strong>SN2N：自启发显微图像降噪</strong><p>仅用单幅含噪图像训练、无需干净真值图像，性能可媲美监督学习的无监督降噪方法。</p><span class="preview-feature-link">阅读论文 ↗</span></span></a>
            <a class="preview-feature-card" href="https://www.nature.com/nphoton/volumes/17/issues/9" target="_blank" rel="noopener noreferrer"><span class="preview-feature-media preview-feature-media--cover"><img src="https://media.springernature.com/w440/springer-static/cover-hires/journal/41566/17/9" alt="Nature Photonics 2023年9月刊封面" onerror="this.onerror=null;this.src='../img/projects/SACD.png';"></span><span class="preview-feature-body"><span class="preview-feature-meta">Nature Photonics · 封面 · 2023年9月</span><strong>高效超分辨成像</strong><p>SACD仅需20帧，即可将轴向和横向分辨率提高一倍，并在10分钟内以128 nm分辨率完成2 mm × 1.4 mm视野内数千个细胞的成像。</p><span class="preview-feature-link">查看本期内容 ↗</span></span></a>
          </div>
          <h3 class="preview-latest-title">近期新闻</h3>
          <ul class="preview-news-timeline">
            <li><time datetime="2026-08">2026-08</time><span><a href="https://www.nature.com/articles/s41586-026-10889-7">RIED工作</a>已在<i>Nature</i>在线发表。</span></li>
            <li><time datetime="2026-07">2026-07</time><span>祝贺课题组博士生、共同第一作者桂家辉，RIED工作被<i>Nature</i>接收。</span></li>
            <li><time datetime="2026-04">2026-04</time><span>祝贺课题组博士生苏德尔顺利通过博士学位论文答辩。</span></li>
            <li><time datetime="2026-04">2026-04</time><span>两项光场内窥探头研究分别发表于<a href="https://www.sciencedirect.com/science/article/pii/S0143816626002605">Optics and Lasers in Engineering</a>和<a href="https://opg.optica.org/oe/fulltext.cfm?uri=oe-34-8-15664">Optics Express</a>。</span></li>
            <li><time datetime="2026-02">2026-02</time><span><a href="https://www.biorxiv.org/content/10.64898/2026.02.04.703714v1">RIED</a>以bioRxiv预印本形式发布，并同步开放<a href="https://github.com/SR-Wiki/RIEDm">MATLAB工具箱</a>。</span></li>
            <li><time datetime="2025-09">2025-09</time><span>课题组PI晋升为哈尔滨工业大学<a href="http://homepage.hit.edu.cn/weisongzhao">长聘教授</a>。</span></li>
            <li><time datetime="2025-09">2025-09</time><span>关于SN2N的述评发表于<a href="https://onlinelibrary.wiley.com/doi/10.1002/ctm2.70390">Clinical and Translational Medicine</a>。</span></li>
            <li><time datetime="2025-08">2025-08</time><span><a href="https://doi.org/10.1101/2025.08.20.671215">FLAME</a>以预印本形式发布，并同步开放<a href="https://github.com/SR-Wiki/FLAMEm">MATLAB工具箱</a>。</span></li>
          </ul>
          <details class="preview-full-archive"><summary>完整新闻档案</summary>#{legacy_news}</details>
        </div>
      </section>
    </main>
  HTML
end

def rebuild(path, language)
  text = File.read(path)
  news = text[%r{    <div class="container">\s*<div class="row">\s*<div class="col-lg-12 mb-4">\s*<div class="card h-100">\s*<h4 class="card-header">(?:News from the Lab|课题组新闻)</h4>.*?</div>\s*</div>\s*</div>\s*</div>\s*</div>\s*<!-- /\.container -->}m]
  abort("Could not locate legacy news in #{path}") unless news
  news = news.sub(/\s*<!-- \/\.container -->\z/, "")
  replacement = language == :en ? english_home(news) : chinese_home(news)
  changed = text.sub!(%r{</header>.*?    <!-- /\.container -->}m, "</header>\n#{replacement}\n    <!-- /.container -->")
  abort("Could not replace homepage sections in #{path}") unless changed
  stylesheet = language == :en ? "css/home-redesign-preview.css" : "../css/home-redesign-preview.css"
  text.sub!("</head>", "  <link href=\"#{stylesheet}\" rel=\"stylesheet\">\n</head>") unless text.include?(stylesheet)
  File.write(path, text)
end

english_path = File.join(ROOT, "index.html")
chinese_path = File.join(ROOT, "zh", "index.html")

if [english_path, chinese_path].all? { |path| File.read(path).include?('preview-all-cards-grid') }
  puts "The refined English and Chinese homepage previews are already built."
else
  rebuild(english_path, :en)
  rebuild(chinese_path, :zh)
  puts "Built standalone English and Chinese homepage redesign previews."
  load File.join(__dir__, "refine_home_preview.rb")
end
