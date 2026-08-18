require "fileutils"

ROOT = File.expand_path("..", __dir__)
ZH_DIR = File.join(ROOT, "zh")
SITE_URL = "https://weisongzhao.github.io".freeze

PAGES = %w[
  index.html team.html projects.html projects-archive.html open-source.html
  open-source-archive.html publications.html gallery.html contact.html 404.html
].freeze

NAV_LABELS = {
  "team.html" => "团队",
  "projects.html" => "项目",
  "open-source.html" => "开源",
  "publications.html" => "论文",
  "gallery.html" => "画廊",
  "contact.html" => "联系"
}.freeze

SEO = {
  "index.html" => {
    en_title: "Weisong Zhao Lab (赵唯淞课题组) | Biomedical Imaging",
    en_description: "Weisong Zhao (赵唯淞) Lab at Harbin Institute of Technology develops biomedical imaging, super-resolution microscopy, computational imaging, machine learning, and bioimage analysis methods.",
    zh_title: "赵唯淞课题组 | 生物医学显微成像与图像分析",
    zh_description: "哈尔滨工业大学赵唯淞课题组开展生物医学显微成像、超分辨显微成像、计算成像、机器学习与生物图像分析研究。"
  },
  "team.html" => {
    en_title: "Team | Weisong Zhao Lab",
    en_description: "Meet Weisong Zhao and the researchers, students, collaborators, and alumni of the Biomedical Imaging and Image Analysis Lab at Harbin Institute of Technology.",
    zh_title: "团队 | 赵唯淞课题组",
    zh_description: "哈尔滨工业大学赵唯淞课题组负责人、教师、学生、合作人员与已毕业成员介绍。"
  },
  "projects.html" => {
    en_title: "Projects | Weisong Zhao Lab",
    en_description: "Research projects from the Weisong Zhao Lab, including sparse deconvolution, SACD, RIED, SN2N, super-resolution microscopy, and biomedical image analysis.",
    zh_title: "项目 | 赵唯淞课题组",
    zh_description: "赵唯淞课题组的研究项目，包括稀疏解卷积、SACD、RIED、SN2N、超分辨显微成像与生物医学图像分析。"
  },
  "projects-archive.html" => {
    en_title: "Project Archive | Weisong Zhao Lab",
    en_description: "Archived research projects from the Weisong Zhao Lab in computational microscopy, biomedical imaging, and image reconstruction.",
    zh_title: "项目归档 | 赵唯淞课题组",
    zh_description: "赵唯淞课题组在计算显微成像、生物医学成像和图像重建方向的项目归档。"
  },
  "open-source.html" => {
    en_title: "Resources | Weisong Zhao Lab",
    en_description: "Research resources from the Weisong Zhao Lab, including code, papers, instruments, galleries, and imaging toolkits for Sparse deconvolution, SACD, RIED, PANEL, and SN2N.",
    zh_title: "开源 | 赵唯淞课题组",
    zh_description: "赵唯淞课题组发布的开源成像软件，包括稀疏解卷积、SACD、RIED、PANEL和SN2N工具箱。"
  },
  "open-source-archive.html" => {
    en_title: "Resource Archive | Weisong Zhao Lab",
    en_description: "Archived microscopy and image-analysis resources developed or maintained by the Weisong Zhao Lab.",
    zh_title: "开源软件归档 | 赵唯淞课题组",
    zh_description: "赵唯淞课题组开发或维护的显微成像与图像分析开源工具归档。"
  },
  "publications.html" => {
    en_title: "Publications | Weisong Zhao Lab",
    en_description: "Selected publications from Weisong Zhao and the lab in Nature, Nature Biotechnology, Nature Photonics, Nature Methods, and related journals.",
    zh_title: "论文 | 赵唯淞课题组",
    zh_description: "赵唯淞及课题组在Nature、Nature Biotechnology、Nature Photonics、Nature Methods等期刊发表的代表性论文。"
  },
  "gallery.html" => {
    en_title: "Gallery | Weisong Zhao Lab",
    en_description: "Biomedical and super-resolution microscopy image gallery from the Weisong Zhao Lab, with methods, samples, systems, objectives, and cameras documented.",
    zh_title: "画廊 | 赵唯淞课题组",
    zh_description: "赵唯淞课题组生物医学与超分辨显微成像画廊，包含方法、样品、系统、物镜和相机信息。"
  },
  "contact.html" => {
    en_title: "Contact | Weisong Zhao Lab",
    en_description: "Contact and recruitment information for the Weisong Zhao Lab at the School of Instrumentation Science and Engineering, Harbin Institute of Technology.",
    zh_title: "联系 | 赵唯淞课题组",
    zh_description: "哈尔滨工业大学仪器科学与工程学院赵唯淞课题组联系方式与招聘信息。"
  },
  "404.html" => {
    en_title: "Page Not Found | Weisong Zhao Lab",
    en_description: "The requested page could not be found on the Weisong Zhao Lab website.",
    zh_title: "页面未找到 | 赵唯淞课题组",
    zh_description: "未能在赵唯淞课题组网站中找到所请求的页面。",
    robots: "noindex, follow"
  }
}.freeze

SITE_SCHEMA = <<~HTML.strip.freeze
  <script type="application/ld+json" data-site-schema>
  {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "Person",
        "@id": "#{SITE_URL}/#weisong-zhao",
        "name": "Weisong Zhao",
        "alternateName": "赵唯淞",
        "url": "#{SITE_URL}/",
        "jobTitle": "Tenured Professor",
        "affiliation": {
          "@type": "CollegeOrUniversity",
          "name": "Harbin Institute of Technology"
        },
        "sameAs": [
          "https://homepage.hit.edu.cn/weisongzhao",
          "https://github.com/WeisongZhao",
          "https://x.com/weisong_zhao",
          "https://bsky.app/profile/weisong-zhao.bsky.social"
        ]
      },
      {
        "@type": "Organization",
        "@id": "#{SITE_URL}/#lab",
        "name": "Weisong Zhao Lab",
        "alternateName": "赵唯淞课题组",
        "url": "#{SITE_URL}/",
        "founder": { "@id": "#{SITE_URL}/#weisong-zhao" },
        "parentOrganization": {
          "@type": "CollegeOrUniversity",
          "name": "Harbin Institute of Technology"
        }
      },
      {
        "@type": "WebSite",
        "@id": "#{SITE_URL}/#website",
        "url": "#{SITE_URL}/",
        "name": "Weisong Zhao Lab",
        "alternateName": "赵唯淞课题组",
        "inLanguage": ["en", "zh-CN"],
        "publisher": { "@id": "#{SITE_URL}/#lab" }
      }
    ]
  }
  </script>
HTML

