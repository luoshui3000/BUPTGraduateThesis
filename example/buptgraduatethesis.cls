%%
%% This is file `buptgraduatethesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% install/buptgraduatethesis.dtx  (with options: `cls')
%% 
%% Copyright (C) 2013-2024 by Xianling Wang <rioxwang@foxmail.com>
%% 
%% This file is a modified version of BUPTThesis project,
%% maintained by Yu Zhang <yu_zhang@ieee.org>.
%% 
%% The changes to the original work include the application
%% of xeCJK as Chinese solution, and the format modification
%% according to the latest format requirement introduced by
%% the Graduate School of BUPT.
%% 
%% This file is part of the BUPTGraduateThesis project.
%% ---------------------------------------------------------
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3c or later is part of all distributions of
%% LaTeX version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The current Maintainer of this work is Xianling Wang.
%% 
%% This work consists of the files buptgraduatethesis.dtx and
%% buptgraduatethesis.ins and the derived file buptgraduatethesis.cls,
%% buptgraduatethesis.cfg, buptgraduatethesis.bst, xeCJK-fonts.def.
%% 
%% To produce the documentation run the original source files
%% ending with `.dtx' through LaTeX.
%% 
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{buptgraduatethesis.cls}
[2016/11/23 v7.0 BUPT graduate thesis LaTeX2e class]

\RequirePackage{xkeyval}
\define@choicekey*[bupt]{class}{degree}[\bupt@tempa\bupt@degree]{%
  doctor,master,pmaster,pdoctor}[doctor]{\relax}
\define@choicekey*[bupt]{class}{classlevel}[\bupt@tempa\bupt@classlevel]{%
  open,control,confidential,classified,topsecret,%
  customized}[open]{\relax}
\define@boolkey[bupt]{class}{dedication}[false]{\relax}
\define@boolkey[bupt]{class}{committee}[true]{\relax}
\define@choicekey*[bupt]{class}{mathfont}[\bupt@tempa\bupt@mathfont]{%
  mathptmx, mtplus, mtpro, cm}[mathptmx]{\relax}
\define@boolkey[bupt]{class}{chapbib}[false]{\relax}
\define@choicekey*[bupt]{class}{finish}[\bupt@tempa\bupt@finish]{%
  online,print,peerreview}[print]{\relax}
\define@choicekey*[bupt]{class}{driver}[\bupt@tempa\bupt@driver]{%
  dvips,dvipdf,pdftex,xetex}[xetex]{%
  \PassOptionsToPackage{#1}{graphicx}
  \PassOptionsToPackage{#1}{hyperref}
  \PassOptionsToPackage{#1}{xcolor}
}
\presetkeys[bupt]{class}{%
  degree=doctor,%
  classlevel=open,%
  dedication=false,%
  committee=true,%
  mathfont=mathptmx,%
  chapbib=false,%
  finish=print,%
  driver=xetex%
}{}
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptionsX[bupt]<class>\relax
\LoadClass[12pt, a4paper, openright, twoside]{book}%
\RequirePackage{calc}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\ifcase\bupt@mathfont\relax
  \RequirePackage{mathptmx}
  \RequirePackage{courier}
  \RequirePackage[scaled=.92]{helvet}
  \RequirePackage{amsmath}
  \RequirePackage{amssymb}
\or
  \RequirePackage{amsmath}
  \RequirePackage{amssymb}
  \RequirePackage[mtbold,subscriptcorrection,mtplusscr,T1]{mathtime}
  \newcommand\hmmax{0}
\or
  \RequirePackage{times}
  \RequirePackage[scaled=.92]{helvet}
  \RequirePackage{amsmath}
  \RequirePackage[subscriptcorrection,slantedGreek]{mtpro}
  \RequirePackage[mtphrb]{mtpams}
  \RequirePackage[mtpscr,mtpfrak]{mtpb}
\or
  \RequirePackage{amsmath}
  \RequirePackage{amssymb}
\fi
\RequirePackage{bm}
\RequirePackage[low-sup]{subdepth}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\ifnum\bupt@driver=3
  \RequirePackage[AutoFakeBold,AutoFakeSlant]{xeCJK}
  \RequirePackage{CJKnumb}
  \xeCJKsetcharclass{"2460}{"2473}{1}
  \xeCJKsetup{EmboldenFactor=3}
  \punctstyle{quanjiao}
  \def\CJK@null{\kern\CJKnullspace\char"3007 \kern\CJKnullspace}
  \defaultfontfeatures{Mapping=tex-text}
  \input{xeCJK-fonts.def}
\else
  \RequirePackage{CJKutf8}
  \RequirePackage{CJKnumb}
  \RequirePackage{CJKpunct}
\fi
\RequirePackage{url}
\urlstyle{same}
\RequirePackage{indentfirst}
\RequirePackage{caption}
\RequirePackage{everysel}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage{subfig}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage[neverdecrease]{paralist}
\ifbupt@class@chapbib
  \RequirePackage[sectionbib,square,super,numbers,sort&compress]{natbib}
  \let\bupt@bibcite\bibcite
  \let\bupt@nocite\nocite
  \let\bupt@include\include
  \let\bupt@org@bibcite\org@bibcite
  \let\bupt@bibliographystyle\bibliographystyle
  \let\bupt@bibliography\bibliography
  \RequirePackage{chapterbib}
  \def\usechapbib{}
\else
  \RequirePackage[square,super,numbers,sort&compress]{natbib}
\fi
\RequirePackage{multibib}
\RequirePackage[usenames,dvipsnames,cmyk]{xcolor}
\RequirePackage{hyperref}
\hypersetup{
  unicode,%
  bookmarksopen=true,%
  colorlinks=true,%
  citebordercolor=white
}
\ifnum\bupt@finish=0%
  \hypersetup{%
    linkcolor=Blue,%
    citecolor=Blue,%
    urlcolor=Mahogany%
  }
  \RequirePackage{wallpaper}
\else%
  \hypersetup{%
    linkcolor=black,%
    citecolor=black,%
    urlcolor=black%
  }
\fi
\RequirePackage[toc,section=chapter]{glossaries}
\ifnum\bupt@finish=2
  \def\ispeerreview{}
\fi
\ifnum\bupt@driver=3
  \relax
\else
  \RequirePackage{breakurl}
\fi
\ifnum\bupt@driver=3
  \relax
\else
  \newcommand\song{\CJKfamily{song}}
  \newcommand\hei{\CJKfamily{hei}}
  \newcommand\kai{\CJKfamily{kai}}
  \newcommand\fs{\CJKfamily{fs}}
\fi
\newlength\CJKtwospaces
\newlength\CJKfourspaces
\newlength\bupt@linespace
\newcommand{\bupt@choosefont}[2]{%
  \setlength{\bupt@linespace}{#2*\real{#1}}%
  \fontsize{#2}{\bupt@linespace}\selectfont
}
\def\bupt@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \bupt@choosefont{##1}{#2}
  }
}
\bupt@define@fontsize{chuhao}{42bp}
\bupt@define@fontsize{xiaochu}{36bp}
\bupt@define@fontsize{yihao}{26bp}
\bupt@define@fontsize{xiaoyi}{24bp}
\bupt@define@fontsize{erhao}{22bp}
\bupt@define@fontsize{xiaoer}{18bp}
\bupt@define@fontsize{sanhao}{16bp}
\bupt@define@fontsize{xiaosan}{15bp}
\bupt@define@fontsize{sihao}{14bp}
\bupt@define@fontsize{xiaosi}{12bp}
\bupt@define@fontsize{dawu}{11bp}
\bupt@define@fontsize{wuhao}{10.5bp}
\bupt@define@fontsize{xiaowu}{9bp}
\bupt@define@fontsize{liuhao}{7.5bp}
\bupt@define@fontsize{xiaoliu}{6.5bp}
\bupt@define@fontsize{qihao}{5.5bp}
\bupt@define@fontsize{bahao}{5bp}
\bupt@define@fontsize{covertitlesize}{32bp}
\bupt@define@fontsize{ecovertitlesize}{26bp}
\bupt@define@fontsize{annotationsize}{8pt}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip
}
\newcommand*{\ziju}[1]{\renewcommand{\CJKglue}{\hskip #1}}
\newcommand{\keyspace}{\hspace{2em}}
\ifnum\bupt@driver=3
  \def\CJK@spaceChar{\char"3007} % why 0x3007?
  \def\CJKtwochars{\CJK@spaceChar\CJK@spaceChar}
  \def\bupt@circnum#1{%
  \ifnum \value{#1} = 1 \char"2460
  \else\ifnum \value{#1} = 2 \char"2461
  \else\ifnum \value{#1} = 3 \char"2462
  \else\ifnum \value{#1} = 4 \char"2463
  \else\ifnum \value{#1} = 5 \char"2464
  \else\ifnum \value{#1} = 6 \char"2465
  \else\ifnum \value{#1} = 7 \char"2466
  \else\ifnum \value{#1} = 8 \char"2467
  \else\ifnum \value{#1} = 9 \char"2468
  \else\ifnum \value{#1} = 10 \char"2469
  \else\ifnum \value{#1} = 11 \char"246A
  \else\ifnum \value{#1} = 12 \char"246B
  \else\ifnum \value{#1} = 13 \char"246C
  \else\ifnum \value{#1} = 14 \char"246D
  \else\ifnum \value{#1} = 15 \char"246E
  \else\ifnum \value{#1} = 16 \char"246F
  \else\ifnum \value{#1} = 17 \char"2470
  \else\ifnum \value{#1} = 18 \char"2471
  \else\ifnum \value{#1} = 19 \char"2472
  \else\ifnum \value{#1} = 20 \char"2473
    \else \textcircled{\qihao\arabic{#1}}
    \fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
  }
  \def\CJKleftparen{\char"FF08}
  \def\CJKrightparen{\char"FF09}
\else
  \def\CJKtwochars{\CJKchar{"030}{"000}\CJKchar{"030}{"000}}
  \def\bupt@circnum#1{%
  \ifnum \value{#1} = 1 \CJKchar{"024}{"060}
  \else\ifnum \value{#1} = 2 \CJKchar{"024}{"061}
  \else\ifnum \value{#1} = 3 \CJKchar{"024}{"062}
  \else\ifnum \value{#1} = 4 \CJKchar{"024}{"063}
  \else\ifnum \value{#1} = 5 \CJKchar{"024}{"064}
  \else\ifnum \value{#1} = 6 \CJKchar{"024}{"065}
  \else\ifnum \value{#1} = 7 \CJKchar{"024}{"066}
  \else\ifnum \value{#1} = 8 \CJKchar{"024}{"067}
  \else\ifnum \value{#1} = 9 \CJKchar{"024}{"068}
  \else\ifnum \value{#1} = 10 \CJKchar{"024}{"069}
  \else \textcircled{\qihao\arabic{#1}}
  \fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
  }
  \def\CJKleftparen{\CJKchar{"0FF}{"008}}
  \def\CJKrightparen{\CJKchar{"0FF}{"009}}
\fi
\def\CJKfourchars{\CJKtwochars\CJKtwochars}
\newcommand{\CJKemdash}{%
  \kern0.3ex\rule[0.8ex]{\CJKtwospaces}{0.25bp}\kern0.3ex%
}
\renewcommand\chapter{%
  \secdef\@chapter\@schapter%
}
\renewcommand\section{%
  \@startsection {section}{1}{\z@}%
  {-24bp \@plus -1ex \@minus -.2ex}%
  {6bp \@plus .2ex}%
  {\bfseries\csname bupt@title@font\endcsname\sihao[1.429]}% 此处控制section标题的字体
}
\renewcommand\subsection{%
  \@startsection{subsection}{2}{\z@}%
  {-16bp \@plus -1ex \@minus -.2ex}%
  {6bp \@plus .2ex}%
  {\bfseries\csname bupt@title@font\endcsname\xiaosi[1.538]}% 此处控制subsection标题的字体
}
\renewcommand\subsubsection{%
  \@startsection{subsubsection}{3}{\z@}%
  {-16bp \@plus -1ex \@minus -.2ex}%
  {6bp \@plus .2ex}%
  {\song\csname bupt@title@font\endcsname\xiaosi[1.667]}%
}
\def\bupt@preschapter{}
\def\bupt@schapterformat{}
\renewcommand{\chaptermark}[1]{\@mkboth{\@chapapp\ ~~#1}{}}
\def\@chapter[#1]#2{%
  \cleardoublepage\phantomsection%
  \thispagestyle{bupt@headings}%
  \global\@topnum\z@%
  \@afterindenttrue%
  \ifnum \c@secnumdepth >\m@ne
  \if@mainmatter
  \refstepcounter{chapter}%
  \addcontentsline{toc}{chapter}{%
    \protect\numberline{\@chapapp}#1%
  }
  \else
  \addcontentsline{toc}{chapter}{#1}%
  \fi
  \else
  \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \@makechapterhead{#2}
}
\def\@makechapterhead#1{%
  \vspace*{20bp}%
  {%
    \parindent \z@ \centering
    \bfseries\csname bupt@title@font\endcsname\sanhao[1] % 此处控制正文的章标题以及附录标题
    \ifnum \c@secnumdepth >\m@ne
    \@chapapp\hskip1em
    \fi
    #1\par\nobreak
    \vskip 24bp
  }
}
\def\@schapter#1{%
  \cleardoublepage\phantomsection%
  %\thispagestyle{bupt@plain}%
  \thispagestyle{bupt@headings}%  <摘要><abstract><目录><符号对照表><致谢><发表文章> 有页眉标题
  \global\@topnum\z@%
  \@afterindenttrue%
  \ifx\bupt@preschapter\empty
    \relax
  \else
    \bupt@preschapter
  \fi
  \@makeschapterhead{#1}
  \@afterheading}
\def\@makeschapterhead#1{%
  \vspace*{20bp}%
  {%
    \parindent \z@ \centering
    \bfseries\csname bupt@title@font\endcsname % 此处控制<摘要><abstract><目录><符号对照表><致谢><发表文章>的标题
    \ifx\bupt@schapterformat\empty
    \sanhao[1]
    \else
    \bupt@schapterformat
    \fi
    \interlinepenalty\@M
    #1\par\nobreak
    \vskip 24bp%
  }
}
\def\bupt@chapter*{%
  \@ifnextchar [ %
  {\bupt@@chapter}     % 如果是\bupt@chapter*[，按\bupt@@chapter处理
  {\bupt@@chapter@}    % 否则是\bupt@chapter*{<title>}，按\bupt@@chapter@处理
}
\def\bupt@@chapter@#1{%
  \bupt@@chapter[#1]{#1}%
}
\def\bupt@@chapter[#1]#2{%
  \@ifnextchar [ % ]
  {\bupt@@@chapter[#1]{#2}}      % 如果是\bupt@chapter*[#1]{#2}[，
                                 % 按\bupt@@@chapter[#1]{#2}处理
  {\bupt@@@chapter[#1]{#2}[][]}} % 如果是\bupt@chapter*[#1]{#2}
                                 % 按\bupt@@@chapter[#1]{#2}[][]处理
\def\bupt@@@chapter[#1]#2[#3]{%
  \@ifnextchar [ % ]
  {\bupt@@@@chapter[#1]{#2}[#3]} % 如果是\bupt@chapter*[#1]{#2}[#3][#4]，
                                  % 按\bupt@@@@chapter[#1]{#2}[#3]处理
  {\bupt@@@@chapter[#1]{#2}[#3][]}% 如果是\bupt@chapter*[#1]{#2}[#3]
                                  % 按\bupt@@@@chapter[#1]{#2}[#3][]处理
}
\def\bupt@@@@chapter[#1]#2[#3][#4]{%
  \cleardoublepage%
  \phantomsection%
  \def\@tmpa{#1}               % <tocline>
  \def\@tmpb{#3}               % <titlesize>
  \def\@tmpc{#4}               % <prefix>
  \ifx\@tmpa\@empty
    \pdfbookmark[0]{#2}{\expandafter\@gobble\string#2}
  \else
    \addcontentsline{toc}{chapter}{#1}
  \fi
  \ifx\@tmpc\@empty
    \def\bupt@preschapter{}
  \else
    \def\bupt@preschapter{%
      \par{%
        \sanhao[1]\bfseries%\hei % 此处控制中文摘要的标题
        \begin{center}
          {#4}
        \end{center}
      }
    }
  \fi
  \chapter*{#2}
  \@mkboth{#2}{#2}
}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand\tableofcontents{%
  \bupt@chapter*[]{\contentsname}
  \normalsize\@starttoc{toc}}
\def\bupt@toc@font{}%{\bfseries}%sffamily
\def\@tocrmarg{2em}
\def\@dotsep{1} % 目录点间的距离
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
  \vskip \z@ \@plus.2\p@
  {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima #3\relax
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {\csname bupt@toc@font\endcsname #4}\nobreak
    \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
    \nobreak{\normalfont \normalcolor #5}%
    \par}%
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
  \addpenalty{-\@highpenalty}%
  \vskip 4bp \@plus\p@
  \setlength\@tempdima{4em}%
  \begingroup
  \parindent \z@ \rightskip \@pnumwidth
  \parfillskip -\@pnumwidth
  \leavevmode
  \advance\leftskip\@tempdima
  \hskip -\leftskip
  {\bfseries\csname bupt@toc@font\endcsname #1} % numberline is called here, and it use @tempdima % 此处控制目录中章标题的字体
  \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
  \nobreak{\normalfont \normalcolor #2}\par
  \penalty\@highpenalty
  \endgroup
  \fi}
\def\CJKindent{%
  \settowidth\CJKtwospaces{\CJKtwochars}%
  \parindent\CJKtwospaces
}
\renewcommand{\thefootnote}{\bupt@circnum{footnote}}
\renewcommand{\thempfootnote}{\bupt@circnum{mpfootnote}}
\def\footnoterule{%
  \vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@%
}
\let\bupt@footnotesize\footnotesize
\renewcommand\footnotesize{\bupt@footnotesize\xiaowu[1.5]}
\def\@makefnmark{%
  \textsuperscript{\hbox{\normalfont\@thefnmark}}%
}
\long\def\@makefntext#1{
  \bgroup
  \setbox\@tempboxa\hbox{%
    \hb@xt@ 2em{\@thefnmark\hss}}
  \leftmargin\wd\@tempboxa
  \rightmargin\z@
  \linewidth \columnwidth
  \advance \linewidth -\leftmargin
  \parshape \@ne \leftmargin \linewidth
  \footnotesize
  \@setpar{{\@@par}}%
  \leavevmode
  \llap{\box\@tempboxa}%
  #1\par%
  \egroup%
}
\def\bupt@active@cjk{
  \count@=127
  \@whilenum\count@<255 \do{%
    \advance\count@ by 1
    \lccode`\~=\count@
    \catcode\count@=\active
    \lowercase{\def~{\kern1ex}}}}
