# frozen_string_literal: true

ROOT = File.expand_path("..", __dir__)

def research_en
  <<~HTML
    <section class="preview-section" aria-labelledby="research-heading">
      <div class="container">
        <div class="preview-section-heading">
          <div>
            <h1 id="research-heading">Research</h1>
            <p>We develop biomedical imaging technologies spanning imaging physics, system design, computational reconstruction, machine learning, quantitative bioimage analysis, and compact biomedical devices.</p>
          </div>
          <a class="preview-section-link" href="projects.html">Explore Projects <span aria-hidden="true">→</span></a>
        </div>
        <div class="preview-research-grid">
          <article class="preview-research-card">
            <figure class="preview-research-media"><img src="img/home/cell bio objective.png" alt="Microscopy systems and algorithms"></figure>
            <div class="preview-research-body">
              <h3>Microscopy: Systems &amp; Algorithms</h3>
              <p>We develop biomedical imaging technologies by combining new imaging physics, bottom-up system design, and hardware–algorithm co-design for specific imaging scenarios.</p>
              <details class="preview-card-details"><summary>Explore More</summary><div class="preview-card-details-body">
                <p>We focus on developing advanced biomedical imaging technologies across modalities. Our research spans new imaging physics, bottom-up system design, and the co-design of hardware and computational algorithms tailored to specific imaging scenarios. We aim to optimize spatial, temporal, and information resolution under practical constraints such as photon or signal budget, acquisition speed, imaging depth, and system complexity.</p>
                <h4>Representative developed techniques</h4>
                <details class="preview-technique"><summary>Sparse deconvolution</summary><div><p>A physics-informed reconstruction framework that exploits sparsity and structural continuity to enhance resolution, contrast, and SNR beyond the limits of microscopy, particularly under low-SNR conditions. Applications include Sparse-SIM and Sparse SD-SIM.</p><a href="projects.html#SparseDecon">Sparse deconvolution project →</a></div></details>
                <details class="preview-technique"><summary>SACD</summary><div><p>A fluctuation-based super-resolution framework that achieves approximately threefold lateral and axial resolution enhancement using only 20 frames, without additional optical components. Sparse-SACD further enables fast 4D live-cell super-resolution imaging.</p><a href="projects.html#SACD">SACD project →</a></div></details>
                <details class="preview-technique"><summary>RIED</summary><div><p>A reaction-luminescence super-resolution framework for extremely photon-limited bioluminescence and electrochemiluminescence. It enables high-contrast 2D and 3D imaging without external optical excitation or photochemical modulation, including continuous BL-RIED imaging for over two days.</p><a href="projects.html#RIED">RIED project →</a></div></details>
              </div></details>
            </div>
          </article>
          <article class="preview-research-card">
            <figure class="preview-research-media"><img src="img/home/NN-w.png" alt="Machine learning methods and applications"></figure>
            <div class="preview-research-body">
              <h3>Machine Learning: Methods &amp; Applications</h3>
              <p>We combine explicit physical and structural priors with data-driven learning to reconstruct and analyze multidimensional biomedical and natural signals.</p>
              <details class="preview-card-details"><summary>Explore More</summary><div class="preview-card-details-body">
                <p>We develop machine-learning methods for the reconstruction and analysis of multidimensional biomedical and natural signals. We exploit both explicit physical and structural priors to design interpretable computational models, and data-driven priors to address problems that are difficult to solve with conventional methods. Applications range from reducing the photon, acquisition-time, and hardware requirements of microscopy to accelerating biological image reconstruction, profiling, and discovery.</p>
                <h4>Representative developed techniques</h4>
                <details class="preview-technique"><summary>SN2N</summary><div><p>Self-inspired Noise2Noise is a self-supervised learning-to-denoise framework that performs competitively with supervised learning without large paired datasets or clean ground-truth images. It supports robust, photon-efficient, long-term, and low-phototoxicity imaging.</p><a href="projects.html#SN2N">SN2N project →</a></div></details>
                <details class="preview-technique"><summary>aSN2N</summary><div><p>Adaptive SN2N introduces adaptive preprocessing and normalization to stabilize self-supervised learning across heterogeneous imaging conditions, improving robustness to intensity variation and background contamination while suppressing reconstruction artifacts.</p><a href="projects.html#SN2N">aSN2N project →</a></div></details>
              </div></details>
            </div>
          </article>
          <article class="preview-research-card">
            <figure class="preview-research-media"><img src="img/home/bioimage-device.png" alt="Smart bioimage analysis and biomedical devices"></figure>
            <div class="preview-research-body">
              <h3>Smart Bioimage Analysis &amp; Biomedical Devices</h3>
              <p>We develop quantitative bioimage-analysis methods and compact imaging instrumentation for automated, high-throughput biological investigation.</p>
              <details class="preview-card-details"><summary>Explore More</summary><div class="preview-card-details-body">
                <p>We develop intelligent bioimage analysis methods and biomedical imaging instrumentation to enable automated, quantitative, and high-throughput biological investigation. Our work spans image segmentation, tracking, profiling, and representation learning, as well as compact, application-oriented imaging devices and systems.</p>
                <h4>Representative developed techniques</h4>
                <details class="preview-technique"><summary>PANEL</summary><div><p>Pixel-level analysis of error locations is a quantitative framework for mapping reconstruction errors at the super-resolution scale and systematically assessing conventional and deep-learning reconstruction methods.</p><a href="projects.html#PANEL">PANEL project →</a></div></details>
                <details class="preview-technique"><summary>Smart palm-size optofluidic hematology analyzer</summary><div><p>A compact imaging-based platform for automated leukocyte concentration measurement and rapid hematological analysis.</p><a href="projects.html#SOHA">Smart hematology analyzer project →</a></div></details>
                <details class="preview-technique"><summary>Light-field endoscopic probes</summary><div><p>Compact and flexible probes, initiated with MIRD, for single-shot high-resolution volumetric imaging, supported by new optical designs and computational imaging strategies.</p><a href="projects.html#endoscope">Light-field endoscopy project →</a></div></details>
                <details class="preview-technique"><summary>Sparse confocal microscopy with single-particle tracking</summary><div><p>This approach revealed how SARS-CoV-2 virus-like particles exploit filopodia through “surfing” and “grabbing” to reach cellular entry sites and reduce random searching on the plasma membrane.</p><a href="projects.html#informatics">Sparse confocal microscopy project →</a></div></details>
              </div></details>
            </div>
          </article>
        </div>
      </div>
    </section>
  HTML