PROJECTS = {
  "SparseDecon" => [
    "稀疏解卷积",
    "<b>一种适用于荧光显微成像的通用后处理框架。</b>我们利用显微镜点扩散函数引入的稀疏性与连续性先验，开发了多约束解卷积算法；在低信噪比条件下，该算法可在现有显微成像硬件物理极限的基础上实现约两倍的分辨率提升。该方法已在多种显微成像模式中得到验证：<br>1. 宽场显微成像；<br>2. TIRF显微成像；<br>3. 光片显微成像；<br>4. 共聚焦显微成像；<br>5. 多光子显微成像；<br>6. 结构光照明显微成像；<br>7. 基于涨落的超分辨显微成像；<br>8. 膨胀显微成像；<br>9. STED显微成像；<br>10. 作为单分子定位显微成像的预处理方法。<br>该方法适用于单幅图像、时间序列和三维体数据。"
  ],
  "SACD" => [
    "基于涨落的超分辨成像",
    "SACD(基于自相关与两步解卷积的超分辨方法)是一种更快速的荧光涨落超分辨重建方法，所需帧数减少约50倍。<br>1. SACD仅需20帧图像即可实现横向和轴向分辨率约两倍提升。<br>2. SACD无需额外光学器件，可为商用显微镜或自建系统灵活增加直接超分辨成像能力。<br>3. 稀疏解卷积辅助SACD(Sparse-SACD)可实现快速四维活细胞超分辨成像。"
  ],
  "RIED" => [
    "反应发光超分辨成像",
    "RIED是一种面向极端光子受限反应发光成像的超分辨重建框架，适用于电化学发光(ECL)和生物发光(BL)。<br>1. RIED通过解码反应产生发光信号的内在时空涨落，在无需外部光激发或光化学调制的条件下实现超分辨成像。<br>2. 在约1,000倍细胞ECL信号增强的支持下，ECL-RIED可实现无背景三维细胞内成像，横向/轴向分辨率约96 nm/235 nm，成像速度最高0.5 fps。<br>3. BL-RIED无需激发光、光毒性低，可连续进行超过两天的活细胞超分辨成像。"
  ],
  "SN2N" => [
    "无监督学习降噪",
    "在活细胞超分辨(SR)显微成像中，每一个采集到的光子都十分宝贵。我们开发了一种数据高效的深度学习降噪方法，可改善多种SR成像模式。SN2N采用自启发Noise2Noise框架，包含自监督数据生成和自约束学习两个过程；其性能可媲美监督学习方法，却无需大规模训练集或干净真值，仅凭单幅含噪图像即可训练。实验表明，SN2N可将光子利用效率提高一至两个数量级，并适用于三维、多色和时间序列SR显微成像。我们还将SN2N集成到多种SR重建算法中，以有效抑制图像伪影。我们期待SN2N进一步改善活细胞SR成像并推动相关研究。"
  ],
  "SparseSIM" => [
    "超高速60 nm、564 Hz稀疏SIM",
    "稀疏解卷积辅助结构光照显微镜(Sparse-SIM)实现约60 nm空间分辨率和约2 ms时间分辨率(约564 Hz)，可在活细胞中观察囊泡融合孔以及线粒体内外膜之间的相对运动等快速精细过程。"
  ],
  "SparseSDSIM" => [
    "多色三维超分辨共聚焦显微成像",
    "稀疏解卷积辅助的转盘共聚焦超分辨显微方法(Sparse SD-SIM)可在较低光损伤条件下实现约90 nm横向分辨率，并支持三维、四色活细胞动态成像。"
  ],
  "PANEL" => [
    "局部图像质量定量评估",
    "PANEL(逐像素误差位置分析)是一套在超分辨尺度上定量绘制重建质量的框架，可用于评估传统方法和深度学习方法。rFRC(滚动傅里叶环相关)用于定量表征局部图像质量，包括有效分辨率和数据不确定性；有效分辨率越低，出现误差的概率越高，因此该指标可用于表征不确定性并揭示误差分布。PANEL进一步将滤波后的rFRC与截断的RSM(分辨率尺度误差图)结合，形成完整的误差定位图；没有宽场参考图像时，可关闭RSM这一可选功能。PANEL以简洁的可视化方式，帮助生物学研究人员直观定位可靠性较低的区域。"
  ],
  "informatics" => [
    "基于成像的生物医学信息学",
    "通过升级成像平台并结合智能分析算法，我们实现稳健、高通量的生物图像表型分析。例如，利用活细胞中的SARS-CoV-2单病毒样颗粒(VLP)追踪和稀疏解卷积算法，我们发现VLP通过丝状伪足以“滑行”和“抓取”两种模式到达进入位点，从而避免病毒在细胞质膜上随机搜索。"
  ],
  "endoscope" => [
    "单次曝光三维5 mm内窥探头",
    "我们采用精密加工的多微型成像器件(MIRD)，设计了一种高柔性、紧凑、单次曝光、三维高分辨率内窥探头。为进一步保持柔性，直径和高度均为5 mm的MIRD采用柔性聚酰胺封装，并通过软质数据线传输数据。该探头的最佳横向分辨率为31 µm、轴向分辨率为255 µm，成像体积超过2.3 × 2.3 × 10 mm³。该技术可通过自然腔道方便地进入生物体内部，并已通过兔胃和直肠观察实验验证。"
  ],
  "SOHA" => [
    "智能掌上型光流控血液分析仪",
    "我们设计了一种基于微型荧光显微镜和微流控平台的智能掌上型光流控血液分析仪，通过减轻设备质量提高便携性。该装置尺寸为35 × 30 × 80 mm、质量为39 g，不足商用流式细胞仪质量的5%。此外，通过集成图像处理与白细胞计数算法，实现了白细胞浓度自动检测。"
  ]
}.freeze

OPEN_SOURCE = {
  "Sparse-deconvolution" => "本仓库提供稀疏解卷积软件的最新版本。该软件是一种适用于荧光显微成像的通用后处理框架。<br><b>基本功能</b>：<br>1. 降噪；<br>2. 解卷积(三维分辨率提升)；<br>3. 上采样；<br>4. 去除背景(获得接近TIRF的成像效果)；<br>5. 去除伪影。",
  "SACD" => "1. SACD仅需20帧图像，即可实现横向和轴向分辨率约两倍提升。<br>2. SACD无需额外光学器件，可在商用显微镜或自建系统上灵活增加直接超分辨成像功能。<br>3. 稀疏解卷积辅助SACD(Sparse-SACD)可实现快速四维活细胞超分辨成像。",
  "RIED" => "1. RIED可在极端光子受限条件下实现反应发光的超分辨成像，包括生物发光(BL)和电化学发光(ECL)。<br>2. RIED无需外部光激发或光化学调制，通过提取微弱发光信号的内在时空涨落，实现高对比度超分辨重建。<br>3. 熵加权涨落解码与解卷积相结合，可实现稳健的二维和三维超分辨成像，将超分辨显微成像拓展到传统荧光成像之外。",
  "PANEL" => "rFRC(滚动傅里叶环相关)用于定量表征局部图像质量，包括有效分辨率和数据不确定性；有效分辨率越低，出现误差的概率越高，因此该指标可用于表征不确定性并揭示误差分布。PANEL进一步将滤波后的rFRC与截断的RSM(分辨率尺度误差图)结合，形成完整的逐像素误差定位图；没有宽场参考图像时，可关闭RSM这一可选功能。PANEL以简洁的可视化方式，帮助生物学研究人员直观定位可靠性较低的区域。",
  "SN2N" => "SN2N(自启发Noise2Noise)的性能可媲美监督学习方法，同时无需大规模数据集或干净真值。首先，我们利用超分辨图像的空间冗余构建自监督数据生成策略，通过对角重采样和傅里叶插值实现单帧Noise2Noise。随后引入自约束学习过程，以进一步提升性能和数据效率。最后，我们提供Patch2Patch数据增强策略，通过在多个维度上随机变换图块，进一步提高数据效率。<br><b>基本功能</b>：<br>1. 无监督学习降噪；<br>2. 数据增强。",
  "ImagePy" => "ImagePy是一个使用Python编写的开源图像处理框架。其用户界面、图像数据结构和表格数据结构分别基于wxPython、NumPy和pandas。此外，它支持任何基于NumPy和pandas的插件，并可方便地与scipy.ndimage、scikit-image、SimpleITK、OpenCV及其他图像处理库协同工作。<br><b>Python风格的ImageJ：</b><br>1. 具有友好的用户界面；<br>2. 可读取和保存多种图像数据格式；<br>3. 支持ROI设置、绘图、测量及其他鼠标操作；<br>4. 可执行图像滤波、形态学处理及其他常规操作；<br>5. 可进行图像分割、区域计数、几何测量和密度分析；<br>6. 可对从图像中提取的参数执行数据分析、筛选和统计分析等操作；<br>7. 易于在机器学习应用中使用和扩展。",
  "Bayes-LFM" => "该方法实现无伪影、衍射极限分辨率的单次曝光三维显微成像，为活细胞三维生物成像提供新路径。本仓库提供用于LFM体数据重建的MATLAB工具箱(含图形界面)。<br><b>基本功能</b>：<br>1. 计算光场点扩散函数；<br>2. 图像校正；<br>3. 重建光场体数据；<br>4. 贝叶斯重建；<br>5. 自动追踪线粒体动态。"
}.freeze

ARCHIVE_TOOLS = {
  "img2vid" => "一个轻量级MATLAB工具，用于将已有图像序列快速转换为视频。",
  "AMF" => "一种用于共聚焦类显微图像的自适应滤波器，可去除孤立像素。共聚焦类图像中经常出现由电压不稳定、坏点或热点引起的极亮孤立像素(1×1～5×5)。这些像素的强度约为正常生物结构信号幅值的5至100倍，不适合后续分析或处理。",
  "t-varianceJ" => "一个用于计算时间轴方差的简易FIJI/ImageJ插件，可辅助分析钙信号，并突出显示存在瞬态钙信号的区域。",
  "Palette" => "通道合并：一款用于多色二维或三维成像的工具。该工具可调节4个颜色通道分量(RGB)、增益(显示亮度)和伽马值(调整直方图，使图像显示更自然)。",
  "adaptive-optics" => "用于无波前传感器自适应光学的仿真工具，适用于共聚焦显微镜和模式法。该仿真使用第5至22阶Zernike多项式在光瞳面生成带像差的点扩散函数，并采用不同方法进行校正。",
  "web-template" => "本网站使用的简洁网页模板，改编自Modern Business模板。"
}.freeze

ARCHIVE_TOOL_TITLES = {
  "adaptive-optics" => "无波前传感器自适应光学仿真",
  "web-template" => "网页模板"
}.freeze

PROJECT_ARCHIVE = {
  "Bayes Light-field microscopy" => ["贝叶斯光场显微成像", "无伪影、衍射极限分辨率的单次曝光三维显微成像方法，为活体三维生物成像提供新的技术路径。图中为线粒体深度编码三维图像：左侧为高分辨率LFM，右侧为Bayes-LFM，成像速度50 Hz。"],
  "Miniaturized light-field microscopy" => ["微型化光场显微成像", "用于自由活动啮齿动物神经活动的高速三维体成像，为神经科学观察提供新的技术手段。"],
  "Label-free super-resolution imaging (SPoSI)" => ["无标记超分辨成像(SPoSI)", "一种具有低成本、低光损伤活细胞超分辨成像潜力的方法。"],
  "Towards one-button deep-learning microscopy" => ["面向一键式深度学习显微成像", "由深度学习驱动的显微镜控制、图像采集与处理框架。"]
}.freeze

def english_switcher(page)
  <<~HTML.strip
    <li class="nav-item language-switcher" role="group" aria-label="Language">
      <a class="nav-link language-link" href="zh/#{page}" lang="zh-CN" hreflang="zh-CN">中文</a>
      <span class="language-divider" aria-hidden="true">/</span>
      <span class="nav-link language-link" lang="en" aria-current="page">EN</span>
    </li>
  HTML
end