\AtEndOfClass{\bupt@active@cjk\input{buptgraduatethesis.cfg}}
\def\bupt@fixselectfont{%
  \DeclareRobustCommand{\selectfont}{%
    \ifx\f@linespread\baselinestretch
    \else\set@fontsize\baselinestretch\f@size\f@baselineskip
    \fi
    \xdef\font@name{%
      \csname\curr@fontshape/\f@size\endcsname}%
    \pickup@font
    \font@name
    % CJK addition:
    \CJK@bold@false
    \csname \curr@fontshape\endcsname
    % everysel addition:
    \@EverySelectfont@EveryHook
    \@EverySelectfont@AtNextHook
    \gdef\@EverySelectfont@AtNextHook{}%
    % end additions
    \size@update
    \enc@update
  }
}
\def\bupt@beginCJK{%
  \begin{CJK*}{UTF8}{song}%
    \sloppy\CJKindent\CJKtilde%
  }
\def\bupt@endCJK{%
  \bupt@inside@back@cover%
  \bupt@back@cover%
\end{CJK*}%
}
\ifnum\bupt@driver=3
  \AtBeginDocument{\CJKindent}
\else
  \let\bupt@begindocumenthook\@begindocumenthook
  \let\bupt@enddocumenthook\@enddocumenthook
  \def\AtBeginDocument{\g@addto@macro\bupt@begindocumenthook}
  \def\AtEndDocument{\g@addto@macro\bupt@enddocumenthook}
  \def\@begindocumenthook{\bupt@begindocumenthook\bupt@beginCJK}
  \def\@enddocumenthook{\bupt@endCJK\bupt@enddocumenthook}
