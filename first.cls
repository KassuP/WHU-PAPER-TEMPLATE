\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{first}
    [2025/04/25 V1.0 My First LaTeX Class]
\LoadClass[a4paper, 12pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义布尔变量（具有真知的量：true/false）  布尔变量可以使用在条件判断语句中
\newif\if@class@bwprint % 是创建一个布尔变量，叫做 \@class@bwprint
    \@class@bwprintfalse % 设置默认值：设置 \if@class@bwprint 的初始值为假的 false
\newif\if@class@preface 
    \@class@prefacetrue

% 定义：对于用户输入的值、并赋予其以对应布尔变量()的真值（true或者false）
\DeclareOption{colorprint}{\@class@bwprintfalse} %当用户在 \documentclass[...] 中写了 colorprint 时，就设置 \@class@bwprint 为 false，即 不是黑白打印
\DeclareOption{bwprint}{\@class@bwprinttrue} %如果用户选了 bwprint，就将 \@class@bwprint 设置为 true，启用 黑白打印模式
\DeclareOption{withoutpreface}{\@class@prefacefalse} 
\DeclareOption{withpreface}{\@class@prefacetrue} 

\ExecuteOptions{colorprint,withpreface} %指定默认值 如果用户在 \documentclass[...] 里没有指定打印颜色方式，那就默认使用 colorprint

\ProcessOptions\relax % 没有此语句会报错。（执行对选项的处理）执行 \ProcessOptions， LaTeX才处理了这些声明[documentclass中括号中的内容]。
% 必须调用这个命令，LaTeX 才会处理这些选项定义

%%%%%%%%%%%%%%%%%
%定义空常量(待输入) \class@tokens@OOO
\newcommand*\class@tokens@keywords{}
\newcommand*\class@tokens@school{}
\newcommand*\class@tokens@college{} % 学院的名字
\newcommand*\class@tokens@province{} % 省
\newcommand*\class@tokens@city{} %市
\newcommand*\class@tokens@postcode{} %邮编
\newcommand*\class@tokens@studentnumber{} %学号
\newcommand*\class@tokens@socialunit{} %培养单位
\newcommand*\class@tokens@advisor{} %指导教师
\newcommand*\class@tokens@course{} %课程

%%%%%%%%%%%%%%%
%定义实常量 
%%数学环境常量 \class@math@OOO
\newcommand*{\class@math@definition}{定义}
\newcommand*{\class@math@theorem}{定理}
\newcommand*{\class@math@lemma}{引理}
\newcommand*{\class@math@corollary}{推论}
\newcommand*{\class@math@assumption}{假设}
\newcommand*{\class@math@conjecture}{猜想}
\newcommand*{\class@math@axiom}{公理}
\newcommand*{\class@math@principle}{定律}
\newcommand*{\class@math@problem}{问题}
\newcommand*{\class@math@example}{例}
\newcommand*{\class@math@proof}{证明}
\newcommand*{\class@math@solution}{解}
\newcommand*{\class@math@pros}{优点}
\newcommand*{\class@math@cons}{缺点}
\newcommand*{\class@math@approve}{改进}
\newcommand*{\class@math@step}{步骤}

%%中文各类题注名称常量 \class@title@OOO
\newcommand*{\class@title@contentsname}{目录}
\newcommand*{\class@title@listfigurename}{插图清单}
\newcommand*{\class@title@listtablename}{附表清单}
\newcommand*{\class@title@refname}{参考文献}
\newcommand*{\class@title@indexname}{索引}
\newcommand*{\class@title@figurename}{图}
\newcommand*{\class@title@tablename}{表}
\newcommand*{\class@title@appendixname}{附录}
\newcommand*{\class@title@abstractname}{摘要}
\newcommand*{\class@title@keywordsname}{关键字}

%%其他地方可能会用到的常量（专用页）
\newcommand*{\class@string@socialunit}{培养单位}
\newcommand*{\class@string@course}{课程}
\newcommand*{\class@string@advisor}{指导教师}
%%这里是预留的位置

%空常量的用户赋值命令样式更新(定义用户赋值接口)
%%重新定义用户使用的(输入数据，不用使用)接口命令样式
\newcommand*\keywords[1]{% 接受一个参数（[1] 表示一个参数）
    \renewcommand{\class@tokens@keywords}{#1}}
\newcommand*\school[1]{%
    \renewcommand{\class@tokens@school}{#1}}
\newcommand*\college[1]{%
    \renewcommand{\class@tokens@college}{#1}}
\newcommand*\postcode[1]{%
    \renewcommand{\class@tokens@postcode}{#1}}
\newcommand*\studentnumber[1]{%
    \renewcommand{\class@tokens@studentnumber}{#1}}
\newcommand*\province[1]{%
    \renewcommand{\class@tokens@province}{#1}}
\newcommand*\city[1]{%
    \renewcommand{\class@tokens@city}{#1}}
\newcommand*\socialunit[1]{%
    \renewcommand{\class@tokens@socialunit}{#1}}
\newcommand*\course[1]{%
    \renewcommand{\class@tokens@course}{#1}}
\newcommand*\advisor[1]{%
    \renewcommand{\class@tokens@advisor}{#1}}
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%导入宏包
\RequirePackage{ifxetex} % ifxetex 是一个检测是否使用 XeTeX 编译器的
% 引入 ifxetex 后，可以使用 \ifxetex 来判断是否使用 xelatex 编译器。
\RequireXeTeX % 用于加载 XeTeX 特有的功能。在某些情况下，它确保了 XeTeX 特定的特性和命令被正确地加载。
% \RequireXeTeX 不是 LaTeX 标准命令，通常是某些类文件为了确保正确加载 XeTeX 特性而自定义的命令。

\RequirePackage{ctex} %支持中文
\RequirePackage{fontspec}
\RequirePackage{zhnumber} % 用于将阿拉伯数字转换为中文数字

\RequirePackage{geometry} % 页面布局
\RequirePackage{xkeyval} % 支持使用布尔变量

\RequirePackage{amsmath} %数学宏包
\RequirePackage{amsfonts} %数学宏包
\RequirePackage{amssymb} %数学宏包
\RequirePackage{bm} %数学宏包

\RequirePackage{xcolor} % 设置颜色

\RequirePackage{graphicx} % 插入图片
\RequirePackage{float} % 插入图片

\RequirePackage{array} % 表格
\RequirePackage{longtable} %% 长表格
\RequirePackage{booktabs,tabularx} %% booktabs 提供了\toprule 等命令
\RequirePackage{multirow} %% multirow 支持在表格中跨行
\RequirePackage{bigstrut} %% 调整间隔, 让表格更好看些
\RequirePackage{bigdelim} %% 在跨行表格中输入定界符
\RequirePackage{cprotect} % 保护脆落命令
\RequirePackage{listings} % 设置代码环境
\RequirePackage{xcolor} % 设置代码环境

\RequirePackage{url} % 插入链接

\RequirePackage{subcaption} %图中图的子图标题
\RequirePackage[titles]{tocloft} % 子标题

\RequirePackage{setspace} % 首行缩进
\RequirePackage{caption} % 设置浮动体的标题
\RequirePackage{enumitem} % 定制列表环境
\RequirePackage{ulem} % 下划线
\RequirePackage{calc} % 尺寸计算
\RequirePackage[titletoc,title]{appendix} % 附录
\RequirePackage{etoolbox} % 位置
\RequirePackage{hyperref} % 超链接 hyperref 的设置
\RequirePackage{cleveref} % 智能自动化交叉引用
\RequirePackage{xeCJK} 
\RequirePackage{ragged2e} %
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\RequirePackage{xparse}    % 提供更好的命令定义功能
\RequirePackage{fancyhdr,hyperref} % 页码相关的库 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 对全局页面、文字进行设置
\setlength\parindent{2em} % 每行缩进两个汉字

\setmainfont{Times New Roman} % 设置字体 需要导入包fontspec
\setsansfont{Arial} % 设置字体
\setCJKfamilyfont{kai}[AutoFakeBold]{simkai.ttf}
\newcommand*{\kai}{\CJKfamily{kai}}
\setCJKfamilyfont{song}[AutoFakeBold]{SimSun}
\newcommand*{\song}{\CJKfamily{song}}
% 另外，用户可能在中文环境下使用ctex文档类，这样中文字体可能默认设置为宋体、黑体等，
% 而西文字体由`\setmainfont`指定。
% 因此，章节标题中的中文部分会使用ctex设置的中文字体，而编号和西文部分使用Times New Roman。
% 总结一下，这段代码本身并没有显式设置新的字体，而是依赖于之前定义的全局字体设置。
% 因此，字体仍然是Times New Roman（主字体）、Arial（无衬线字体），中文由ctex默认处理。
% 但需要检查代码中的拼写错误，确保`\bfseries`和`\normalfont`正确应用，以保证标题的字体样式正确显示。
% 若使用 ctex 文档类或包，默认中文字体为：
    %% 主字体：宋体（SimSun）
    %% 加粗样式：黑体（SimHei）
%

% 全局页面设置
\geometry{%
    top     = 2cm,
    bottom  = 5cm,
    hmargin = 3.5cm,
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 编号控制
\crefformat{figure}{#2图~#1#3}
\crefrangeformat{figure}{图~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{figure}{图~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

\crefformat{table}{#2表#1#3}
\crefrangeformat{table}{表(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{table}{表~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

\crefformat{equation}{#2~(#1#3)}
\crefrangeformat{equation}{~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{equation}{~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{definition}{#2\class@math@definition~#1#3}
\crefrangeformat{definition}{\class@math@definition~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{definition}{\class@math@definition(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{theorem}{#2\class@math@theorem~#1#3}
\crefrangeformat{theorem}{\class@math@theorem~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{theorem}{\class@math@theorem~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{lemma}{#2\class@math@lemma~#1#3}
\crefrangeformat{lemma}{\class@math@lemma~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{lemma}{\class@math@lemma~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{corollary}{#2\class@math@corollary~#1#3}
\crefrangeformat{corollary}{\class@math@corollary~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{corollary}{\class@math@corollary~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{assumption}{#2\class@math@assumption~#1#3}
\crefrangeformat{assumption}{\class@math@assumption~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{assumption}{\class@math@assumption~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{conjecture}{#2\class@math@conjecture~#1#3}
\crefrangeformat{conjecture}{\class@math@conjecture~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{conjecture}{\class@math@conjecture~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{axiom}{#2\class@math@axiom~#1#3}
\crefrangeformat{axiom}{\class@math@axiom~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{axiom}{\class@math@axiom~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{principle}{#2\class@math@principle~#1#3}
\crefrangeformat{principle}{\class@math@principle~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{principle}{\class@math@principle~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{problem}{#2\class@math@problem~#1#3}
\crefrangeformat{problem}{\class@math@problem~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{problem}{\class@math@problem~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{example}{#2\class@math@example~#1#3}
\crefrangeformat{example}{\class@math@example~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{example}{\class@math@example~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{proof}{#2\class@math@proof~#1#3}
\crefrangeformat{proof}{\class@math@proof~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{proof}{\class@math@proof~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

\crefformat{solution}{#2\class@math@solution~#1#3}
\crefrangeformat{solution}{\class@math@solution~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{solution}{\class@math@solution~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 每个环境模块的设定
% 列表环境设置
\setlist{%
	topsep=0.3em, % 列表顶端的垂直空白
	partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
	itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
	parsep=0pt, % 列表项内的段落之间的垂直空白
	leftmargin=1.5em, % 环境的左边界和列表之间的水平距离
	rightmargin=0em, % 环境的右边界和列表之间的水平距离
	labelsep=0.5em, % 包含标签的盒子与列表项的第一行文本之间的间隔
	labelwidth=2em % 包含标签的盒子的正常宽度；若实际宽度更宽，则使用实际宽度。
}

% 图片环境设置
 % 如果图片没有指定后缀, 依次按下列顺序搜索
 \DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
 % 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}%
  {picture/}{pic/}{pics/}{image/}{images/}}
% 图表标题
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}}
\captionsetup[figure]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格
	font={song,minusfour,bf}, % 图的字体, 宋体小四
	position=bottom % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
\captionsetup[table]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格
	font={song,minusfour,bf}, % 表的字体, 宋体小四
	position=top % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}

% 中文标题格式设置
% 标题与生成目录深度
\setcounter{secnumdepth}{3}
% 节标题格式, 居中, 使用\chinese命令修改计数器
\def\@seccntformat#1{\csname the#1\endcsname\ }
\renewcommand\thesection{\chinese{section}、}
\renewcommand\thesubsection{\arabic{section}\thinspace.\thinspace\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection\thinspace.\thinspace\arabic{subsubsection}}

\renewcommand\section{\@startsection{section}{1}{\z@}%
 	{-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\centering\Large\bfseries}}

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\large\bfseries}}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{3.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\normalfont\normalsize\bfseries}}
    
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	 {3.25ex \@plus1ex \@minus .2ex}%
	 {-1em}%
	 {\normalfont\normalsize\bfseries}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 宏定义
% 自定义隐式宏   使用\OOO@define@key{} 命令
\SetupKeyvalOptions{
  family=class,
  prefix=class@,
  setkeys=\kvsetkeys}
\let\class@setup@hook\@empty
\newcommand\classsetup[1]{%
  \let\class@setup@hook\@empty
  \kvsetkeys{class}{#1}%
  \class@setup@hook
}
\newcommand\class@define@key[1]{%
  \kvsetkeys{class@key}{#1}%
}
\kv@set@family@handler{class@key}{%
  \@namedef{class@#1@@name}{#1}%
  \def\class@@default{}%
  \def\class@@choices{}%
  \kv@define@key{class@value}{name}{%
    \@namedef{class@#1@@name}{##1}%
  }%
  \@namedef{class@#1@@check}{}%
  \@namedef{class@#1@@code}{}%
  \kv@define@key{class@value}{choices}{%
    \def\class@@choices{##1}%
    \@namedef{class@#1@@reset}{}%
    \@namedef{class@#1@@check}{%
      \@ifundefined{%
        ifclass@\@nameuse{class@#1@@name}@\@nameuse{class@\@nameuse{class@#1@@name}}%
      }{%
        \class@error{Invalid value "#1 = \@nameuse{class@\@nameuse{class@#1@@name}}"}%
      }%
      \@nameuse{class@#1@@reset}%
      \@nameuse{class@\@nameuse{class@#1@@name}@\@nameuse{class@\@nameuse{class@#1@@name}}true}%
    }%
  }%
  \kv@define@key{class@value}{default}{%
    \def\class@@default{##1}%
  }%
  \kvsetkeys{class@value}{#2}%
  \@namedef{class@\@nameuse{class@#1@@name}}{}%
  \kv@set@family@handler{class@choice}{%
    \ifx\class@@default\@empty
      \def\class@@default{##1}%
    \fi
    \expandafter\newif\csname ifclass@\@nameuse{class@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname class@#1@@reset\endcsname{%
      \@nameuse{class@\@nameuse{class@#1@@name}@##1false}%
    }%
  }%
  \kvsetkeys@expandafter{class@choice}{\class@@choices}%
  \expandafter\let\csname class@\@nameuse{class@#1@@name}\endcsname\class@@default
  \expandafter\ifx\csname class@\@nameuse{class@#1@@name}\endcsname\@empty\else
    \@nameuse{class@#1@@check}%
  \fi
  \kv@define@key{class}{#1}{%
    \@namedef{class@\@nameuse{class@#1@@name}}{##1}%
    \@nameuse{class@#1@@check}%
    \@nameuse{class@#1@@code}%
  }%
}
\newcommand\class@option@hook[2]{%
  \expandafter\g@addto@macro\csname class@#1@@code\endcsname{#2}%
}

% 以上是对键值系统的定义 下面就可正式开始使用了
\class@define@key{
  date = {
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  }
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 自定义显式宏   使用\newcommand和\def和\renewcommand命令
%% 一些排版的宏(模块化的宏)
\newbox\class@pad@box
\newcommand\class@pad[2]{
    \sbox\class@pad@box{#2}%
    \ifdim \wd\class@pad@box < #1 \relax
        \makebox[#1][l]{\box\class@pad@box}%
    \else
        \box\class@pad@box
    \fi
}
\newcommand\class@fixed@box[2]{%
    \begingroup
        \renewcommand\CJKglue{\hspace{0pt plus 2filll minus 1filll}}% 这行代码对第一列文字的对齐很重要
        \makebox[#1][l]{#2}%
    \endgroup
}
\newcommand\class@titlepage@info@tabular[5]{%
    \def\class@info@item##1##2##3{%
    \ifx ##3
        \@empty
    \else
        \class@pad{#2}{\class@fixed@box{#3}{##1}}%
        \class@pad{#4}{：}%
        ##2{##3}\\
    \fi
    }%
    \hspace{#1}%
    \begin{tabular}{l}%
        % \renewcommand\arraystretch{1}%   把这行注释掉之后就对齐了！！！
        #5 %
    \end{tabular}%
}
\newcommand\class@titlepage@info{%
    \class@titlepage@info@tabular{2.3cm}{2.85cm}{2.75cm}{0.77cm}{%
      \class@info@item{课程名称}{}{\class@tokens@course}%
        \class@info@item{学院}{}{\class@tokens@college}% 
        \class@info@item{指导教师}{}{\class@tokens@advisor}%
        \class@info@item{学生姓名}{}{\@author}%
        \class@info@item{学生学号}{}{\class@tokens@studentnumber}
    }\par
}

% 封面日期显示系列宏设置
\newcommand\class@format@date[2]{%
  \edef\class@@date{#2}%
  \def\class@@process@date##1-##2-##3\@nil{%
    #1{##1}{##2}{##3}%
  }%
  \expandafter\class@@process@date\class@@date\@nil
}

% 中文短日期格式
\newcommand\class@date@zh@short[3]{%
  \zhdigits{#1}年\zhnumber{#2}月% 示例：二〇二三年九月
}

% 封面日期生成
\newcommand\class@titlepage@date{%
  \begingroup
    \class@format@date{\class@date@zh@short}{\class@date}\par
  \endgroup
}

%将日期的代码整合在一起的宏
\newcommand\class@titlepages@date{%   
    \begingroup
        % \sanhao  关键问题在这里 这个不注释掉就无法正常运行
        \zihao{3}
        \renewcommand\CJKglue{\hspace{1bp}}%
        \class@format@date{\class@date@zh@short}{\class@date}\par
    \endgroup
}

%页码设置相关宏
%% 页码全局设置
\pagestyle{fancyplain}  % 设置全文档使用 fancyplain 页面样式
\fancyhf{}              % 清除所有页眉页脚的默认内容
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{-\,\thepage\,-}       % 设置页脚居中显示带连字符的页码（如 -1-）
\fancypagestyle{plain}  % 重定义 plain 页面样式（章节起始页默认使用此样式）
{
  \fancyhead{}          % 清除 plain 样式的页眉内容
  \renewcommand{\headrulewidth}{0pt} % 隐藏页眉横线
  \fancyfoot{}          % 清除 plain 样式的页脚默认内容
  \fancyfoot[C]{-\,\thepage\,-} % 强制章节页也显示带连字符的页码
}

%% 第一次调用\section命令时就开始使用阿拉伯编码
\let\old@section\section % 保存原始的 \section 命令.将原始 \section 的功能保存到 \old@section 中
\renewcommand{\section}{% 开始重定义 \section 命令
    \@ifundefined{mainmatter@done}{% 条件检查是否已执行过切换页码的操作
        \pagenumbering{arabic}%
        \setcounter{page}{1} % 强制设置当前页码为 1
        \global\let\mainmatter@done\relax%
    }{}%
    \old@section %在完成页码切换后执行(回退)原版章节命令
}

% 图片相关宏
\newcommand{\class@school@logo}{whuname.png} % 假设图片与 .cls 同目录（换成你学校的logo）
\newcommand{\insertlogo}{%
    \begin{center}
        \includegraphics[width=0.7\textwidth]{\class@school@logo}%
    \end{center}
}
% 集成的宏（利用模块化的宏）
% \newcommand\class@titlepage@thesis{%
%     \newgeometry{
%         top     = 2cm
%         bottom  = 6cm
%         hmargin = 3.5cm
%     }%
%     \thispagestyle{empty}%
%     \null \vskip 8.1pt%
%     \begingroup
%         \centering
%         \parbox[t][2cm][t]{\textwidth}{%
%             \hskip -21.5pt%
%         }\par
%         \vskip 40.5pt%

%         \begingroup
%             \sffamily\fontsize{26bp}{46.8bp}\selectfont
%             \class@title\par
%         \endgroup

%         \vskip 24.1pt%
%         \class@title@degree@category\par
%         \vfill

%         \parbox[t][7.25cm][t]{\textwidth}{%
%             \fangsong\fontsize{16bp}{31.20bp}\selectfont
%             \class@titlepage@info
%             }\par
%             \vskip 62pt%
        
%         \parbox[t][1.03cm][t]{\textwidth}{\centering\class@titlepage@date}\par
%     \endgroup
%     \clearpage
%     \restoregeometry
% }


%% 生成定制的标题页，对\maketitle 命令重定义
\renewcommand{\maketitle}{\par
    \begingroup
        \newpage    
        \global\@topnum\z@
        \@maketitle
    \endgroup

    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
}

\renewcommand\@maketitle{
    \null\vskip 8.1pt% 开头给一个占位符然后垂直它8.1pt开始有文本
    
    \pagenumbering{Roman}
    \setcounter{page}{1} % 从I开始

    \if@class@preface %检查布尔变量 @mcm@preface 是否为 true。检查布尔变量 @mcm@preface 是否为 true。
    \null %插入一个“空行”或占位符，确保垂直间距的准确性。常用于调整布局时占位
    \vskip 62pt%
    
    \insertlogo
    % \begin{center}
    %     {\zihao{0}\kaishu \text{\class@tokens@school}}
    % \end{center}\

    \null
    \vskip 62pt%

    % \class@titlepage@info   
    \fangsong\fontsize{16bp}{31.20bp}\selectfont\class@titlepage@info

    \else % 如果\@class@preface 为 false，则跳过 \if 到 \else 之间的代码。执行\else 到 \fi之间的代码 
    \fi 

    \vskip 100pt%
    \begin{center}
      \parbox[t][1.03cm][t]{\textwidth}{\centering\class@titlepages@date}\par
    \end{center}\

    \makeanothertitle
}

\newcommand\makeanothertitle{
    \newpage
    \begin{center}
        {\zihao{-2}\heiti \@title \par}
        \vskip1ex
        {\zihao{4}\kaishu \@author \quad \class@tokens@studentnumber \par}
        \vskip1ex
        {\zihao{5}\kaishu \class@tokens@school\class@tokens@college \hspace{1em} \class@tokens@province\class@tokens@city \hspace{1em} \class@tokens@postcode \par}
    \end{center}

}