def chinese_nav(page)
  links = NAV_LABELS.map { |href, label| %(<li class="nav-item"><a class="nav-link" href="#{href}">#{label}</a></li>) }.join("\n        ")
  brand = page == "index.html" ? "赵唯淞课题组" : "首页"
  <<~HTML
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.html">#{brand}</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="展开导航">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            #{links}
            <li class="nav-item language-switcher" role="group" aria-label="语言">
              <span class="nav-link language-link" lang="zh-CN" aria-current="page">中文</span>
              <span class="language-divider" aria-hidden="true">/</span>
              <a class="nav-link language-link" href="../#{page}" lang="en" hreflang="en">EN</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  HTML
end

def translate_common(text)
  replacements = {
    "<title>Zhao's Lab</title>" => "<title>赵唯淞课题组</title>",
    ">Home<" => ">首页<", ">Team<" => ">团队<", ">Projects<" => ">项目<", ">Research<" => ">项目<",
    ">Open-source<" => ">开源<", ">Resources<" => ">开源<", ">Publications<" => ">论文<", ">Gallery<" => ">画廊<",
    ">Contact<" => ">联系<", ">Paper\n" => ">论文\n", ">Code\n" => ">代码\n",
    ">Preprint\n" => ">预印本\n", ">Software\n" => ">软件\n", ">Instrument\n" => ">仪器\n",
    "Principal Investigator" => "课题组负责人", "Associate Investigator" => "合作研究人员",
    "Staff & Students" => "教职工与学生", "Mentors & Collaborators" => "导师与合作者",
    "Alumni" => "已毕业成员", "Selected Funding" => "代表性科研项目",
    "Selected Honors & Awards" => "代表性荣誉与奖励", "Selected Professional Service" => "代表性学术服务",
    "Selected publications" => "代表性论文", "Other projects" => "其他项目", "Other Research" => "其他项目",
    "Other useful tools" => "其他实用工具", "Contact Details" => "联系方式",
    "<b>Authors</b>" => "<b>作者</b>", "<b>Journal</b>" => "<b>期刊</b>",
    "<b>Keywords</b>" => "<b>关键词</b>", "Google Scholar" => "谷歌学术",
    "<b>Basic features</b>" => "<b>基本功能</b>", "<b>Sample</b>" => "<b>样品</b>",
    "<b>Label</b>" => "<b>标记</b>", "<b>Description</b>" => "<b>说明</b>",
    "<b>System</b>" => "<b>系统</b>", "<b>Objective</b>" => "<b>物镜</b>",
    "<b>Camera</b>" => "<b>相机</b>", "<b>Cell line</b>" => "<b>细胞系</b>",
    ">Link to the paper" => ">论文", ">System paper" => ">系统论文",
    ">Link to the pre-print" => ">查看预印本", ">Previous<" => ">上一页<", ">Next<" => ">下一页<",
    "Copyright &copy; Weisong Zhao" => "版权所有 &copy; 赵唯淞"
  }
  replacements.each { |from, to| text.gsub!(from, to) }
  {
    "Home" => "首页", "Team" => "团队", "Projects" => "项目", "Research" => "项目",
    "Open-source" => "开源", "Resources" => "开源", "Publications" => "论文", "Gallery" => "画廊",
    "Contact" => "联系", "Paper" => "论文", "Code" => "代码",
    "Preprint" => "预印本", "Software" => "软件", "Instrument" => "仪器"
  }.each do |from, to|
    text.gsub!(/>#{Regexp.escape(from)}(\s*)</, ">#{to}\\1<")
  end
  text.gsub!(/>Previous(\s*)</, ">上一页\\1<")
  text.gsub!(/>Next(\s*)</, ">下一页\\1<")
  text.gsub!('aria-label="Previous"', 'aria-label="上一页"')
  text.gsub!('aria-label="Next"', 'aria-label="下一页"')
  text.gsub!("All rights reserved – please contact <a href=\"contact.html\">Weisong Zhao</a> if you want to use these images.",
             "图片保留所有权利；如需使用，请联系<a href=\"contact.html\">赵唯淞</a>。")
  text
end

def translate_home(text)
  replacements = {
    "Tailored Microscopes for Biomedical Research Across Scales" => "面向跨尺度生物医学研究的定制化显微成像技术",
    "The Lab of Biomedical Imaging & Image Analysis" => "生物医学成像与图像分析课题组",
    "Self-inspired learning to denoise" => "自启发学习降噪",
    "Monitoring the cell mitosis processes" => "观察细胞有丝分裂过程",
    "Tracking the organelle interactions" => "追踪细胞器相互作用",
    "Unsupervised learning engine, which is fully competitive with the supervised learning methods, without requiring a large dataset or clean ground truth." => "无需大规模数据集或干净真值、性能可媲美监督学习方法的无监督学习引擎。",
    "3D RL-SN2N on SD-SIM: ER (magenta), Mito (green), &amp; nucleus (blue)." => "在SD-SIM图像上应用三维RL-SN2N：内质网(洋红)、线粒体(绿色)和细胞核(蓝色)。",
    "Four-color RL-SN2N on SD-SIM: ER (gray), Mito (green), Golgi (blue) &amp; lysosome (red)." => "在SD-SIM图像上应用四色RL-SN2N：内质网(灰色)、线粒体(绿色)、高尔基体(蓝色)和溶酶体(红色)。",
    "High-throughput super-resolution microscopy" => "高通量超分辨显微成像",
    "Direct and automatic super-resolution by SACD (2 mm × 1.4 mm, 128 nm resolution, ~10 min, microtubules)." => "利用SACD直接、自动实现超分辨成像(2 mm × 1.4 mm，分辨率128 nm，约10分钟，微管)。",
    "60 nm and 564 Hz, mitochondrial cristae (cyan) and ER (magenta)." => "空间分辨率60 nm、成像速度564 Hz；线粒体嵴(青色)和内质网(洋红)。",
    "Super-resolution local quality rating" => "超分辨图像局部质量评估",
    " Single-molecule localization microscopy, STORM, local quality rating by rFRC (41 μm × 41 μm, microtubules)." => " 单分子定位显微成像(STORM)，利用rFRC评估局部图像质量(41 μm × 41 μm，微管)。",
    "Fast 4D super-resolution imaging" => "快速四维超分辨成像",
    "SACD using 20 frames, without needing additional optical components (67 μm × 67 μm, 135 nm × 334 nm resolution, mitochondrial outer membrane)." => "SACD仅使用20帧图像且无需额外光学器件(67 μm × 67 μm，分辨率135 nm × 334 nm，线粒体外膜)。",
    "Multi-color 3D spinning-disk confocal SIM (SD-SIM) imaging" => "多色三维转盘共聚焦SIM(SD-SIM)成像",
    "Four-color imaging with ＜3% photon dose (90 nm × 260 nm resolution): microtubules (red), nucleus (blue), lysosomes (yellow), and mitochondria (green)." => "以低于3%的光子剂量实现四色成像(分辨率90 nm × 260 nm)：微管(红色)、细胞核(蓝色)、溶酶体(黄色)和线粒体(绿色)。",
    "Data-driven microscopy" => "数据驱动显微成像",
    "Using deep learning to reduce the photon, time, and hardware requirements of microscopy." => "利用深度学习降低显微成像对光子数、采集时间和硬件的要求。",
    "Bayes light-field microscopy" => "贝叶斯光场显微成像",
    "Artifact-free, single-shot 3D microscopy for live-cell imaging (48 μm × 24 μm, 240 nm × 310 nm resolution, 20 Hz, depth-coded mitochondrial 3D volumes)." => "用于活细胞成像的无伪影、单次曝光三维显微成像(48 μm × 24 μm，分辨率240 nm × 310 nm，20 Hz，深度编码的线粒体三维体数据)。",
    "Microscopy: Systems & Algorithms" => "显微成像：系统与算法",
    "Microscopy: Systems &amp; Algorithms" => "显微成像：系统与算法",
    "Machine learning: Methods & Applications" => "机器学习：方法与应用",
    "Machine learning: Methods &amp; Applications" => "机器学习：方法与应用",
    "Smart Bioimage Analysis & Biomedical Devices" => "智能生物图像分析与生物医学装置",
    "Smart Bioimage Analysis &amp; Biomedical Devices" => "智能生物图像分析与生物医学装置",
    "We focus on developing advanced biomedical imaging technologies across modalities. Our research spans new imaging physics, bottom-up system design, and the co-design of hardware and computational algorithms tailored to specific imaging scenarios. We aim to optimize spatial, temporal, and information resolution under practical constraints such as photon or signal budget, acquisition speed, imaging depth, and system complexity." => "我们致力于发展跨模态的先进生物医学成像技术，研究涵盖新型成像物理、自底向上的系统设计，以及面向具体成像场景的硬件与计算算法协同设计。我们希望在光子或信号预算、采集速度、成像深度和系统复杂度等实际约束下，优化空间、时间与信息分辨能力。",
    "is a physics-informed reconstruction framework that exploits sparsity and structural continuity to enhance resolution, contrast, and SNR beyond the limits of microscopy, particularly under low-SNR conditions. Applications include <a href=\"projects.html#SparseSIM\">Sparse-SIM</a> and <a href=\"projects.html#SparseSDSIM\">Sparse SD-SIM</a>." => "是一种物理信息驱动的重建框架，利用稀疏性与结构连续性突破显微成像系统的既有性能限制，提升分辨率、对比度和信噪比，尤其适用于低信噪比条件。相关应用包括<a href=\"projects.html#SparseSIM\">Sparse-SIM</a>和<a href=\"projects.html#SparseSDSIM\">Sparse SD-SIM</a>。",
    "is a fluctuation-based super-resolution framework that achieves approximately threefold lateral and axial resolution enhancement using only 20 frames (10 min for a 2 mm × 1.4 mm FOV), without additional optical components. Sparse-SACD further enables fast 4D live-cell super-resolution imaging. See also our label-free SACD <a href=\"https://www.nature.com/articles/s41377-025-01914-x\">[Light: Science &amp; Applications, 2025]</a>." => "是一种基于涨落的超分辨框架，仅使用20帧图像即可将横向和轴向分辨率提高约三倍(2 mm × 1.4 mm视场约需10分钟)，且无需额外光学器件。Sparse-SACD还可实现快速四维活细胞超分辨成像。另见我们的无标记SACD工作<a href=\"https://www.nature.com/articles/s41377-025-01914-x\">[Light: Science &amp; Applications, 2025]</a>。",
    "is a reaction-luminescence super-resolution framework for extremely photon-limited bioluminescence (BL) and electrochemiluminescence (ECL). By decoding intrinsic luminescence fluctuations, RIED enables high-contrast 2D and 3D super-resolution imaging without external optical excitation or photochemical modulation. BL-RIED supports continuous super-resolution imaging for over two days." => "是一种面向极端光子受限生物发光(BL)和电化学发光(ECL)的反应发光超分辨框架。通过解码内在发光涨落，RIED无需外部光激发或光化学调制即可实现高对比度二维和三维超分辨成像。BL-RIED支持连续超过两天的超分辨成像。",
    "We develop machine-learning methods for the reconstruction and analysis of multidimensional biomedical and natural signals. We exploit both explicit physical and structural priors to design interpretable computational models, and data-driven priors to develop deep-learning approaches for problems that are difficult to address with conventional methods. Our work includes self-supervised learning, representation learning, Bayesian learning, and foundation models, with applications ranging from reducing the photon, acquisition-time, and hardware requirements of microscopy to accelerating biological image reconstruction, profiling, and discovery." => "我们发展面向多维生物医学与自然信号重建、分析的机器学习方法：一方面利用显式的物理与结构先验设计可解释计算模型，另一方面利用数据驱动先验解决传统方法难以处理的问题。研究涵盖自监督学习、表征学习、贝叶斯学习和基础模型，应用包括降低显微成像对光子数、采集时间与硬件的需求，以及加速生物图像重建、表型分析与科学发现。",
    "(Self-inspired Noise2Noise) is a self-supervised learning-to-denoise framework that achieves performance competitive with supervised learning while eliminating the need for large paired datasets and clean ground-truth images. It enables robust denoising across diverse biomedical imaging modalities and supports photon-efficient, long-term, and low-phototoxicity imaging." => "(自启发Noise2Noise)是一种自监督学习降噪框架，性能可媲美监督学习，同时无需大规模配对数据集或干净真值图像。它可对多种生物医学成像数据进行稳健降噪，并支持高光子利用率、长时程和低光毒成像。",
    "(adaptive SN2N) introduces adaptive preprocessing and normalization strategies to stabilize self-supervised learning across heterogeneous imaging conditions. It improves robustness to intensity variations and background contamination while effectively suppressing reconstruction artifacts." => "(自适应SN2N)引入自适应预处理和归一化策略，使自监督学习在异质成像条件下保持稳定。该方法在有效抑制重建伪影的同时，提高了对强度变化和背景污染的稳健性。",
    "We develop intelligent bioimage analysis methods and biomedical imaging instrumentation to enable automated, quantitative, and high-throughput biological investigation. Our work spans image segmentation, tracking, profiling, and representation learning, as well as the development of compact, application-oriented imaging devices and systems." => "我们发展智能生物图像分析方法和生物医学成像仪器，以支持自动化、定量化和高通量生物学研究。研究涵盖图像分割、追踪、表型分析和表征学习，以及紧凑型、面向应用的成像装置与系统开发。",
    "(pixel-level analysis of error locations) is a quantitative framework for mapping reconstruction errors at the super-resolution scale, enabling systematic assessment of both conventional and deep-learning-based reconstruction methods." => "(逐像素误差位置分析)是一种在超分辨尺度上绘制重建误差的定量框架，可系统评估传统重建方法和基于深度学习的重建方法。",
    "is a compact imaging-based platform for automated leukocyte concentration measurement and rapid hematological analysis." => "是一种基于紧凑成像平台的装置，用于自动测量白细胞浓度和快速血液学分析。",
    "initiated with MIRD (multiple micro-imaging devices), provide highly flexible and compact probes for single-shot, high-resolution volumetric imaging. We continue to develop new optical designs and computational imaging strategies to improve imaging performance, probe flexibility, and practical applicability. See also <a href=\"https://www.sciencedirect.com/science/article/pii/S0143816626002605\">[Optics and Lasers in Engineering, 2026]</a> and <a href=\"https://opg.optica.org/oe/fulltext.cfm?uri=oe-34-8-15664\">[Optics Express, 2026]</a>." => "光场内窥探头以MIRD(多微型成像器件)为起点，通过高柔性、紧凑型探头实现单次曝光的高分辨率体成像。我们持续探索新的光学设计与计算成像策略，以进一步提升成像性能、探头柔性和实用性。另见<a href=\"https://www.sciencedirect.com/science/article/pii/S0143816626002605\">[Optics and Lasers in Engineering, 2026]</a>和<a href=\"https://opg.optica.org/oe/fulltext.cfm?uri=oe-34-8-15664\">[Optics Express, 2026]</a>。",
    "was applied to reveal how SARS-CoV-2 virus-like particles exploit filopodia to reach cellular entry sites through two distinct modes, “surfing” and “grabbing”, thereby reducing random searching on the plasma membrane. See also <a href=\"https://www.sciencedirect.com/science/article/pii/S0171933525000305\">[European Journal of Cell Biology, 2025]</a>." => "用于揭示SARS-CoV-2病毒样颗粒如何借助丝状伪足，以“滑行”和“抓取”两种不同模式到达细胞进入位点，从而减少在细胞质膜上的随机搜索。另见<a href=\"https://www.sciencedirect.com/science/article/pii/S0171933525000305\">[European Journal of Cell Biology, 2025]</a>。",
    "We develop advanced biomedical imaging technologies across modalities, spanning new imaging physics, bottom-up system design, and hardware–algorithm co-design for practical imaging constraints." => "我们面向多种成像模态发展先进生物医学成像技术，研究涵盖新型成像物理、自底向上的系统设计，以及针对实际成像约束的硬件—算法协同设计。",
    "We develop interpretable and data-driven learning methods for reconstructing and analyzing multidimensional biomedical and natural signals." => "我们面向多维生物医学与自然信号的重建和分析，发展兼具可解释性与数据驱动能力的机器学习方法。",
    "We develop intelligent bioimage analysis methods and compact biomedical imaging instrumentation for automated, quantitative, and high-throughput biological investigation." => "我们发展智能生物图像分析方法与紧凑型生物医学成像仪器，支持自动化、定量化和高通量生物学研究。",
    "A physics-informed reconstruction framework that exploits sparsity and structural continuity to improve resolution, contrast, and SNR, especially under low-SNR conditions." => "利用稀疏性与结构连续性的物理信息重建框架，尤其适合在低信噪比条件下提升分辨率、对比度与信噪比。",
    "A fluctuation-based super-resolution framework that provides about threefold lateral and axial resolution enhancement from only 20 frames without additional optical components." => "基于涨落的超分辨成像框架，无需增加光学器件，仅使用20帧图像即可显著提升横向与轴向分辨率。",
    "A reaction-luminescence super-resolution framework for extremely photon-limited bioluminescence and electrochemiluminescence imaging." => "面向极端光子受限的生物发光与电化学发光成像的反应发光超分辨框架。",
    "A self-supervised denoising framework competitive with supervised learning without requiring paired datasets or clean ground truth." => "无需配对数据集或干净真值图像、性能可媲美监督学习的自监督降噪框架。",
    "Adaptive preprocessing and normalization stabilize self-supervised learning across heterogeneous imaging conditions." => "通过自适应预处理与归一化，使自监督学习在异质成像条件下保持稳定。",
    "A pixel-level framework for mapping reconstruction errors at the super-resolution scale." => "在超分辨尺度上逐像素定位和量化重建误差的分析框架。",
    "A compact imaging platform for automated leukocyte concentration measurement and rapid hematological analysis." => "用于自动白细胞浓度测量与快速血液学分析的紧凑成像平台。",
    "Flexible and compact probes for single-shot, high-resolution volumetric imaging using optical design and computational reconstruction." => "通过光学设计与计算重建实现单次曝光、高分辨率体成像的柔性紧凑探头。",
    "From imaging physics and instrumentation to computational reconstruction and system–algorithm co-design." => "从成像物理与仪器研制，到计算重建和系统—算法协同设计。",
    "From physical and structural priors to self-supervised, representation, and foundation-model learning." => "从物理与结构先验，到自监督学习、表征学习和基础模型。",
    "From quantitative bioimage analysis to compact and application-oriented biomedical devices." => "从定量生物图像分析到紧凑、面向应用的生物医学装置。",
    "Representative developed techniques:" => "代表性技术：", "Learn More" => "了解更多",
    "News from the Lab" => "课题组新闻", "News" => "新闻"
  }
  replacements.each { |from, to| text.gsub!(from, to) }
  text.gsub!(">Smart palm-size optofluidic hematology analyzer<", ">智能掌上型光流控血液分析仪<")
  text.gsub!(">Light-field endoscopic probes<", ">光场内窥探头<")
  text.gsub!(">Sparse confocal microscopy with single-particle tracking<", ">稀疏共聚焦显微成像与单颗粒追踪<")
  text.gsub!("alt=\"Microscopy systems and algorithms\"", "alt=\"显微成像系统与算法\"")
  text.gsub!("alt=\"Machine learning for biomedical imaging\"", "alt=\"面向生物医学成像的机器学习\"")
  text.gsub!("alt=\"Smart bioimage analysis and biomedical devices\"", "alt=\"智能生物图像分析与生物医学装置\"")
  news = <<~HTML
    <h4 class="card-header">课题组新闻</h4>
    <div class="card-body">
      <div class="card-text">
        <b style="color:#dc3545;">2026-08：</b> RIED工作已在<a href="https://www.nature.com/articles/s41586-026-10889-7">Nature</a>在线发表。
        <a class="news-social-card" href="https://x.com/weisong_zhao/status/2087588848159330551" target="_blank" rel="noopener noreferrer" aria-label="在X查看RIED帖子">
          <span class="news-social-card-media"><img src="https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41586-026-10889-7/MediaObjects/41586_2026_10889_Fig1_HTML.png" alt="RIED论文预览图" loading="lazy" decoding="async" onerror="this.onerror=null;this.src='../img/projects/RIEDfig1.png';"></span>
          <span class="news-social-card-body"><span class="news-social-card-meta">X · 2026年8月12日</span><strong>RIED发表于Nature</strong><span>一种无激发超分辨显微成像新范式，适用于电化学发光、化学发光和生物发光。</span><span class="news-social-card-link">在X查看原帖 ↗</span></span>
        </a>
        <b>2026-07：</b> 祝贺课题组博士生、共同第一作者桂家辉，RIED工作被<i>Nature</i>接收！<br><br>
        <b style="color:#dc3545;">2026-04：</b> 祝贺课题组博士生苏德尔顺利通过博士学位论文答辩！<br><br>
        <b>2026-04：</b> 祝贺课题组博士生苏德尔！其两项光场内窥探头研究分别发表于<a href="https://www.sciencedirect.com/science/article/pii/S0143816626002605">Optics and Lasers in Engineering</a>和<a href="https://opg.optica.org/oe/fulltext.cfm?uri=oe-34-8-15664">Optics Express</a>。<br><br>
        <b>2026-02：</b> 祝贺课题组博士生桂家辉！<a href="https://www.biorxiv.org/content/10.64898/2026.02.04.703714v1">RIED</a>以bioRxiv预印本形式发布，并同步开放<a href="https://github.com/SR-Wiki/RIEDm">MATLAB</a>工具箱。<hr>
        <b>2025-09：</b> 课题组PI晋升为哈尔滨工业大学<a href="http://homepage.hit.edu.cn/weisongzhao">长聘教授</a>。<br><br>
        <b>2025-09：</b> 祝贺课题组合作研究人员曲丽颖！其关于SN2N的述评发表于<a href="https://onlinelibrary.wiley.com/doi/10.1002/ctm2.70390">Clinical and Translational Medicine</a>。<br><br>
        <b>2025-08：</b> <a href="https://doi.org/10.1101/2025.08.20.671215">FLAME</a>以预印本形式发布，同时开放<a href="https://github.com/SR-Wiki/FLAMEm">MATLAB</a>工具箱。<br><br>
        <b>2025-08：</b> 合作研究EPSLON发表于<a href="https://www.nature.com/articles/s41377-025-01914-x">Light: Science &amp; Applications</a>。<br><br>
        <b>2025-07：</b> <a href="https://github.com/SR-Wiki/">SR-Wiki</a>成为课题组发布最新成像与分析工具的官方GitHub组织，集中提供课题组成像工具的实现。<br><br>
        <b>2025-06：</b> 祝贺课题组博士生朱竞阳！Adaptive SN2N发表于<a href="https://www.sciengine.com/PXLIFE/doi/10.3724/PXLIFE.2025-0010">PhotoniX Life</a>。<br><br>
        <b>2025-04：</b> 祝贺曲丽颖顺利通过博士学位论文答辩！<hr>
        <b style="color:#dc3545;">2024-09：</b> SN2N工作已在<a href="https://www.nature.com/articles/s41592-024-02400-9">Nature Methods</a>在线发表。
        <a class="news-social-card" href="https://x.com/weisong_zhao/status/1833799125596557485" target="_blank" rel="noopener noreferrer" aria-label="在X查看SN2N帖子">
          <span class="news-social-card-media"><img src="https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41592-024-02400-9/MediaObjects/41592_2024_2400_Fig1_HTML.png" alt="SN2N论文预览图" loading="lazy" decoding="async" onerror="this.onerror=null;this.src='../img/projects/SN2Npro.jpg';"></span>
          <span class="news-social-card-body"><span class="news-social-card-meta">X · 2024年9月11日</span><strong>SN2N发表于Nature Methods</strong><span>一种媲美监督学习的无监督去噪方法，仅用单幅含噪图像训练，无需干净的真值图像。</span><span class="news-social-card-link">在X查看原帖 ↗</span></span>
        </a>
        <b>2024-08：</b> 课题组PI获国家自然科学基金优秀青年科学基金项目资助。<br><br>
        <b>2024-06：</b> 祝贺课题组博士生曲丽颖和黄园园！<a href="https://doi.org/10.1101/2024.01.23.576521">SN2N</a>已被<i>Nature Methods</i>接收。<br><br>
        <b>2024-01：</b> 祝贺课题组博士生曲丽颖和黄园园！<a href="https://doi.org/10.1101/2024.01.23.576521">SN2N</a>以bioRxiv预印本形式发布(已投稿<i>Nature Methods</i>)，并同步开放<a href="https://github.com/WeisongZhao/SN2N">Python</a>工具箱。<br><br>
        <b>2024-01：</b> Ke Xu博士在<i>Light: Science &amp; Applications</i>发表题为“Mapping super-resolution image quality”的<a href="https://www.nature.com/articles/s41377-024-01379-4">新闻与观点</a>文章，评述我们的<i>rFRC</i>工作。
        <a class="news-social-card" href="https://www.nature.com/articles/s41377-024-01379-4" target="_blank" rel="noopener noreferrer" aria-label="阅读《绘制超分辨图像质量》">
          <span class="news-social-card-media news-social-card-media--contain"><img src="https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41377-024-01379-4/MediaObjects/41377_2024_1379_Figa_HTML.png" alt="绘制超分辨图像质量论文预览图" loading="lazy" decoding="async" onerror="this.onerror=null;this.src='../img/projects/PANEL.png';"></span>
          <span class="news-social-card-body"><span class="news-social-card-meta">Light: Science &amp; Applications · 新闻与观点</span><strong>绘制超分辨图像质量</strong><span>Ke Xu博士撰写的新闻与观点文章，评述我们利用rFRC定量绘制局部超分辨图像质量的工作。</span><span class="news-social-card-link">阅读文章 ↗</span></span>
        </a>
        <b>2024-01：</b> 课题组PI受聘为<a href="http://homepage.hit.edu.cn/weisongzhao">教授</a>。<br><br>
        <b>2024-01：</b> 课题组PI现任<a href="https://www.nature.com/npjimaging/editors">npj Imaging</a>副主编。
        <a class="news-social-card" href="https://www.nature.com/npjimaging/editors" target="_blank" rel="noopener noreferrer" aria-label="查看npj Imaging编辑委员会">
          <span class="news-social-card-media news-social-card-media--contain"><img src="../img/news/npj.png" alt="npj Imaging编辑委员会预览图" loading="lazy" decoding="async"></span>
          <span class="news-social-card-body"><span class="news-social-card-meta">npj Imaging · 编辑委员会</span><strong>担任npj Imaging副主编</strong><span>课题组PI现任npj Imaging副主编。</span><span class="news-social-card-link">查看编辑委员会 ↗</span></span>
        </a>
        <hr>
        <b style="color:#dc3545;">2023-12：</b> <i>rFRC</i>工作已在<a href="https://www.nature.com/articles/s41377-023-01321-0">Light: Science &amp; Applications</a>在线发表。
        <a class="news-social-card" href="https://x.com/weisong_zhao/status/1735287113766355412" target="_blank" rel="noopener noreferrer" aria-label="在X查看rFRC帖子">
          <span class="news-social-card-media"><img src="https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41377-023-01321-0/MediaObjects/41377_2023_1321_Figa_HTML.png" alt="rFRC论文预览图" loading="lazy" decoding="async" onerror="this.onerror=null;this.src='../img/projects/PANEL.png';"></span>
          <span class="news-social-card-body"><span class="news-social-card-meta">X · 2023年12月14日</span><strong>rFRC发表于Light: Science &amp; Applications</strong><span>一种在相应超分辨尺度上评估超分辨图像质量的工具。</span><span class="news-social-card-link">在X查看原帖 ↗</span></span>
        </a>
        <b>2023-12：</b> 在<a href="https://communities.springernature.com/posts/a-nice-piece-of-the-puzzle-for-super-resolution-microscopy">Nature Research Community</a>发布关于<i>rFRC</i>的“论文背后”博客。<br><br>
        <b>2023-12：</b> 祝贺课题组博士生苏德尔！<i>Smart palm-size optofluidic hematology analyzer</i>受邀发表于<a href="https://doi.org/10.29026/oes.2023.230018">Opto-Electronic Science</a>。<br><br>
        <b>2023-12：</b> 祝贺课题组博士生苏德尔！<i>MIRD volumetric endoscope</i>发表于<a href="https://doi.org/10.1364/OL.506261">Optics Letters</a>，并入选第48卷<a href="https://opg.optica.org/ol/issue.cfm?volume=48&issue=24">第24期</a>特色图片。<br><br>
        <b>2023-09：</b> David Baddeley博士在<a href="https://www.nature.com/articles/s41566-023-01275-0">Nature Photonics</a>发表题为“Deconvolution enhances fluctuation detection”的新闻与观点文章，评述我们的<i>SACD</i>工作。
        <a class="news-social-card" href="https://www.nature.com/articles/s41566-023-01275-0" target="_blank" rel="noopener noreferrer" aria-label="阅读《解卷积增强涨落检测》">
          <span class="news-social-card-media news-social-card-media--contain"><img src="https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41566-023-01275-0/MediaObjects/41566_2023_1275_Fig1_HTML.png" alt="解卷积增强涨落检测论文预览图" loading="lazy" decoding="async" onerror="this.onerror=null;this.src='../img/projects/SACD.png';"></span>
          <span class="news-social-card-body"><span class="news-social-card-meta">Nature Photonics · 新闻与观点</span><strong>解卷积增强涨落检测</strong><span>David Baddeley博士撰写的新闻与观点文章，评述我们的SACD工作及其两步解卷积流程。</span><span class="news-social-card-link">阅读文章 ↗</span></span>
        </a>
        <b style="color:#dc3545;">2023-09：</b> <i>SACD</i>入选<a href="https://www.nature.com/nphoton/volumes/17/issues/9">Nature Photonics 2023年9月第17卷第9期</a>封面文章。<br><br>
        <b>2023-08：</b> 我们与Yaming Jiu课题组利用<i>稀疏解卷积</i>增强的共聚焦显微成像，揭示SARS-CoV-2调控并利用动态丝状伪足实现病毒入侵的过程；研究在线发表于<a href="https://doi.org/10.1016/j.scib.2023.08.031">Science Bulletin</a>。<br><br>
        <b>2023-06：</b> 在<a href="https://communities.springernature.com/posts/super-resolution-made-easier">Nature Research Community</a>发布关于<i>SACD</i>的“论文背后”博客。<br><br>
        <b>2023-06：</b> <i>SACD</i>已在<a href="https://doi.org/10.1038/s41566-023-01234-9">Nature Photonics</a>在线发表。
        <a class="news-social-card" href="https://x.com/weisong_zhao/status/1669386146529554433" target="_blank" rel="noopener noreferrer" aria-label="在X查看SACD帖子">
          <span class="news-social-card-media"><img src="https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41566-023-01234-9/MediaObjects/41566_2023_1234_Fig1_HTML.png" alt="SACD论文预览图" loading="lazy" decoding="async" onerror="this.onerror=null;this.src='../img/projects/SACD.png';"></span>
          <span class="news-social-card-body"><span class="news-social-card-meta">X · 2023年6月15日</span><strong>SACD发表于Nature Photonics</strong><span>SACD将荧光波动检测灵敏度提升数个数量级，仅需20帧即可实现两倍以上的三维分辨率提升。</span><span class="news-social-card-link">在X查看原帖 ↗</span></span>
        </a>
        <hr>
        <b>2022-12：</b> <a href="https://www.biorxiv.org/content/10.1101/2022.12.01.518675v1">PANEL</a>和<a href="https://www.biorxiv.org/content/10.1101/2022.12.12.520072v1">SACD</a>以预印本形式发布。<br><br>
        <b>2022-10：</b> <a href="https://github.com/WeisongZhao/PANELpy/">PANELpy</a>完全开源。<br><br>
        <b>2022-07：</b> 以<i>助理教授</i>身份加入哈尔滨工业大学。<br><br>
        <b>2022-05：</b> <a href="https://github.com/WeisongZhao/SACDm/">SACDm</a>和<a href="https://github.com/WeisongZhao/SACDj/">SACDj</a>完全开源。<hr>
        <b>2021-11：</b> 带GPU加速的<i>稀疏解卷积</i>Python版本发布于<a href="https://github.com/WeisongZhao/sparse-deconv-py">GitHub</a>。<br><br>
        <b>2021-11：</b> 在<a href="https://communities.springernature.com/posts/physical-resolution-might-be-meaningless-if-in-the-mathematical-space">Nature Research Community</a>发布关于<i>稀疏解卷积</i>的“论文背后”博客。<br><br>
        <b style="color:#dc3545;">2021-11：</b> <i>稀疏解卷积</i>已在<a href="https://www.nature.com/articles/s41587-021-01092-2">Nature Biotechnology</a>在线发表。<br><br>
        <b>2021-07：</b> <a href="https://github.com/WeisongZhao/PANELM/">PANELM</a>和<a href="https://github.com/WeisongZhao/PANELJ/">PANELJ</a>完全开源。<br><br>
        <b>2021-07：</b> <i>稀疏解卷积</i>被<i>Nature Biotechnology</i>接收发表。<br><br>
        <b>2021-03：</b> 关于<i>解卷积</i>的开放科学讨论发布于<a href="https://weisongzhao.github.io/rl_positivity_sim/">GitHub</a>和<a href="https://twitter.com/weisong_zhao/status/1370308101690118146">Twitter</a>。<br>
        <hr>
      </div>
    </div>
  HTML
  text.sub!(%r{<h4 class="card-header">课题组新闻</h4>\s*<div class="card-body">\s*<div class="card-text">.*?</div>\s*</div>}m, news.strip)
  text
end

def translate_team(text)
  text.sub!(%r{(<h5[^>]*>Weisong Zhao \(赵唯淞\), Ph\.D\..*?</h5>).*?<p>.*?</p>}m,
            "\\1\n<p>赵唯淞，哈尔滨工业大学仪器科学与工程学院长聘教授、博士生导师、青年科学家工作室负责人，主要从事生物医学显微成像技术研究。2017年获哈尔滨工业大学物理学理学学士学位，2022年获哈尔滨工业大学仪器科学与技术工学博士学位。近年来以第一/共同第一作者或通讯/共同通讯作者身份在Nature、Nature Biotechnology、Nature Photonics、Nature Methods等期刊发表学术论文，并在国内外学术会议作大会报告、主题报告和邀请报告五十余次；已获授权或申请PCT国际发明专利及中国发明专利二十余项。</p>")
  text.sub!(%r{(<h5>Liying Qu \(曲丽颖\), Ph\.D\.</h5>).*?<p>.*?</p>}m,
            "\\1\n<p>曲丽颖，哈尔滨工业大学副教授、春雁英才计划入选者，2025年获哈尔滨工业大学仪器科学与技术博士学位。主要研究机器学习与超分辨荧光显微成像及其生物学应用，以第一作者在Nature Methods和Clinical and Translational Medicine等期刊发表论文，并获中国激光杂志社2024年度青衿奖。</p>")
  roles = {
    "Microscopy" => "显微成像", "Machine learning" => "机器学习",
    "Computational imaging" => "计算成像", "Biomedical imaging" => "生物医学成像",
    "AI & Super-resolution" => "人工智能与超分辨", "Super-resolution" => "超分辨成像",
    "Ultrasound imaging" => "超声成像", "Deconvolution" => "解卷积",
    "Modeling" => "建模", "Administration" => "行政管理"
  }
  roles.each { |from, to| text.gsub!(%r{>#{Regexp.escape(from)}<}, ">#{to}<") }
  {
    "Excellent Young Scientists Fund, NSFC, 2024." => "国家自然科学基金优秀青年科学基金项目，2024年。",
    "National Key R&amp;D Program of China, 2026." => "国家重点研发计划，2026年。",
    "Young Elite Scientists Sponsorship Program, CAST, 2023." => "中国科协青年人才托举工程，2023年。",
    "Young Science and Technology Award," => "青年科技奖，",
    "Jin Guofan Young Scholar Award," => "金国藩青年学子奖，",
    "National Excellent Doctoral Dissertation Award," => "全国优秀博士学位论文奖，",
    "Wang Daheng Optical Award," => "王大珩光学奖，",
    "China’s Top 10 Breakthroughs in Optics,\n                        Chinese Laser Press, 2022 nomination; 2024." => "中国光学十大进展，中国激光杂志社，2022年提名、2024年入选。",
    "China’s Top 10 Social Impact Events in Optics (Light10),\n                        2021, 2023; 2024 nomination." => "中国光学十大社会影响力事件(Light10)，2021年、2023年入选，2024年提名。",
    "China Instrument and Control Society" => "中国仪器仪表学会",
    "Chinese Optical Society" => "中国光学学会",
    "Associate Editor, <i>npj Imaging</i>." => "副主编，<i>npj Imaging</i>。",
    "Guest Editor, <i>npj Imaging</i>," => "客座编辑，<i>npj Imaging</i>，",
    "Guest Editor, <i>Scientific Reports</i>," => "客座编辑，<i>Scientific Reports</i>，",
    "Guest Editor, <i>Quantitative Biology</i>," => "客座编辑，<i>Quantitative Biology</i>，"
  }.each { |from, to| text.gsub!(from, to) }
  text.gsub!("Collection:", "专题：")
  text.gsub!("Special Issue:", "专刊：")
  text.gsub!(/中国仪器仪表学会, (\d{4})\./, '中国仪器仪表学会，\1年。')
  text.gsub!(/中国光学学会, (\d{4})\./, '中国光学学会，\1年。')
  text.gsub!(">Lab manager<", ">实验室管理员<")
  text.gsub!(">Ph.D. student<", ">博士研究生<")
  text.gsub!(">Master's student<", ">硕士研究生<")
  text.gsub!(">Undergraduate student<", ">本科生<")
  text.gsub!(">Computational Imaging<", ">计算成像<")
  text.gsub!(">Machine Learning<", ">机器学习<")
  text.gsub!(">Biomedical Imaging<", ">生物医学成像<")
  text
end

def translate_gallery(text)
  {
    "SN2N microscopy denoising comparison" => "SN2N显微图像降噪对比",
    "Five-dimensional SN2N microscopy reconstruction" => "五维SN2N显微重建",
    "Five-dimensional SN2N microscopy visualization" => "五维SN2N显微可视化",
    "Three-dimensional SN2N microscopy reconstruction" => "三维SN2N显微重建",
    "SN2N-assisted live-cell tracking" => "SN2N辅助活细胞追踪",
    "SN2N denoising of STED microscopy" => "STED显微图像SN2N降噪",
    "SN2N denoising of GI-SIM microscopy" => "GI-SIM显微图像SN2N降噪",
    "SN2N denoising of 2D-SIM microscopy" => "2D-SIM显微图像SN2N降噪",
    "Three-dimensional sparse deconvolution microscopy" => "三维稀疏解卷积显微成像",
    "Smart palm-size optofluidic hematology analyzer" => "智能掌上型光流控血液分析仪"
  }.each { |from, to| text.gsub!(%(alt="#{from}"), %(alt="#{to}")) }
  text.gsub!('alt="Original Image"', 'alt="原始图像"')
  text.gsub!('alt="Modified Image"', 'alt="处理后图像"')
  text.gsub!('alt="RIED super-resolution imaging"', 'alt="RIED超分辨成像"')
  replacements = {
    "Reaction-luminescence super-resolution imaging." => "反应发光超分辨成像。",
    "Oil-immersion 100× objective (numerical aperture (NA) = 1.45, Olympus)." => "100×油浸物镜(数值孔径(NA)=1.45，Olympus)。",
    "EMCCD camera (iXon Ultra 897, Andor)." => "EMCCD相机(iXon Ultra 897，Andor)。",
    "RIED enables super-resolution imaging under extremely photon-limited electrochemiluminescence and bioluminescence conditions." => "RIED可在极端光子受限的电化学发光和生物发光条件下实现超分辨成像。",
    "3D RL-SN2N on SD-SIM." => "在SD-SIM图像上应用三维RL-SN2N。",
    "RL-SN2N on SD-SIM." => "在SD-SIM图像上应用RL-SN2N。",
    "SN2N on STED." => "在STED图像上应用SN2N。",
    "SN2N on SIM (" => "在SIM图像上应用SN2N(",
    "BioSR</a> dataset)." => "BioSR</a>数据集)。",
    "SN2N on SIM." => "在SIM图像上应用SN2N。",
    "Sparse deconvolution-assisted microscopy" => "稀疏解卷积辅助显微成像",
    "Expansion 4.5-fold" => "4.5倍膨胀显微成像",
    "Expansion microscopy 4.5-fold." => "4.5倍膨胀显微成像。",
    "Endoscope" => "内窥镜",
    "Spinning disk confocal." => "转盘共聚焦显微镜。",
    "Left: raw SD-SIM; Right: Sparse SD-SIM." => "左：原始SD-SIM；右：Sparse SD-SIM。",
    "Left: raw expansion; Right: Sparse expansion." => "左：原始膨胀显微图像；右：稀疏解卷积增强的膨胀显微图像。",
    "Left: raw 2D-SIM; Right: Sparse 2D-SIM." => "左：原始2D-SIM；右：Sparse 2D-SIM。",
    "Left: raw STED; Right: Sparse STED." => "左：原始STED；右：稀疏解卷积增强的STED。",
    "Brain of a transgenic mouse (in vivo)." => "转基因小鼠脑组织(活体)。",
    "Left: raw MTPM; Right: Sparse MTPM." => "左：原始MTPM；右：稀疏解卷积增强的MTPM。",
    "Color-coded 3D volume (50~160 μm)." => "颜色编码的三维体数据(50～160 μm)。",
    "Label-free super-resolution microscopy (SPoSI)." => "无标记超分辨显微成像(SPoSI)。",
    "Gold nanorod (20 nm x 300 nm)." => "金纳米棒(20 nm × 300 nm)。",
    "Left: raw wide-field (552 nm laser); Right: SPoSI." => "左：原始宽场图像(552 nm激光)；右：SPoSI。",
    "Volumetric endoscope probe." => "体成像内窥探头。",
    "USAF target and live worm." => "USAF分辨率靶与活体蠕虫。",
    "Left: 3D live worm; Right: tilted USAF target." => "左：活体蠕虫三维图像；右：倾斜的USAF分辨率靶。",
    "Smart palm-size optofluidic hematology analyzer" => "智能掌上型光流控血液分析仪",
    "A smart palm-sized optofluidic hematology analyzer based on a miniature fluorescence microscope and a microfluidic platform to reduce the device weight and improve portability." => "基于微型荧光显微镜与微流控平台的智能掌上型光流控血液分析仪，可减轻设备质量并提高便携性。",
    "Leukocyte." => "白细胞。",
    "Tracking of the leukocytes." => "白细胞追踪。",
    "Left: confocal; Right: SACD." => "左：共聚焦图像；右：SACD。",
    "Huge FOV 3D volume (10μm in depth);" => "大视场三维体数据(深度10 μm)；",
    "20 frame per SACD reconstruction." => "每次SACD重建使用20帧图像。",
    "α-tubulin labeled with Alexa Fluor 647." => "使用Alexa Fluor 647标记的α-微管蛋白。",
    "Left: STORM; Right: rFRC resolution map." => "左：STORM；右：rFRC分辨率图。",
    "Left: wide-field; Right: MGAN-SIM." => "左：宽场图像；右：MGAN-SIM。",
    "Left: TIRF; Right: MGAN-SIM." => "左：TIRF；右：MGAN-SIM。",
    "Long-term 1h imaging, 3400 frames." => "持续1小时的长时程成像，共3400帧。",
    "The process of cell division in hours." => "数小时尺度的细胞分裂过程。",
    "0~10 μm and the plane at 7 μm is visualized on the left." => "左侧显示0～10 μm深度范围及7 μm处的平面。",
    "From Prof. Liangyi Chen." => "数据由陈良怡教授提供。",
    "Single channel" => "单通道",
    "Merged" => "合并图像",
    "Left panel: ODT (left) at 5μm plane (0~6μm in total); 2D-SIM (right)." => "左图组：5 μm平面的ODT图像(总深度0～6 μm，左)与2D-SIM图像(右)。",
    "Right panel: 2D-SIM (red) + ODT (gray)." => "右图组：2D-SIM(红色)与ODT(灰色)的合并图像。",
    "Miniaturized light-field microscopy" => "微型化光场显微成像",
    "System concept" => "系统原理",
    "System on a live-mouse" => "活体小鼠上的系统",
    "Live-mouse." => "活体小鼠。",
    "GCaMP6s in vivo." => "活体GCaMP6s标记。",
    "From <b>Changliang Guo.</b>" => "数据由<b>郭长亮</b>提供。",
    "Abbreviations" => "缩写",
    "Optical diffraction tomography" => "光学衍射层析成像",
    "Stimulated emission depletion" => "受激发射损耗",
    "Structured illumination microscopy" => "结构光照明显微成像",
    "Spinning-disc confocal-based SIM" => "基于转盘共聚焦的SIM",
    "Miniaturized two-photon microscope" => "微型双光子显微镜",
    "Scattering polarity super-resolution imaging" => "散射极性超分辨成像",
    "Super-resolution using auto-correlation with two-step deconvolution" => "基于自相关与两步解卷积的超分辨成像"
  }
  replacements.each { |from, to| text.gsub!(from, to) }
  text.gsub!("Wide-field objective", "宽场物镜")
  text.gsub!("TIRF objective", "TIRF物镜")
  text.gsub!("Micro-objective with NA 0.7", "数值孔径0.7的微型物镜")
  text.gsub!("sCMOS camera", "sCMOS相机")
  text.gsub!("EMCCD camera", "EMCCD相机")
  text.gsub!("CMOS camera", "CMOS相机")
  text.gsub!("COS-7 cell.", "COS-7细胞。")
  text.gsub!("HeLa cell.", "HeLa细胞。")
  text.gsub!("INS-1 cell.", "INS-1细胞。")
  text.gsub!("two sites fluorescently labeled.", "两个位点经荧光标记。")
  text.gsub!("α-tubulin immunostaining.", "α-微管蛋白免疫染色。")
  text.gsub!("SN2N: Self-inspired Noise2Noise learning-to-denoise engine", "SN2N：自启发Noise2Noise学习降噪引擎")
  text.gsub!("RL: Richardson-Lucy deconvolution", "RL：Richardson–Lucy解卷积")
  text
end

def translate_projects(text)
  PROJECTS.each do |id, (title, description)|
    pattern = %r{(<div id="#{Regexp.escape(id)}"[^>]*>.*?<h3>).*?(</h3>\s*<p>).*?(</p>)}m
    text.sub!(pattern) { "#{Regexp.last_match(1)}#{title}#{Regexp.last_match(2)}#{description}#{Regexp.last_match(3)}" }
  end
  text
end

def translate_projects_archive(text)
  PROJECT_ARCHIVE.each do |english_title, (title, description)|
    pattern = %r{(<h3>)#{Regexp.escape(english_title)}(</h3>\s*<p>).*?(</p>)}m
    text.sub!(pattern) { "#{Regexp.last_match(1)}#{title}#{Regexp.last_match(2)}#{description}#{Regexp.last_match(3)}" }
  end
  text
end

def translate_open_source(text)
  text.gsub!("represents the Weisong Zhao Lab’s imaging toolkit implementations.", "是赵唯淞课题组集中发布与维护成像工具实现的官方平台。")
  OPEN_SOURCE.each do |id, description|
    pattern = %r{(<h3 id="#{Regexp.escape(id)}">.*?</h3>\s*<p>).*?(</p>)}m
    text.sub!(pattern) { "#{Regexp.last_match(1)}#{description}#{Regexp.last_match(2)}" }
  end
  text
end

def translate_archive_tools(text)
  ARCHIVE_TOOLS.each do |id, description|
    pattern = %r{(<h3 id="#{Regexp.escape(id)}">.*?</h3>\s*<p>).*?(</p>)}m
    text.sub!(pattern) { "#{Regexp.last_match(1)}#{description}#{Regexp.last_match(2)}" }
  end
  ARCHIVE_TOOL_TITLES.each do |id, title|
    text.sub!(%r{(<h3 id="#{Regexp.escape(id)}">).*?(</h3>)}m, "\\1#{title}\\2")
  end
  text
end

def translate_contact(text)
  text.sub!(%r{<p>\s*<b>Positions:</b>.*?</p>}m,
            '<p><b>招聘岗位：</b>课题组现招聘具有计算机视觉、图像处理、超声成像或相关研究背景的优秀科研人员，岗位包括<b>助理研究员</b>(25万元/年)和<b>副研究员</b>(35万元/年)。<br><small class="text-muted"><i>更新于：2026年8月</i></small></p>')
  text.gsub!("<b>Room J714</b>, Technology Innovation Building (TIB), Harbin Institute of Technology, Harbin, China.",
             "<b>办公室地址：</b>J714室，哈尔滨工业大学科学园科技创新大厦(TIB)，哈尔滨市，黑龙江省，中国。")
  text.sub!(%r{<!-- Google Maps is used on the English page; the generator replaces it with Amap on the Chinese page\. -->\s*<iframe class="contact-map".*?</iframe>}m,
            '<!-- 中文页面使用腾讯地图轻量地点页展示指定地点。坐标采用 GCJ-02。 --><iframe class="contact-map" title="腾讯地图：哈尔滨工业大学科学园科技创新大厦" src="https://3gimg.qq.com/lightmap/v1/marker/index.html?marker=coord:45.728499,126.631383;title:%E5%93%88%E5%B0%94%E6%BB%A8%E5%B7%A5%E4%B8%9A%E5%A4%A7%E5%AD%A6%E7%A7%91%E5%AD%A6%E5%9B%AD%E7%A7%91%E6%8A%80%E5%88%9B%E6%96%B0%E5%A4%A7%E5%8E%A6;addr:%E5%93%88%E5%B0%94%E6%BB%A8%E5%B8%82,%E9%BB%91%E9%BE%99%E6%B1%9F%E7%9C%81,%E4%B8%AD%E5%9B%BD"></iframe>')
  text
end

def translate_not_found(text)
  text.gsub!(/Page Not Found|Page not found/, "页面未找到")
  text.gsub!(/Coming soon(?:\.\.\.|…)/, "敬请期待…")
  text.gsub!("The page you're looking for is still in progress.", "您访问的页面仍在建设中。")
  text
end

def prefix_assets(text)
  text.gsub!(/((?:src|href)=["'])((?:img|css|js|vendor)\/)/, '\\1../\\2')
  text.gsub!(/url\((["']?)img\//, 'url(\\1../img/')
  text
end

def apply_seo(text, page, language, canonical)
  config = SEO.fetch(page)
  title = config.fetch(language == :en ? :en_title : :zh_title)
  description = config.fetch(language == :en ? :en_description : :zh_description)
  robots = config.fetch(:robots, "index, follow")
  image = "#{SITE_URL}/img/site/cover.jpg"

  text.sub!(%r{<title>.*?</title>}m, "<title>#{title}</title>")
  text.sub!(%r{<meta name="description" content="[^"]*">}, %(<meta name="description" content="#{description}">))
  text.sub!(%r{<meta name="author" content="[^"]*">}, %(<meta name="author" content="Weisong Zhao (赵唯淞)">))
  text.gsub!(%r{\s*<meta name="robots" content="[^"]*">}, "")
  text.sub!(%r{(<meta name="description"[^>]*>)}, "\\1\n    <meta name=\"robots\" content=\"#{robots}\">")

  text.gsub!(%r{\s*<meta property="og:(?:title|url|type|description|image)"[^>]*>}, "")
  text.gsub!(%r{\s*<meta name="twitter:(?:card|title|description|image)"[^>]*>}, "")
  social = <<~HTML.strip
    <meta property="og:title" content="#{title}">
    <meta property="og:url" content="#{canonical}">
    <meta property="og:type" content="website">
    <meta property="og:description" content="#{description}">
    <meta property="og:image" content="#{image}">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="#{title}">
    <meta name="twitter:description" content="#{description}">
    <meta name="twitter:image" content="#{image}">
  HTML
  text.sub!(%r{</title>}, "</title>\n    #{social}")

  text.gsub!(%r{\s*<script type="application/ld\+json" data-site-schema>.*?</script>}m, "")
  text.sub!(%r{</head>}, "    #{SITE_SCHEMA}\n</head>") if page == "index.html"
  text
end

FileUtils.mkdir_p(ZH_DIR)

PAGES.each do |page|
  source_path = File.join(ROOT, page)
  english = File.read(source_path)

  if page == "gallery.html"
    english.gsub!("https://doi.org/10.1101/2024.01.23.576521", "https://www.nature.com/articles/s41592-024-02400-9")
    english.gsub!(">Link to the paper", ">Paper")
  end
  english.gsub!(/>Open-source(\s*)</, ">Resources\\1<")
  english.gsub!(/>Research(\s*)</, ">Projects\\1<")
  english.gsub!("Other Research", "Other projects")
  english.sub!(%r{<li class="nav-item language-switcher".*?</li>}m, english_switcher(page))
  canonical = page == "index.html" ? "#{SITE_URL}/" : "#{SITE_URL}/#{page}"
  alternate = page == "index.html" ? "#{SITE_URL}/zh/" : "#{SITE_URL}/zh/#{page}"
  english.gsub!(%r{\s*<link rel="alternate" hreflang="[^"]+"[^>]*>}, "")
  english.sub!(%r{<link rel="canonical"[^>]*>}, %(<link rel="canonical" href="#{canonical}">\n    <link rel="alternate" hreflang="en" href="#{canonical}">\n    <link rel="alternate" hreflang="zh-CN" href="#{alternate}">\n    <link rel="alternate" hreflang="x-default" href="#{canonical}">))
  apply_seo(english, page, :en, canonical)
  english.gsub!(/[ \t]+$/, "")
  File.write(source_path, english)

  chinese = english.dup
  chinese.gsub!("https://www.csr-biotech.com/en/home", "https://www.csr-biotech.com/cn/home")
  chinese.sub!(%r{<html\b([^>]*)lang="en"}, '<html\\1lang="zh-CN"')
  chinese.sub!(%r{<nav class="navbar.*?</nav>}m, chinese_nav(page).strip)
  chinese.sub!(%r{<link rel="canonical"[^>]*>}, %(<link rel="canonical" href="#{alternate}">))
  prefix_assets(chinese)
  translate_common(chinese)

  case page
  when "index.html" then translate_home(chinese)
  when "team.html" then translate_team(chinese)
  when "projects.html" then translate_projects(chinese)
  when "projects-archive.html" then translate_projects_archive(chinese)
  when "open-source.html" then translate_open_source(chinese)
  when "open-source-archive.html" then translate_archive_tools(chinese)
  when "gallery.html" then translate_gallery(chinese)
  when "contact.html" then translate_contact(chinese)
  when "404.html" then translate_not_found(chinese)
  end

  apply_seo(chinese, page, :zh, alternate)

  if chinese.match?(/\{%|\{\{/)
    abort "Template syntax found in generated #{page}"
  end
  chinese.tr!("()", "()")
  chinese.gsub!(/[ \t]+$/, "")
  File.write(File.join(ZH_DIR, page), chinese)
end

puts "Updated #{PAGES.size} English language links and generated #{PAGES.size} standalone Chinese pages."