\fi
\AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}
\AtBeginDvi{\special{!%
    \@percentchar\@percentchar BeginPaperSize: a4
    ^^Ja4^^J\@percentchar\@percentchar EndPaperSize}}
\setlength{\hoffset}{-1in}
\addtolength{\hoffset}{5mm}           % 装订线: 1in + \hoffset = 5mm
\setlength{\voffset}{-1in}            %
\setlength\marginparwidth{0mm}        %
\setlength\marginparsep{0mm}          %
\setlength{\textwidth}{\paperwidth}   %
\addtolength{\textwidth}{-55mm}       % 版芯宽度: 155mm = 210mm - 55mm
\setlength{\oddsidemargin}{22.5mm}    % 内侧页边距: 奇数页左侧页边距
\setlength{\evensidemargin}{22.5mm}   % 外侧页边距: 偶数页左侧页边距
\setlength{\textheight}{\paperheight} %
\setlength{\headheight}{20pt}         % 页眉高度: 20pt
\setlength{\topskip}{0pt}             %
\setlength{\skip\footins}{15pt}       %
\setlength{\topmargin}{25mm}          % 上边距: 25 mm (原为30mm)
\setlength{\footskip}{15mm}           %
\setlength{\headsep}{5mm}             %
\addtolength{\textheight}{-77mm}      % 文字高度:  297mm (纸张高度)
                                      %          - 25mm (上边距)
                                      %          -  7mm (\headerheight, 20pt)
                                      %          -  5mm (\headsep)
                                      %          - 15mm (\footskip)
                                      %          - 25mm (下边距)