end

def research_zh
  research_en
    .gsub('Research</h1>', '研究</h1>')
    .gsub('We develop biomedical imaging technologies spanning imaging physics, system design, computational reconstruction, machine learning, quantitative bioimage analysis, and compact biomedical devices.', '课题组围绕生物医学成像开展研究，涵盖成像物理、系统设计、计算重建、机器学习、定量生物图像分析与紧凑型生物医学装置。')
    .gsub('img/home/', '../img/home/')
    .gsub('Explore Projects', '查看项目')
    .gsub('Microscopy: Systems &amp; Algorithms', '显微成像：系统与算法')
    .gsub('We develop biomedical imaging technologies by combining new imaging physics, bottom-up system design, and hardware–algorithm co-design for specific imaging scenarios.', '面向不同成像场景，融合新型成像物理、自底向上的系统设计以及硬件与算法协同设计，发展先进生物医学成像技术。')
    .gsub('Machine Learning: Methods &amp; Applications', '机器学习：方法与应用')
    .gsub('We combine explicit physical and structural priors with data-driven learning to reconstruct and analyze multidimensional biomedical and natural signals.', '融合显式物理先验、结构先验与数据驱动学习，开展多维生物医学及自然信号的重建与分析。')
    .gsub('Smart Bioimage Analysis &amp; Biomedical Devices', '智能生物图像分析与生物医学装置')
    .gsub('We develop quantitative bioimage-analysis methods and compact imaging instrumentation for automated, high-throughput biological investigation.', '发展定量生物图像分析方法与紧凑型成像仪器，服务于自动化、高通量生物学研究。')
    .gsub('Explore More', '展开详情')
    .gsub('Representative developed techniques', '代表性技术')
    .gsub('Sparse deconvolution', '稀疏解卷积')
    .gsub('Smart palm-size optofluidic hematology analyzer', '智能掌上型光流控血液分析仪')
    .gsub('Light-field endoscopic probes', '光场内窥探头')
    .gsub('Sparse confocal microscopy with single-particle tracking', '稀疏共聚焦显微成像与单粒子追踪')
    .gsub(' project →', '项目 →')
    .gsub('Smart hematology analyzer项目 →', '智能血液分析仪项目 →')
    .gsub('Light-field endoscopy项目 →', '光场内窥成像项目 →')
    .gsub('Sparse confocal microscopy项目 →', '稀疏共聚焦显微成像项目 →')
    .gsub('We focus on developing advanced biomedical imaging technologies across modalities. Our research spans new imaging physics, bottom-up system design, and the co-design of hardware and computational algorithms tailored to specific imaging scenarios. We aim to optimize spatial, temporal, and information resolution under practical constraints such as photon or signal budget, acquisition speed, imaging depth, and system complexity.', '我们面向多种成像模态发展先进生物医学成像技术，研究涵盖新型成像物理、自底向上的系统设计，以及针对具体成像场景的硬件与计算算法协同设计。在光子或信号预算、采集速度、成像深度和系统复杂度等实际约束下，优化空间、时间与信息分辨率。')
    .gsub('A physics-informed reconstruction framework that exploits sparsity and structural continuity to enhance resolution, contrast, and SNR beyond the limits of microscopy, particularly under low-SNR conditions. Applications include Sparse-SIM and Sparse SD-SIM.', '一种物理信息驱动的重建框架，利用稀疏性与结构连续性提升分辨率、对比度和信噪比，尤其适用于低信噪比成像；相关应用包括Sparse-SIM和Sparse SD-SIM。')
    .gsub('A fluctuation-based super-resolution framework that achieves approximately threefold lateral and axial resolution enhancement using only 20 frames, without additional optical components. Sparse-SACD further enables fast 4D live-cell super-resolution imaging.', '一种基于涨落的超分辨框架，无需额外光学组件，仅使用20帧即可实现约三倍的横向和轴向分辨率提升；Sparse-SACD进一步支持快速四维活细胞超分辨成像。')
    .gsub('A reaction-luminescence super-resolution framework for extremely photon-limited bioluminescence and electrochemiluminescence. It enables high-contrast 2D and 3D imaging without external optical excitation or photochemical modulation, including continuous BL-RIED imaging for over two days.', '一种面向极端光子受限生物发光和电化学发光的反应发光超分辨框架，无需外部光学激发或光化学调制即可实现高对比度二维和三维成像；BL-RIED可连续超分辨成像两天以上。')
    .gsub('We develop machine-learning methods for the reconstruction and analysis of multidimensional biomedical and natural signals. We exploit both explicit physical and structural priors to design interpretable computational models, and data-driven priors to address problems that are difficult to solve with conventional methods. Applications range from reducing the photon, acquisition-time, and hardware requirements of microscopy to accelerating biological image reconstruction, profiling, and discovery.', '我们研究多维生物医学及自然信号的机器学习重建与分析方法，利用显式物理和结构先验设计可解释计算模型，并借助数据驱动先验解决传统方法难以处理的问题。相关应用涵盖降低显微成像的光子、采集时间与硬件需求，以及加速生物图像重建、分析和发现。')
    .gsub('Self-inspired Noise2Noise is a self-supervised learning-to-denoise framework that performs competitively with supervised learning without large paired datasets or clean ground-truth images. It supports robust, photon-efficient, long-term, and low-phototoxicity imaging.', 'Self-inspired Noise2Noise是一种自监督学习降噪框架，无需大规模配对数据集或干净真值图像，性能可媲美监督学习，并支持稳健、光子高效、长时程和低光毒性成像。')
    .gsub('Adaptive SN2N introduces adaptive preprocessing and normalization to stabilize self-supervised learning across heterogeneous imaging conditions, improving robustness to intensity variation and background contamination while suppressing reconstruction artifacts.', 'Adaptive SN2N引入自适应预处理与归一化策略，使自监督学习在异质成像条件下更加稳定，并提高对强度变化和背景污染的稳健性，同时抑制重建伪影。')
    .gsub('We develop intelligent bioimage analysis methods and biomedical imaging instrumentation to enable automated, quantitative, and high-throughput biological investigation. Our work spans image segmentation, tracking, profiling, and representation learning, as well as compact, application-oriented imaging devices and systems.', '我们发展智能生物图像分析方法与生物医学成像仪器，服务于自动化、定量和高通量生物学研究。工作涵盖图像分割、追踪、分析和表征学习，以及紧凑、面向应用的成像装置与系统。')
    .gsub('Pixel-level analysis of error locations is a quantitative framework for mapping reconstruction errors at the super-resolution scale and systematically assessing conventional and deep-learning reconstruction methods.', '像素级误差位置分析是一种定量框架，可在超分辨尺度绘制重建误差，并系统评价传统及深度学习重建方法。')
    .gsub('A compact imaging-based platform for automated leukocyte concentration measurement and rapid hematological analysis.', '一种基于成像的紧凑型平台，用于白细胞浓度自动测量与快速血液学分析。')
    .gsub('Compact and flexible probes, initiated with MIRD, for single-shot high-resolution volumetric imaging, supported by new optical designs and computational imaging strategies.', '以MIRD为起点发展紧凑、灵活的探头，通过新型光学设计与计算成像策略实现单次曝光高分辨率体成像。')
    .gsub('This approach revealed how SARS-CoV-2 virus-like particles exploit filopodia through “surfing” and “grabbing” to reach cellular entry sites and reduce random searching on the plasma membrane.', '该方法揭示SARS-CoV-2病毒样颗粒如何通过沿丝状伪足“冲浪”和“抓取”到达细胞进入位点，从而减少其在质膜上的随机搜索。')
