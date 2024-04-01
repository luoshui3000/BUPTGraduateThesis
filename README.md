Update
==================
根据[北京邮电大学研究生学位论文写作与制作规范-20240102版本](https://grs.bupt.edu.cn/info/1035/3071.htm)对install/buptgraduatethesis.dtx进行了如下修改

####
texlive2022 + texstudio
如果用新版texlive，由于相关package的版本问题，可能有兼容问题

#### 新增文件说明
- example 里的是根据新版要求修改install/buptgraduatethesis.dtx文件，并编译后生成的样例文件
- fonts 里的是所需的字体库

#### 页眉居中
``` latex
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
```

#### 目录中修改为攻读学位期间取得的“创新成果”目录
``` latex
%</cls>
%    \end{macrocode}
%
% 攻读学位期间取得的“创新成果”目录
%    \begin{macrocode}
%<cfg>\def\bupt@label@tableofpublications{攻读学位期间取得的“创新成果”目录}
%<*cls>
```

#### 默认采用全局参考文献
``` latex
\documentclass[%
  degree=doctor,%
  classlevel=open,%
  mathfont=mathptmx,%
  dedication=false,%
  committee=true,%
  chapbib=false,%
  finish=print,%
  driver=xetex]{buptgraduatethesis}
```

#### 添加答辩小组名单页
参照如下修改install/buptgraduatethesis.dtx即可
[添加答辩小组名单页](https://github.com/Jimmy-L4/BUPTGraduateThesis)

#### Mathcal fonts in Times New Roman environment
[新罗马字体使用\mathcal](https://tex.stackexchange.com/questions/473039/mathcal-fonts-in-times-new-roman-environment)


#### "符号对照表"改为"符号说明"
``` latex
%<cfg>\def\bupt@label@listofnotations{符号说明}
```

#### 目录显示摘要，关键词缩进2字符，不显示摘要题目
``` latex
%% 生成中英文摘要页
\newcommand{\bupt@makeabstract}{%
  \pagestyle{bupt@headings}   %摘要的偶数页显示页眉
  \pagenumbering{Roman}
  \bupt@chapter*[\bupt@label@cabstract]%
  {\bupt@label@cabstract}%
  [\xiaosan\hei]%
  %[\centering\sanhao\bupt@meta@ctitle] % 此处控制中文摘要标题
  {
    \sihao[1.6]
    \par{
      \CJKindent
      \song\bupt@meta@cabstract
    }\par
    \vspace{12bp}
    \setbox0=\hbox{{\hei \hsapce{2em} \bupt@label@ckeywords}}  %缩进2em
    \noindent\hangindent\wd0\hangafter1\box0\bupt@meta@ckeywords
  }
  \bupt@chapter*[\bupt@label@eabstract]%
  {\bupt@label@eabstract} % no tocline
  [\xiaosan]
  %[\centering\sanhao\textbf{\MakeUppercase\bupt@meta@etitle}] % 此处控制英文摘要标题
  {    
    \sihao[1.5]
    \par{%
      \CJKindent
      \bupt@meta@eabstract
    }\par
    \vspace{24bp}
    \setbox0=\hbox{\hsapce{2em} \textbf{KEY WORDS:\enskip}}  %缩进2em
    \noindent\hangindent\wd0\hangafter1\box0\bupt@meta@ekeywords
  }
}
```

#### <摘要><abstract><目录><符号对照表><致谢><发表文章> 增加页眉标题
``` latex
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
```

#### 独创性声明与授权说明的标题字体大小改为三号
``` latex
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
```

#### 电子文献格式修改
``` latex
% 电子文献
% [序号] 作者. 文献题目[电子文献类型标识/载体类型标识]. 发表或更新日期. 来源或URL.
% 电子文献类型：数据库DB，计算机程序CP，电子公告EB
% 载体类型：磁带MT，磁盘DK，光盘CD，网络OL
% [] author. title[etype/ehowpublished]. date. source.
FUNCTION {electronic} {
  generate.bibitem.begin

  format.authors "author" output.w.warning
  format.title electronic.desinator "title" output.w.appendix.w.warning
  format.date
  format.source.date output.wo.warning
  format.note output.wo.warning

  generate.bibitem.end
  
}

% 排版 source, date 域
% output：栈顶1元素
FUNCTION {format.source.date} {
  ""
  source empty$
  { "source is empty in " cite$ *
    warning$
    date empty$
    { "date is empty in " cite$ *
      warning$
    }
    { date dashify * }
    if$
  }
  { date empty$
    { "date is empty in " cite$ *
      warning$
      "\url{" * source * "}" *
    }
    {
      "\url{" * source * "}" *
    }
    %{ "\url{" * source * "}" * punc.comma * date dashify * }
    if$
  }
  if$
}

FUNCTION {format.date} {
  ""
  date empty$
  { "" }
  { date dashify * }  
  if$
}
```

#### 会议论文格式修改
``` latex
FUNCTION {inproceedings} {
  generate.bibitem.begin

  format.authors "author" output.w.warning
  format.title "[C]" "title" output.w.appendix.w.warning
  booktitle empty$
  { "booktitle is empty in " cite$ *
    warning$
  }
  { "In " format.booktitle * output.wo.warning }
  if$

  format.address.publisher.year.pages output.wo.warning
  format.note output.wo.warning

  generate.bibitem.end
}
```

#### 修改图片标题的上方间距
``` latex
\captionsetup[figure]{%
  position=bottom,%
  belowskip={12bp-\intextsep},%
  %aboveskip=-2bp%   原先的设置
  aboveskip=2bp%     修改后的设置
}
```

#### 修改子图标题上下方间距
``` latex
\captionsetup[subfloat]{%
  font=bupt,%
  %captionskip=6bp,%原先的设置
  captionskip=2bp,%修改后的设置
  %nearskip=6bp,%原先的设置
  nearskip=2bp,%修改后的设置
  farskip=0bp,%
  topadjust=0bp%
}
```

#### 修改图片编号和标题的间隔
``` latex
%\DeclareCaptionLabelSeparator{bupt}{\hspace{1em}}  %原先的设置
\DeclareCaptionLabelSeparator{bupt}{\hspace{0.5em}} %修改后的设置
```



Version
==================
当前版本v7.2，托管于GitHub，支持Windows、Linux和OSX平台。该版本可以在项目主页直接下载ZIP压缩包获得，也可以通过如下git命令获得：

    git clone https://github.com/rioxwang/BUPTGraduateThesis.git


About
==================
BUPTGraduateThesis提供北京邮电大学研究生学位论文LaTeX文档类，其符合北邮研究生院2014年11月发布的《关于研究生学位论文格式的统一要求》，目前已根据2017年标准修正格式、添加英文扉页。目前已经可以生成除了封面之外的所有论文内容，封面由于书脊的存在，需要进一步细调。我们建议利用BUPTGraduateThesis生成除了封面之外的所有PDF内容，再使用WORD生成封面。（注：扉页可以正常输出，而封面是打印时需要打印在指定彩纸上的内容，与扉页相比多了书脊这部分内容，需要根据论文薄厚做细调。校内的打印店均可以帮忙依据PDF的扉页生成封面。）

该项目源于张煜博士（Dazzle Zhang）发起并维护的BUPTThesis项目，并由王贤凌博士（rioxwang）在其基础上增添了更加稳健的中文处理方案，于2013年7月5日发布。该项目借助XeTeX引擎，利用xeCJK宏包取代BUPTThesis中的CJK宏包作为中文解决方案。同时，BUPTGraduateThesis根据研究生院发布的最新要求，对学位论文格式进行微调，并且提供更为详细的用户帮助文档buptgraduatethesis.pdf。


Quick Help
==================
快速安装说明

更具体的安装说明与帮助文档请参见buptgraduatethesis.pdf。

为了方便新手入门，BUPTGraduateThesis提供了基于Docstrip的安装方式和免安装压缩包release_7.2.zip，用户可以依照自己的习惯选择，免安装方式支持v7.2版。
使用免安装压缩包的用户，只需要将release_7.2.zip解压，并将所有文件拷贝到主目录下即可正常使用（注意备份已有工作！）。

为了生成用户帮助文档buptgraduatethesis.pdf，安装前请保证Adobe系列中文字体已经安装。

Adobe系列字体用于提供免费的常用中文字体：

*  AdobeFangsongStd-Regular.otf
*  AdobeHeitiStd-Regular.otf
*  AdobeKaitiStd-Regular.otf
*  AdobeSongStd-Light.otf

注意：win10系统，需要在下载字体上右击选择为所有用户安装

Windows用户请打开CMD，输入如下命令进行安装：

    makethesis.bat install

Linux/OSX用户请打开SHELL输入如下命令进行安装：

    chmod a+x makethesis
    ./makethesis install


Read Me（使用前必读）
==================
由于BUPTGraduateThesis的编译过程较为复杂，Windows用户直接使用WinEdt的按钮执行编译会出现参考文献、已发表学术论文目录等不能正确编译，因此建议Windows用户在CMD下使用预先编写好的批处理文件`makethesis.bat`编译，Linux/OSX用户在SHELL下使用文件`makethesis`。高阶用户可以阅读批处理文件，深入了解BUPTGraduateThesis编译的过程。

此外，用户在编译前需要对`makethesis.bat`（`makethesis`）进行简单的配置，详细内容请查阅用户帮助文档`buptgraduatethesis.pdf`。配置的方法为：用编辑器打开批处理文件`makethesis.bat`，定位到`User Configuration`模块，修改
* `TARGET` 目标文件，生成论文的文件名，同时也是最外层TEX文件的文件名
* `MAINMATTER` 各章节TEX文件的文件名，以空格分开，不包括附录。示例：`MAINMATTERS=(ch_intro ch_chapter2 ch_chapter3 ch_chapter4 ch_chapter5 ch_concln)`
* `BIBTYPE` 参考文献方式，`chapbib` 为分章参考文献，`allbib` 为全文参考文献


Change Logs
==================
*  v7.2：2020/01/03，更新 `subfigure` 宏包为较新的 `subfig` 宏包，配合`\subfloat{}`实现更方便的子图功能，在`\subfloat{}`与另一个`\subfloat{}`之间用`\\`隔开，可以实现子图的上下垂直排列。
*  v7.1：2018/03/16，添加英文扉页、根据2017年标准修正格式
*  v7.0：2016/11/23，修正涉密论文中的BUG；修正参考文献格式控制的BUG；增加博士后研究报告类型；根据新版xeCJK宏包更新命令；更新声明内容；根据新版glossaries宏包更新命令
*  v6.2：2015/04/23，修正参考文献列表序号不对齐的BUG（v6.1用户升级请在cls文件中搜索multibib宏包，删除其resetlabels选项的调用，在各个ch_xxx.tex和pubs.tex调用参考文献数据库之前使用\setcounter{NAT@ctr}{0}
重置参考文献计数器）
*  v6.1：2015/01/16，修正发表论文列表中序号不对齐的BUG
*  v6.0：2014/01/02，重新整理buptgraduatethesis.bst；在bare_thesis.bib中给出各类参考文献模板；更新帮助文档；迁移到GitCafe
*  v5.4：2014/11/29，根据新版论文格式要求修正学位论文类参考文献的格式
*  v5.3：2014/11/22，修正buptgraduatethesis.bst中学位论文类参考文献格式的BUG
*  v5.2：2014/07/17，根据新版论文格式对文档类进行精简；修正封面的BUG；修正最新版xeCJK带来的问题；更新帮助文档
*  v5.1：2014/05/31，修正makethesis中分章参考文献编译的BUG，此BUG会影响Linux和Unix用户的分章参考文献输出
*  v5.0：2014/04/14，增添数学字体选项，可以使用Computer Modern字体；盲审版本将隐去致谢和独创性等声明页；根据新版硕、博士论文格式要求更新模板和封面；修改参考文献中英文姓名出现Jr时的排版，并添加说明；修改帮助文档的字体，不用再依赖TeX Gyre Pagella字体；修正图名和表名的字体；改进一系列参考文献排版规则；增加免安装版，解压即可用；去除makethesis中安装时的输出重定向，方便排错
*  v4.0：2013/12/26，根据xeCJK宏包的更新修改宏包加载项；修复由于伪粗体带来的复制粘贴的BUG
*  v3.0：2013/12/23，根据新版论文格式要求更新模板
*  v2.3：2013/11/29，修改bibtex生成的参考文献中URL的字体
*  v2.2：2013/11/29，修正缩略语在第一次引用时无法出现中文释义的 BUG
*  v2.1：2013/11/21，修改article类型参考文献显示样式
*  v2.0：2013/11/20，增加部分参考文献自定义配置的功能；更新帮助文档
*  v1.3：2013/11/15，修正makethesis.bat的BUG；将Unicode指令替换为char指令用于引入Unicode字符；使用xeCJKsetcharclass命令修正xetex引擎下的带圈数字脚注
*  v1.2：2013/11/14，修正makethesis.bat的BUG
*  v1.1：2013/07/30，更新makethesis的换行模式
*  v1.0：2013/07/08，初始版本

To Do List
==================

*  整理文档类的代码，增添注释，便于更多人一起学习LaTeX
*  在书签中输出章节编号
*  改进文档参考文献输入规范与IEEE参考文献输入规范的兼容性
