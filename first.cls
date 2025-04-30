\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{first}
    [2025/04/25 V1.0 My First LaTeX Class]
\LoadClass[a4paper, 12pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%创建布尔变量（具有真知的量：true/false）  布尔变量可以使用在条件判断语句中
\newif\if@class@bwprint % 是创建一个布尔变量，叫做 \@class@bwprint
    \@class@bwprintfalse % 设置默认值：设置 \if@class@bwprint 的初始值为假的 false
\newif\if@class@preface 
    \@class@prefacetrue

%定义：对于用户输入的特殊值、并赋予其以对应布尔变量()的真值（true或者false）
\DeclareOption{colorprint}{\@class@bwprintfalse} %当用户在 \documentclass[...] 中写了 colorprint 时，设置 \@class@bwprint 为 false，即 不是黑白打印
\DeclareOption{bwprint}{\@class@bwprinttrue} %如果用户选了 bwprint，就将 \@class@bwprint 设置为 true，启用 黑白打印模式
\DeclareOption{withoutpreface}{\@class@prefacefalse} 
\DeclareOption{withpreface}{\@class@prefacetrue} 

\ExecuteOptions{colorprint,withpreface} %指定默认值 如果用户在 \documentclass[...] 里没有指定打印颜色方式，那就默认使用 colorprint

\ProcessOptions\relax % 没有此语句会报错。（执行对选项的处理）执行 \ProcessOptions， LaTeX才处理了这些声明[documentclass中括号中的内容]。
%必须调用这个命令，LaTeX 才会处理这些选项定义

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%空常量(待输入) \class@tokens@OOO
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

%实常量 
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 自定义隐式宏   使用\OOO@define@key{} 命令
\DeclareKeys{class@key}
\newcommand{\two@digits}[1]{\ifnum#1<10 0#1\else #1\fi}
\newcommand\class@define@key[1]{%
  \kvsetkeys{class@key}{#1}%
}
\DeclareOption*{\def\@tempa##1{##1}}  % 处理未声明选项的方式
\class@define@key{
    date = {
        default = {\the\year-\two@digits{\month}-\two@digits{\day}},
    },
    title = {
        default = {标题},
    },
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 自定义显式宏   使用\newcommand和\def和\renewcommand命令
%% 一些排版的宏命令
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
        \class@info@item{培养单位}{}{物理科学院}% 首行出现了左侧偏移？？为什么
        \class@info@item{单位}{}{INOUESAKIKO}%
        \class@info@item{培养单位}{}{INOUE}%
        \class@info@item{培养单位吗}{}{大苏打}%
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

\newcommand\class@date@zh@short[3]{\zhdigits{#1}年 \zhnumber{#2}月}

\newcommand\class@titlepage@date{%   
    \begingroup
        \sanhao
        \renewcommand\CJKglue{\hspace{1bp}}%
        \class@format@date{\class@date@zh@short}{\class@date}\par
    \endgroup
}

\newcommand\class@titlepage@thesis{%
    \newgeometry{
        top     = 2cm
        bottom  = 6cm
        hmargin = 3.5cm
    }%
    \thispagestyle{empty}%
    \null \vskip 8.1pt%
    \begingroup
        \centering
        \parbox[t][2cm][t]{\textwidth}{%
            \hskip -21.5pt%
        }\par
        \vskip 40.5pt%

        \begingroup
            \sffamily\fontsize{26bp}{46.8bp}\selectfont
            \class@title\par
        \endgroup

        \vskip 24.1pt%
        \class@title@degree@category\par
        \vfill

        \parbox[t][7.25cm][t]{\textwidth}{%
            \fangsong\fontsize{16bp}{31.20bp}\selectfont
            \class@titlepage@info
            }\par
            \vskip 62pt%
        
        \parbox[t][1.03cm][t]{\textwidth}{\centering\class@titlepage@date}\par
    \endgroup
    \clearpage
    \restoregeometry
}

% 还没写完


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
    \newgeometry{ % 对页面布局的临时修改仅这一样
        top     = 2cm,
        bottom  = 6cm,
        hmargin = 3.5cm,
    }
    \null\vskip 8.1pt% 开头给一个占位符然后垂直它8.1pt开始有文本

    \if@class@preface %检查布尔变量 @mcm@preface 是否为 true。检查布尔变量 @mcm@preface 是否为 true。
    \null %插入一个“空行”或占位符，确保垂直间距的准确性。常用于调整布局时占位
    \begin{center}
        {\zihao{0}\kaishu \text{武汉大学}}
    \end{center}\
    \null

    \class@titlepage@info
    
    \else % 如果\@class@preface 为 false，则跳过 \if 到 \else 之间的代码。执行\else 到 \fi之间的代码 
    \fi 
    \makeanothertitle
}

\newcommand\makeanothertitle{
    \newpage
    \begin{center}%
        {\zihao{-2}\heiti \@title \par} % 黑体本来就是粗的heiti字不使用\bfseries使用粗体的指令
        {\vskip1ex\zihao{4}\kaishu \@author \class@tokens@studentnumber \par}%
        {\vskip1ex\zihao{5}\kaishu \class@tokens@school\class@tokens@college \hspace{1em} \class@tokens@province\class@tokens@city \hspace{1em} \class@tokens@postcode \par}%
    \end{center}
}