end

def timeline_en
  <<~HTML
    <h3 class="preview-latest-title">Latest News</h3>
    <ul class="preview-news-timeline">
      <li><time datetime="2026-08">2026-08</time><span>Our RIED work is online at <a href="https://www.nature.com/articles/s41586-026-10889-7">Nature</a>.</span></li>
      <li><time datetime="2026-07">2026-07</time><span>Congrats to Jiahui Gui, the Ph.D. student from the lab and co-first author, on the acceptance of our RIED work in <i>Nature</i>!</span></li>
      <li><time datetime="2026-04">2026-04</time><span>Congrats to Deer Su, the Ph.D. student from the lab, on successfully defending his Ph.D. dissertation!</span></li>
      <li><time datetime="2026-04">2026-04</time><span>Congrats to Deer Su, the Ph.D. student from the lab. Two studies advancing light-field endoscopic probes have been published in <a href="https://www.sciencedirect.com/science/article/pii/S0143816626002605">Optics and Lasers in Engineering</a> and <a href="https://opg.optica.org/oe/fulltext.cfm?uri=oe-34-8-15664">Optics Express</a>.</span></li>
      <li><time datetime="2026-02">2026-02</time><span>Congrats to Jiahui Gui, the Ph.D. student from the lab. <a href="https://www.biorxiv.org/content/10.64898/2026.02.04.703714v1">RIED</a> is released as a bioRxiv preprint with its <a href="https://github.com/SR-Wiki/RIEDm">MATLAB toolkit</a>.</span></li>
    </ul>
  HTML