\renewcommand\frontmatter{%
  \cleardoublepage%
  \@mainmatterfalse%
  \pagenumbering{Roman}
  \pagestyle{bupt@empty}
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{bupt@headings}
}
\def\bupt@nocite#1{%
  \@bsphack%
  \ifx \@onlypreamble \document %
  \@for \@citeb :=#1\do {%
    \edef \@citeb {\expandafter \@firstofone \@citeb }
    \if@filesw \immediate \write \@auxout {%
      \string \citation {\@citeb }
    }
    \fi%
    \@ifundefined {b@\@citeb }{%
      \G@refundefinedtrue \@latex@warning {%
        Citation `\@citeb ' undefined}
    }{%
    }
  }
  \else%
  \@latex@error {%
    Cannot be used in preamble%
  }
  \@eha%
  \fi%
  \@esphack%
}
\renewcommand\backmatter{%
  % \let\bibcite\bupt@bibcite
  % \let\nocite\bupt@nocite
  \ifbupt@class@chapbib%
  \let\bibsection\bupt@bibsection
  %\renewcommand*\chapter{\subsection}
  \let\bibcite\bupt@bibcite
  \let\nocite\bupt@nocite
  \let\include\bupt@include
  \let\org@bibcite\bupt@org@bibcite
  \let\bibliographystyle\bupt@bibliographystyle
  \let\bibliography\bupt@bibliography
  \fi
  \long\def\bibsection{%
    \subsection*{%
      \bibname \@mkboth{%
        \MakeUppercase{\bibname}
      }
      % {%
      %   \MakeUppercase{\bibname}
      % }
    }
  }
  \cleardoublepage%
}
\let\bupt@cleardoublepage\cleardoublepage
\newcommand{\bupt@clearemptydoublepage}{%
  \clearpage{\pagestyle{empty}\bupt@cleardoublepage}}
\let\cleardoublepage\bupt@clearemptydoublepage
%% ps@bupt@empty 无页眉，无页脚
\def\ps@bupt@empty{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty%
}
%% ps@bupt@plain 无页眉，页脚为五号页码
\def\ps@bupt@plain{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \def\@oddfoot{\hfil\wuhao\thepage\hfil}%
  \let\@evenfoot=\@oddfoot%
}
%% ps@bupt@headings 有页眉有页脚
\def\ps@bupt@headings{%
\def\@oddhead{%
\vbox to\headheight{%
\hb@xt@\textwidth{%
\xiaowu\song\hfil\leftmark\hfil%
}%
\vskip3pt\hbox{%
\vrule width\textwidth height0.4pt depth0pt
}
}
}
\def\@evenhead{%
\vbox to\headheight{%
\hb@xt@\textwidth{%
\xiaowu\song\hfil\bupt@page@head\hfil
}%
\vskip3pt\hbox{%
\vrule width\textwidth height0.4pt depth0pt
}
}
}
\def\@oddfoot{\hfil\wuhao\thepage\hfil}
\let\@evenfoot=\@oddfoot
}
%% ps@bupt@pubheadings 有页眉有页脚（发表文章）
\def\ps@bupt@pubheadings{%
\def\@oddhead{%
\vbox to\headheight{%
\hb@xt@\textwidth{%
\xiaowu\song\hfil\bupt@label@tableofpublications\hfil%
}%
\vskip3pt\hbox{%
\vrule width\textwidth height0.4pt depth0pt
}
}
}
\def\@evenhead{%
\vbox to\headheight{%
\hb@xt@\textwidth{%
\xiaowu\song\hfil\bupt@page@head\hfil
}%
\vskip3pt\hbox{%
\vrule width\textwidth height0.4pt depth0pt
}
}
}
\def\@oddfoot{\hfil\wuhao\thepage\hfil}
\let\@evenfoot=\@oddfoot
}
\newcommand\bupt@def@metadata[2][]{%
  \def\@tempa{#1}
  \ifx\@tempa\@empty
    \def\bupt@def{\expandafter\gdef}
  \else
    \def\bupt@def{\long\expandafter\gdef}
  \fi
  \bupt@def\csname #2\endcsname##1{%
    \bupt@def\csname bupt@meta@#2\endcsname{##1}
  }
  \csname #2\endcsname{}
}
\bupt@def@metadata{studentid}
\bupt@def@metadata{ctitle}
\bupt@def@metadata{cdegree}
\bupt@def@metadata{cdepartment}
\bupt@def@metadata{cmajor}
\bupt@def@metadata{cauthor}
\bupt@def@metadata{classnumber}
\bupt@def@metadata{udc}
\bupt@def@metadata{schoolserial}
\bupt@def@metadata{ctrainingmode}
\bupt@def@metadata{csupervisor}
\bupt@def@metadata{cassosupervisor}
\bupt@def@metadata{ccosupervisor}
\bupt@def@metadata{startdate}
\bupt@def@metadata{finishdate}
\bupt@def@metadata[long]{cabstract}
\bupt@def@metadata{ckeywords}
\bupt@def@metadata{etitle}
\bupt@def@metadata{edegree}
\bupt@def@metadata{edepartment}
\bupt@def@metadata{emajor}
\bupt@def@metadata{eauthor}
\bupt@def@metadata{etrainingmode}
\bupt@def@metadata{esupervisor}
\bupt@def@metadata{eassosupervisor}
\bupt@def@metadata{ecosupervisor}
\bupt@def@metadata[long]{eabstract}
\bupt@def@metadata{ekeywords}
\bupt@def@metadata{hiddenmark}
\bupt@def@metadata{customclasslevel}
\def\bupt@hide#1{%
  \ifnum\bupt@finish=2
    \bupt@meta@hiddenmark
  \else
    {#1}
  \fi%
}
\newlength\bupt@titlewidth
\newcommand{\titlebreak}{}
\ifnum\bupt@degree=3
\newcommand{\bupt@front@cover}{%
  \song\noindent%
  \begin{minipage}[t]{.4\textwidth}
    \sihao[1.24]
    \setlength{\extrarowheight}{0pt}
    \setlength{\arrayrulewidth}{0.5bp}
    \begin{tabular}{lp{5em}}
      \bupt@label@classnumber\bupt@title@sep & {\hfil\bupt@hide{\bupt@meta@classnumber}\hfil} \\
      [-3pt] \cline{2-2} \\
      \bupt@label@udc\bupt@title@sep & {\hfil\bupt@hide{\bupt@meta@udc}\hfil} \\
      [-3pt] \cline{2-2} \\
    \end{tabular}%
    \hfill%
  \end{minipage}
  \hspace{\fill}%
  \begin{minipage}[t]{.4\textwidth}
    \hfill%
    \sihao[1.24]
    \setlength{\extrarowheight}{0pt}
    \setlength{\arrayrulewidth}{0.5bp}
    \begin{tabular}{lp{5em}}
      \bupt@label@classlevel\bupt@title@sep & {\hfil\bupt@hide{\bupt@meta@classlevel}\hfil} \\
      [-3pt] \cline{2-2} \\
      \bupt@label@schoolserial\bupt@title@sep & {\hfil\bupt@hide{\bupt@meta@schoolserial}\hfil} \\
      [-3pt] \cline{2-2} \\
    \end{tabular}
  \end{minipage}\\[2cm]
  \begin{minipage}[t]{\textwidth}
    \centering
    \covertitlesize[1.0]{\ziju{0.5em}\hei\bupt@label@cschoolname}\par
  \end{minipage}\\[2cm]
  \begin{minipage}[t]{\textwidth}
    \centering
    \covertitlesize[1.0]{\ziju{0.5em}\hei\bupt@label@covertitle}\par
  \end{minipage}\\[2.5cm]
  \begin{minipage}[t]{\textwidth}
    \centering
    \xiaoer[1.5]
    \renewcommand\titlebreak{\\\global\let\bupt@long@title\@empty}
    {\hei\bupt@meta@ctitle}\par
  \end{minipage}\\[2cm]
  \begin{minipage}[t]{\textwidth}
    \centering
    \xiaoer[1.5]
    {\hei\bupt@meta@cauthor}\par
  \end{minipage}\\[4cm]
  \begin{minipage}[t]{\textwidth}
    \centering
    \sihao[2.0]{\ziju{0.5em}\bupt@label@cschoolname}\par
  \end{minipage}
  \normalfont
}
\else
\newcommand{\bupt@front@cover}{%
  \asong\bfseries
  \vspace*{-1.15cm}
  \begin{minipage}[t]{\textwidth}%右上角密级
    \sihao
    \raggedleft
    \ifnum\bupt@classlevel=0
      \bupt@label@classlevel\bupt@title@sep\bupt@meta@classlevel
    \else
      \bupt@label@classlevel\bupt@title@sep\bupt@meta@classlevel
    \fi
  \end{minipage}\\[1.71cm]
  \begin{minipage}[t]{\textwidth}%北京邮电大学、硕士（博士）学位论文、logo
    \centering
    \hspace{0.3cm}
    \includegraphics[width=11.6cm]{logo/buptname}\par
    \vspace{0.24cm}
    \covertitlesize[1.0]{\ahei\bupt@label@covertitle}\par
    \vspace{0.95cm}
    \includegraphics[width=3.09cm]{logo/buptseal}
  \end{minipage}\\[1.8cm]
  \begin{minipage}[t]{\textwidth}%题目
    \centering
    \xiaoer[1.5]
    \vspace{0.5cm}
    \settowidth{\bupt@titlewidth}{\bupt@meta@ctitle}
    \setlength{\extrarowheight}{0pt}
    \setlength{\arrayrulewidth}{0.5bp}
    \begin{tabular}{@{}p{36bp}@{\bupt@title@sep}p{95mm}@{}}
      \bupt@label@ctitle & %
      \parbox[t]{95mm}{%
        \centering%
        \renewcommand\titlebreak{\\\global\let\bupt@long@title\@empty}
        \rule[-5bp]{95mm}{0.5bp}\\[-27bp]
        \bupt@meta@ctitle%
        \ifx\bupt@long@title\@empty
          \\[-27bp]%
          \rule[-5bp]{95mm}{0.5bp}%
        \else
          \ifdim\bupt@titlewidth>95mm
            \\[-27bp]%
            \rule[-5bp]{95mm}{0.5bp}%
          \fi
        \fi
      }%
      \\%
    \end{tabular}
  \end{minipage}\\[1.3cm]
  \begin{minipage}[t]{\textwidth}%学号姓名等
    \centering
    \sihao[1.24]
    \setlength{\extrarowheight}{0pt}
    \setlength{\arrayrulewidth}{0.5bp}
    \begin{tabular}{lc}
      \bupt@label@studentid\bupt@title@sep & {\hfill\bupt@hide{\bupt@meta@studentid}\hfill} \\
      [-3pt] \cline{2-2} \\
      \bupt@label@cauthor\bupt@title@sep & {\hfill\bupt@hide{\bupt@meta@cauthor}\hfill} \\
      [-3pt] \cline{2-2} \\
      \bupt@label@cmajor\bupt@title@sep & {\hfill\bupt@meta@cmajor\hfill} \\
      [-3pt] \cline{2-2} \\
      \bupt@label@ctrainingmode\bupt@title@sep & {\hfill\bupt@hide{\bupt@meta@ctrainingmode}\hfill} \\
      [-3pt] \cline{2-2} \\
      \bupt@label@csupervisor\bupt@title@sep & {\hfill\bupt@hide{\bupt@meta@csupervisor}\hfill} \\
      [-3pt] \cline{2-2} \\
      \bupt@label@cdepartment\bupt@title@sep & {\hfill\bupt@meta@cdepartment\hfill} \\
      [-3pt] \cline{2-2} \\
    \end{tabular}
  \end{minipage}\\[0.7cm]
  \normalfont
}
\fi
\newcommand{\bupt@front@ecover}{
  \cleardoublepage
  \ifnum\bupt@degree=3
    \relax
  \else
  \asong\bfseries
  \vspace*{-1.15cm}
  \begin{minipage}[t]{\textwidth}%右上角密级
    \sihao
    \raggedleft
    \ifnum\bupt@classlevel=0
      \bupt@label@eclasslevel\bupt@title@sep\bupt@meta@eclasslevel
    \else
      \bupt@label@eclasslevel\bupt@title@sep\bupt@meta@eclasslevel
    \fi
  \end{minipage}\\[1.71cm]
  \begin{center}
    \begin{minipage}[t]{\textwidth}%北京邮电大学、硕士（博士）学位论文、logo
      \centering
      \includegraphics[width=15cm]{logo/bupt_en_name_and_seal}\par
      \vspace{1cm}
      \ecovertitlesize[1.0]{\ahei\bupt@label@ecovertitle}\par
    \end{minipage}\\[1.8cm]
    \begin{minipage}[t]{\textwidth}%题目
      \centering
      \xiaoer[1.5]
      \vspace{0.5cm}
      \settowidth{\bupt@titlewidth}{\bupt@meta@etitle}
      \setlength{\extrarowheight}{0pt}
      \setlength{\arrayrulewidth}{0.5bp}
      \begin{tabular}{r p{110mm}}
        \bupt@label@etitle~\bupt@title@esep & %
        \parbox[t]{110mm}{%
          \centering%
          \renewcommand\titlebreak{\\\global\let\bupt@long@title\@empty}
          \ifdim\bupt@titlewidth<110mm
            \bupt@meta@etitle
            \ifx \bupt@long@etitle\@empty
              \\[-54bp]%
              \rule[-5bp]{110mm}{0.5bp}\\
              \rule[-5bp]{110mm}{0.5bp}
            \else
              \\[-27bp]%
              \rule[-5bp]{110mm}{0.5bp}
            \fi
          \else
            \rule[-5bp]{110mm}{0.5bp}\\%
            \rule[-5bp]{110mm}{0.5bp}\\[-54bp]%
            \bupt@meta@etitle\\[-27bp]%
            \rule[-5bp]{110mm}{0.5bp}
          \fi
        }%
        \\%
      \end{tabular}
    \end{minipage}\\[1.5cm]
    \begin{minipage}[t]{\textwidth}%学号姓名等
      \centering
      \sihao[1.24]
      \setlength{\extrarowheight}{0pt}
      \setlength{\arrayrulewidth}{0.5bp}
      \begin{tabular}{rc}
        \bupt@label@estudentid\bupt@title@esep & {\hfill\bupt@hide{\bupt@meta@studentid}\hfill} \\
        [-3pt] \cline{2-2} \\
        \bupt@label@eauthor\bupt@title@esep & {\hfill\bupt@hide{\bupt@meta@eauthor}\hfill} \\
        [-3pt] \cline{2-2} \\
        \bupt@label@emajor\bupt@title@esep & {\hfill\bupt@meta@emajor\hfill} \\
        [-3pt] \cline{2-2} \\
        \bupt@label@etrainingmode\bupt@title@esep & {\hfill\bupt@hide{\bupt@meta@etrainingmode}\hfill} \\
        [-3pt] \cline{2-2} \\
        \bupt@label@esupervisor\bupt@title@esep & {\hfill\bupt@hide{\bupt@meta@esupervisor}\hfill} \\
        [-3pt] \cline{2-2} \\
        \bupt@label@edepartment\bupt@title@esep & {\hfill\bupt@meta@edepartment\hfill} \\
        [-3pt] \cline{2-2} \\
      \end{tabular}
    \end{minipage}\\[1cm]
    \normalfont
    \fi
  \end{center}
}
  %</cls>
  %    \end{macrocode}
  %
  % 前封里(封二)、底封里(封三)与封底(封四)
  %    \begin{macrocode}
  %<*cls>
  \newcommand{\bupt@inside@front@cover}{%
    \cleardoublepage
    \ifnum\bupt@degree=3
      \song\noindent%
      \begin{minipage}[t]{\textwidth}
        \centering
        \xiaoer[1.5]
        \renewcommand\titlebreak{\\\global\let\bupt@long@title\@empty}
        {\hei\bupt@meta@ctitle}\par
      \end{minipage}\\[1cm]
      \begin{minipage}[t]{\textwidth}
        \centering
        \xiaoer[1.5]
        {\hei\bupt@meta@etitle}\par
      \end{minipage}\\[6cm]
      \begin{minipage}[t]{\textwidth}
        \centering
        \xiaosan[1.5]
        \setlength{\extrarowheight}{0pt}
        \setlength{\arrayrulewidth}{0.5bp}
        \begin{tabular}{lc}
          \bupt@label@cauthor\bupt@title@sep & {\bupt@hide{\bupt@meta@cauthor}\hfill} \\
          \bupt@label@cdepartment\bupt@title@sep & {\bupt@meta@cdepartment\hfill} \\
          \bupt@label@cmajor\bupt@title@sep & {\bupt@meta@cmajor\hfill} \\
          \bupt@label@ctrainingmode\bupt@title@sep & {\bupt@hide{\bupt@meta@ctrainingmode}\hfill} \\
          \bupt@label@csupervisor\bupt@title@sep & {\bupt@hide{\bupt@meta@csupervisor}\hfill} \\
        \end{tabular}
      \end{minipage}\\[3cm]
      \begin{minipage}[t]{\textwidth}
        \centering
        \xiaosan[1.5]
        \setlength{\extrarowheight}{0pt}
        \setlength{\arrayrulewidth}{0.5bp}
        \begin{tabular}{lc}
          \bupt@label@startdate\bupt@title@sep & \bupt@meta@startdate \\
          \bupt@label@finishdate\bupt@title@sep & \bupt@meta@finishdate \\
        \end{tabular}
      \end{minipage}
      \normalfont
    \else
      \relax
    \fi
}
\newcommand{\bupt@inside@back@cover}{%
  \cleardoublepage
}
\newcommand{\bupt@back@cover}{%
}
  %</cls>
  %    \end{macrocode}
  %
  % 答辩委员会名单页
  %    \begin{macrocode}
  %<*cls>
\def\bupt@committee@title{答辩委员会名单}
\newcommand{\bupt@committee}{%
  \cleardoublepage
  \begin{center}
    \sanhao\hei\bupt@committee@title
  \end{center}
  \input{committee}

}

\newcommand\bupt@underline[2][6em]{%
  \hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt%
}
%% 独创性声明与授权说明
\newcommand{\bupt@declaration}{%
  \begin{center}
    %\sihao[1.5]\hei\bupt@declaration@title
    \sanhao[1.5]\hei\bupt@declaration@title  %改为三号
  \end{center}
  \par{%
    \parindent\CJKtwospaces\bupt@declaration@body
  }
  %\vskip1.2cm
  \par{%
    \parindent\CJKtwospaces
    \bupt@label@authorsigniture\bupt@underline[38mm]\relax
    \qquad
    \bupt@label@date\bupt@underline[38mm]\relax
  }%
}
\newcommand{\bupt@authorization}{%
  \begin{center}
    %\sihao[1.5]\hei\bupt@authorization@title
    \sanhao[1.5]\hei\bupt@authorization@title %改为三号
  \end{center}
  \par{%
    \parindent\CJKtwospaces\bupt@authorization@body
  }
  %\vskip1.2cm
  \par{%
    \parindent\CJKtwospaces
    \bupt@label@authorsigniture\bupt@underline[38mm]\relax
    \qquad
    \bupt@label@date\bupt@underline[38mm]\relax
  }%
  %\vskip1cm
  \par{%
    \parindent\CJKtwospaces
    \bupt@label@supervisorsigniture\bupt@underline[38mm]\relax
    \qquad
    \bupt@label@date\bupt@underline[38mm]\relax
  }%
}
\newcommand{\bupt@makedeclauth}{%
  \cleardoublepage
  \vfill
  \bupt@declaration
  \vfill
  \bupt@authorization
  \vfill
}
\newcommand{\BUPT@makededication}{%
  \cleardoublepage
  \input{dedication}
}
\newcommand{\makefrontmatter}{
  \frontmatter%
  \hypersetup{%
    pdftitle={\bupt@meta@ctitle},
    pdfauthor={\bupt@hide{\bupt@meta@cauthor}}
  }%
  \phantomsection
  \pdfbookmark[-1]{\bupt@meta@ctitle}{ctitle}
  \normalsize%
  \begin{titlepage}
    \bupt@front@cover
    \bupt@front@ecover
    \bupt@inside@front@cover
    \ifnum\bupt@degree=3
    \else
      \ifnum\bupt@finish=2
      \else
      \ifbupt@class@committee
      \bupt@committee
      \fi
      \bupt@makedeclauth
      \fi
    \fi
  \end{titlepage}
  \ifbupt@class@dedication
  \bupt@makededication
  \fi
  \cleardoublepage
  \normalsize
  \bupt@makeabstract
  \let\@tabular\bupt@tabular%
  \tableofcontents
}
%% 生成中英文摘要页
\newcommand{\bupt@makeabstract}{%
  %\pagestyle{bupt@plain}
  \pagestyle{bupt@headings}  %摘要偶数页显示页眉
  \pagenumbering{Roman}
  \bupt@chapter*[\bupt@label@cabstract]%
  {\bupt@label@cabstract}%
  [\xiaosan\hei]%
  [\centering\sanhao\bupt@meta@ctitle]
  {
    \sihao[1.6]
    \par{
      \CJKindent
      \song\bupt@meta@cabstract
    }\par
    \vspace{12bp}
    \setbox0=\hbox{{\hei \hspace{2em} \bupt@label@ckeywords}}
    \noindent\hangindent\wd0\hangafter1\box0\bupt@meta@ckeywords
  }
  \bupt@chapter*[\bupt@label@eabstract]%
  {\bupt@label@eabstract} % no tocline
  [\xiaosan]
  [\centering\sanhao\textbf{\MakeUppercase\bupt@meta@etitle}] % 此处控制英文摘要标题的字体
  {
    \sihao[1.5]
    \par{%
      \CJKindent
      \bupt@meta@eabstract
    }\par
    \vspace{24bp}
    \setbox0=\hbox{\hspace{2em} \textbf{KEY WORDS:\enskip}}
    \noindent\hangindent\wd0\hangafter1\box0\bupt@meta@ekeywords
  }
}
\newenvironment{listofnotations}[1][2.5cm]{
  \bupt@chapter*[]{\bupt@label@listofnotations} % 不入目录
  \noindent\begin{list}{}%
    {\vskip-30bp\xiaosi[1.6]
      \renewcommand\makelabel[1]{##1\hfil}
      \setlength{\labelwidth}{#1}  % 标签盒子宽度
      \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
      \setlength{\itemindent}{0cm} % 标签缩进量
      \setlength{\leftmargin}{\labelwidth+\labelsep+24bp} %
      \setlength{\rightmargin}{0cm}
      \setlength{\parsep}{0cm} % 段落间距
      \setlength{\itemsep}{0cm} %
      \setlength{\listparindent}{0cm} % 段落缩进量
      \setlength{\topsep}{0pt} %
    }}{\end{list}}
\let\bupt@bibsection\bibsection
\ifbupt@class@chapbib\relax%
\renewcommand{\bibsection}{%
  \bupt@bibsection%
  \addcontentsline{toc}{section}{\bibname}\wuhao[1.2]%
  \setlength{\bibsep}{6bp plus 0.5ex minus 0.2ex}}
\else
\renewcommand{\bibsection}{%
  \bupt@bibsection%
  \addcontentsline{toc}{chapter}{\bibname}\wuhao[1.2]}
\fi
\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{%
  \ifNAT@swa
  \unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
  \if*#3*%
  \else%
  \ (#3)%
  \fi%
  \else%
  #1%
  \fi%
  \endgroup%
}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{%
  \begingroup%
  \let\@cite\NAT@citenum%
  \citep{#1}%
  \endgroup%
}
\let\bupt@appendix\appendix
\renewenvironment{appendix}{%
  \bupt@appendix
  \gdef\@chapapp{\appendixname~\thechapter}
}{}
\newenvironment{appendix*}{%
  \bupt@appendix
  \gdef\@chapapp{\appendixname}%
}{}
\setlength{\glsdescwidth}{0.9\linewidth} % 缩略语描述列宽
\newglossarystyle{bupt@acronyms@style}{  % 设置自定义缩略语表格式
  \setglossarystyle{long}                % 以 long 样式为基础
  \renewcommand*{\glossentry}[2]{%
    \glossentryname{##1} & \glossentrydesc{##1}\char"FF0C\glossentrysymbol{##1}\\
  }
}
\setglossarystyle{bupt@acronyms@style} % 选择自定义的缩略语表样式
\newglossary[alg]{acronym}{acr}{acn}{\bupt@label@listofacronyms}
\makeglossaries
\renewcommand{\newacronym}[4]{%
  \newglossaryentry{#1}{%
    type=\acronymtype,%
    name={#2},%
    description={#3},%
    text={#2},%
    descriptionplural={#3\acrpluralsuffix},%
    first={#2}, %{#3 (#2)},%
    plural={#2\acrpluralsuffix},%
    firstplural={\@glo@descplural\space (\@glo@plural)},%
    symbol={#4}%
  }%
}
\renewcommand{\glsdisplayfirst}[4]{
  \!{#3}%
  \ifnum\bupt@driver=3
  \!\char"FF08% 中文括号“（”
  \!{#2}%
  \char"FF0C% 全宽逗号“，”
  \!{#1}%
  \!\char"FF09% 中文括号“）”
  \else
  \!\CJKchar{"0FF}{"008}% 中文括号“（”
  \!{#2}%
  \CJKchar{"0FF}{"00C}% 全宽逗号“，”
  \!{#1}%
  \!\CJKchar{"0FF}{"009}% 中文括号“）”
  \fi
}
\renewcommand{\glsdefaulttype}{acronym}
\renewcommand{\glossarysection}[2][\@gls@title]{\chapter{#2}}
\newcommand{\tableofacronyms}{\printglossary[type=\acronymtype]}
\def\newcite#1#2{%
  \expandafter\gdef\csname bupt@cite@#1\endcsname{#2}
  \expandafter\newcites{#1}{%
    \protect%
    \csname bupt@cite@#1\endcsname%
  }
  \ifnum\bupt@finish=2
  \csname nocite#1\endcsname{BSTpeerreview}
  \fi
  \csname nocite#1\endcsname{BSTcontrol}
  \csname bibliographystyle#1\endcsname{buptgraduatethesis}
}
\newenvironment{tableofpublications}{%
  \cleardoublepage       % 从奇数页开始
  % [<tocline>]{<title>}[<titlesize>][<prefix>]
  \bupt@chapter*[\bupt@label@tableofpublications]{%
    \bupt@label@tableofpublications} % 学术论文目录标题
\wuhao[1.2]
}
{
  \renewcommand*{\chapter}{\bupt@backup@chapter}
}
\newenvironment{acknowledgement}{%
  \cleardoublepage               % 从奇数页开始
  \bupt@chapter*[\bupt@label@acknowledgement]{%
    \bupt@label@acknowledgement}[\bupt@label@acknowledgement]
}{}
\renewcommand{\eqref}[1]{\textup{(\ref{#1})}}
\renewcommand\theequation{%
  \ifnum \c@chapter>\z@%
  \thechapter-%
  \fi\@arabic\c@equation%
}
\gdef\@endtrivlist#1{%
  \if@inlabel \indent \fi
  \if@newlist \@noitemerr \fi
  \ifhmode
  \ifdim\lastskip >\z@ #1\unskip \par
  \else #1\unskip \par \fi
  \fi
  \if@noparlist \else
  \ifdim\lastskip >\z@
  \@tempskipa\lastskip \vskip -\lastskip
  \advance\@tempskipa\parskip \advance\@tempskipa -\@outerparskip
  \vskip\@tempskipa
  \fi
  \@endparenv
  \fi #1%
}
\renewtheoremstyle{plain}{%
\item[\hskip\labelsep \theorem@headerfont%
  ##1\ ##2%
  \theorem@separator]
}{%
\item[\hskip\labelsep \theorem@headerfont%
  ##1\ ##2\ %
  \CJKleftparen ##3 \CJKrightparen \!%
  \theorem@separator\!]%
}
\renewtheoremstyle{nonumberplain}{%
\item[\hskip\labelsep \theorem@headerfont%
  ##1%
  \theorem@separator]%
}{%
\item[\hskip\labelsep \theorem@headerfont%
  ##1\
  \CJKleftparen ##3 \CJKrightparen \!%
  \theorem@separator\!]%
}
\theoremstyle{plain}
\theorembodyfont{\song\rmfamily}
\theoremheaderfont{\bfseries} % 此处控制定理标题的字体
\theoremsymbol{}
\setlength{\floatsep}{12bp \@plus4pt \@minus1pt}
\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{12bp \@plus4pt \@minus2pt}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\let\old@tabular\@tabular
\def\bupt@tabular{\wuhao[1.5]\old@tabular}
\DeclareCaptionLabelFormat{bupt}{%
  {\wuhao[1.5]\kai #1~\rmfamily #2}
}
\DeclareCaptionLabelSeparator{bupt}{\hspace{1em}}
\DeclareCaptionFont{bupt}{\wuhao[1.5]\kai}
\captionsetup{%
  labelformat=bupt,%
  labelsep=bupt,%
  font=bupt%
}
\captionsetup[table]{%
  position=top,%
  belowskip={12bp-\intextsep},%
  aboveskip=3bp%
}
\captionsetup[figure]{%
  position=bottom,%
  belowskip={12bp-\intextsep},%
  aboveskip=-2bp%
}
\captionsetup[subfloat]{%
  font=bupt,%
  captionskip=6bp,%
  nearskip=6bp,%
  farskip=0bp,%
  topadjust=0bp%
}
\renewcommand\thefigure{%
  \ifnum \c@chapter>\z@
  \thechapter-\fi\@arabic\c@figure%
}
\renewcommand\thetable{%
  \ifnum \c@chapter>\z@ %
  \thechapter-\fi\@arabic\c@table%
}
\def\LT@c@ption#1[#2]#3{%
  \LT@makecaption#1\fnum@table{#3}%
  \def\@tempa{#2}%
  \ifx\@tempa\@empty%
  \else{%
    \let\\\space%
    \addcontentsline{lot}{table}{%
      \protect\numberline{%
        \tablename\hskip0.5em\thetable%
      }{#2}
    }
  }%
  \fi%
}
\let\bupt@LT@array\LT@array
\def\LT@array{\wuhao[1.5]\bupt@LT@array}
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi%
  \hrule \@height #1 \futurelet
  \reserved@a\@xhline%
}
\endinput
%%
%% End of file `buptgraduatethesis.cls'.