end

def timeline_zh
  <<~HTML
    <h3 class="preview-latest-title">近期新闻</h3>
    <ul class="preview-news-timeline">
      <li><time datetime="2026-08">2026-08</time><span>RIED工作已在<a href="https://www.nature.com/articles/s41586-026-10889-7">Nature</a>在线发表。</span></li>
      <li><time datetime="2026-07">2026-07</time><span>祝贺课题组博士生、共同第一作者桂家辉，RIED工作被<i>Nature</i>接收！</span></li>
      <li><time datetime="2026-04">2026-04</time><span>祝贺课题组博士生苏德尔顺利通过博士学位论文答辩！</span></li>
      <li><time datetime="2026-04">2026-04</time><span>祝贺课题组博士生苏德尔！其两项光场内窥探头研究分别发表于<a href="https://www.sciencedirect.com/science/article/pii/S0143816626002605">Optics and Lasers in Engineering</a>和<a href="https://opg.optica.org/oe/fulltext.cfm?uri=oe-34-8-15664">Optics Express</a>。</span></li>
      <li><time datetime="2026-02">2026-02</time><span>祝贺课题组博士生桂家辉！<a href="https://www.biorxiv.org/content/10.64898/2026.02.04.703714v1">RIED</a>以bioRxiv预印本形式发布，并同步开放<a href="https://github.com/SR-Wiki/RIEDm">MATLAB工具箱</a>。</span></li>
    </ul>
  HTML
end

def refine(path, language)
  text = File.read(path)
  archive_start = text.index('<details class="preview-full-archive">')
  abort("No complete news archive found in #{path}") unless archive_start
  before_archive = text[0...archive_start]
  archive = text[archive_start..]
  cards = archive.scan(%r{<a class="news-social-card".*?</a>}m)
  cards = text.scan(%r{<a class="news-social-card".*?</a>}m) if cards.empty?
  abort("No legacy news cards found in #{path}") if cards.empty?
  archive.gsub!(%r{\s*<a class="news-social-card".*?</a>}m, "<br><br>")
  archive.gsub!(%r{(?:<br>\s*){3,}}, "<br><br>")
  archive.gsub!(%r{<br><br>\s*<hr>}, "<hr>")
  text = before_archive + archive
  research = language == :en ? research_en : research_zh
  text.sub!(%r{<section class="preview-section" aria-labelledby="research-heading">.*?</section>}m, research.strip)
  heading = language == :en ? "News Cards" : "新闻卡片"
  card_grid = "<h3 class=\"preview-featured-title\">#{heading}</h3>\n<div class=\"preview-all-cards-grid\">\n#{cards.join("\n")}\n</div>"
  text.sub!(%r{<h3 class="preview-featured-title">.*?</div>\s*<h3 class="preview-latest-title">}m, "#{card_grid}\n<h3 class=\"preview-latest-title\">")
  timeline = language == :en ? timeline_en : timeline_zh
  text.sub!(%r{<h3 class="preview-latest-title">.*?</ul>}m, timeline.strip)
  File.write(path, text)
  puts "#{File.basename(File.dirname(path))}/#{File.basename(path)}: #{cards.length} news cards"
end

refine(File.join(ROOT, "index.html"), :en)
refine(File.join(ROOT, "zh", "index.html"), :zh)
