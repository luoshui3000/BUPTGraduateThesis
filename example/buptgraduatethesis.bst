%%
%% This is file `buptgraduatethesis.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% install/buptgraduatethesis.dtx  (with options: `bst')
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
%% This is the configuration file of the BUPTGraduateThesis package
%% with LaTeX2e.
%% 

%%%%%%%%%%%%%%%%
% 默认值设置
%%%%%%%%%%%%%%%%
% 英文姓名排版格式字符串，按<von><lastname全称><firstname首字母><Jr>格式
% 默认："von"全小写；"lastname"首字母大写；"firstname"大写；"Jr"首字母大写；
FUNCTION {default.formation.name} { "{vv~}{ll~}{f{~}}{~jj}" }
% 列出的最多作者数目
% 默认：3；
FUNCTION {default.maxnum.authors} { #3 }
% 中文标点开关
% 默认：0；
FUNCTION {default.switch.chs.punc} { #0 }
% 盲审版本开关
% 默认：0；
FUNCTION {default.switch.peerreview} { #0 }

%%%%%%%%%%%%%%%%
% 辅助函数
%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%
% 版本与提示信息
%%%%%%%%%%%%%%%%
FUNCTION {bstfile.version} { "4.0" }
FUNCTION {bstfile.date} { "2015/01/02" }
FUNCTION {bstfile.website} { "https://gitcafe.com/rioxwang/BUPTGraduateThesis" }

%%%%%%%%%%%%%%%%
% 预定义的字符串宏
%%%%%%%%%%%%%%%%
% 英文月份
MACRO {jan} { "January" }
MACRO {feb} { "February" }
MACRO {mar} { "March" }
MACRO {apr} { "April" }
MACRO {may} { "May" }
MACRO {jun} { "June" }
MACRO {jul} { "July" }
MACRO {aug} { "August" }
MACRO {sep} { "September" }
MACRO {oct} { "October" }
MACRO {nov} { "November" }
MACRO {dec} { "December" }

%%%%%%%%%%%%%%%%
% 域定义
%%%%%%%%%%%%%%%%
ENTRY {
  address         % 出版地/专利国别
  author          % 作者/申请者/责任者
  booktitle       % 专著名/论文集名/报纸名
  date            % 日期
  edition         % 版本
  editor          % 编者
  ehowpublished   % 载体类型标识
  etype           % 电子文献类型标识
  language        % 语言
  multiseriesmsg  % 非连续页或分期期刊的分期信息
  note            % 附加说明
  number          % 期号
  pages           % 参考页码/页码范围
  publisher       % 出版者
  series          % 专利号/标准号
  title           % 论文题目/报告题目/专利题目/标准题目/文章题目/文献题目
  translator      % 译者
  volume          % 卷号
  year            % 年
  source          % 来源或URL
  CTLformation_name       % 用户控制接口：控制姓名的格式
  CTLmaxnum_authors       % 用户控制接口：控制最多显示作者数
  CTLname_author_eng      % 用户控制接口：控制学位论文作者的英文姓名
  CTLname_author_chs      % 用户控制接口：控制学位论文作者的中文姓名
  CTLswitch_peerreview    % 用户控制接口：控制是否盲审格式
  CTLswitch_chs_punc      % 用户控制接口：控制是否使用中文句点
}
{}
{ label }

%%%%%%%%%%%%%%%%
% 整型变量
%%%%%%%%%%%%%%%%
INTEGERS {
  maxnum.authors
  switch.chs.punc
  switch.peerreview

  output.state
  state.before.bibitem
  state.mid.bibitem

  num.label
  maxwidth.label
  num.names
  idx.names
  idx.string

  var.result
  var.num
  var.length
}

%%%%%%%%%%%%%%%%
% 字符串变量
%%%%%%%%%%%%%%%%
STRINGS {
  formation.name      % 姓名的格式字符串
  name.author.eng     % 学位论文作者的英文姓名
  name.author.chs     % 学位论文作者的中文姓名

  var.name
  var.namelist
  var.message
  var.desinator
  var.string
  var.string2
  var.order

  label.widest        % 字符串宽度最大的条目序号
}

%%%%%%%%%%%%%%%%
% 底层函数
%%%%%%%%%%%%%%%%
% 逻辑非
% input：栈顶1元素
% output：栈顶1元素
FUNCTION {not} {
  { #0 }
  { #1 }
  if$
}

% 逻辑与
% input：栈顶2元素
% output：栈顶1元素
FUNCTION {and} {
  { skip$ }
  { pop$ #0 }
  if$
}

% 逻辑或
% input：栈顶2元素
% output：栈顶1元素
FUNCTION {or} {
  { pop$ #1 }
  { skip$ }
  if$
}

% 判断栈顶字符是否为数字"0"~"9"中的一个
FUNCTION {is.num} {
  chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not
  and
}

% 栈顶整数乘以10
FUNCTION {times.10} {
  #0 'var.result :=

  { duplicate$ #0 > }
  { #1 -
    var.result #10 + 'var.result :=
  }
  while$

  pop$
  var.result
}

% 将栈顶字符("0"~"9")转换为整数(0~9)
FUNCTION {char.to.int} {
  duplicate$ is.num
  { chr.to.int$ "0" chr.to.int$ - }
  { "Noninteger character " quote$ * swap$ * quote$ *
    " in integer field of " * cite$ * warning$
    #0
  }
  if$
}

% 将栈顶字符串转换为整数
FUNCTION {string.to.int} {
  duplicate$ text.length$ 'var.length :=
  #1 'idx.string :=
  #0 'var.num :=

  { idx.string var.length > not }
  { duplicate$ idx.string #1 substring$ char.to.int
    var.num times.10 +
    'var.num :=
    idx.string #1 + 'idx.string :=
  }
  while$

  pop$
  var.num
}

% 将栈顶的 "yes" 和 "no" 字符串对应的转变为整形的 #1 和 #0
FUNCTION {yes.no.to.int} {
  "l" change.case$ duplicate$ "yes" =
  { pop$ #1 }
  { duplicate$ "no" =
    { pop$ #0 }
    { "Unknown boolean " quote$ * swap$ * quote$ *
      " in " * cite$ * warning$
      #0
    }
    if$
  }
  if$
}

%%%%%%%%%%%%%%%%
% 字符串常量
%%%%%%%%%%%%%%%%
FUNCTION {bbl.anonymous} { "" }
FUNCTION {bbl.etal} { language empty$ { "et~al" } { "等" } if$ }
% FUNCTION {bbl.sine.loco} { language empty$ { "S.~l." } { "出版地不详" } if$ }
% FUNCTION {bbl.sine.nomine} { language empty$ { "s.~n." } { "出版者不详" } if$ }

FUNCTION {punc.period} {
  language empty$
  switch.chs.punc #0 =
  or
  { ". " }
  { "．" }
  if$
}

FUNCTION {punc.comma} {
  language empty$
  switch.chs.punc #0 =
  or
  { ", " }
  { "，" }
  if$
}

FUNCTION {punc.colon} {
  language empty$
  switch.chs.punc #0 =
  or
  { ": " }
  { "：" }
  if$
}

FUNCTION {punc.semicolon} {
  language empty$
  switch.chs.punc #0 =
  or
  { "; " }
  { "；" }
  if$
}

FUNCTION {punc.lbracket} {
  language empty$
  switch.chs.punc #0 =
  or
  { "(" }
  { "（" }
  if$
}

FUNCTION {punc.rbracket} {
  language empty$
  switch.chs.punc #0 =
  or
  { ")" }
  { "）" }
  if$
}

FUNCTION {punc.parallel} { "~//~" }

%%%%%%%%%%%%%%%%
% 功能函数
%%%%%%%%%%%%%%%%
% 显示开始提示信息
FUNCTION {show.banner.begin} {
  "-- BUPTGraduateThesis.bst version" " " * bstfile.version *
  " (" * bstfile.date * ") " * "by Xianling Wang." *
  top$
  "-- " bstfile.website * top$
  "-- See the " quote$ * "buptgraduatethesis.pdf" * quote$ *
  " manual for usage information." * top$
}

% 显示完成提示信息
FUNCTION {show.banner.end} {
  "" top$ "Done." top$
}


% 条目宽度处理函数
% 将引用顺序存储在每个条目的 label 中；
% 更新最宽条目宽度
FUNCTION {obtain.width.label} {
  num.label int.to.str$ 'label :=
  num.label #1 + 'num.label :=
  label width$ maxwidth.label >
  { label 'label.widest :=
    label width$ 'maxwidth.label :=
  }
  { skip$ }
  if$
}

% 添加块后句点
% input：栈顶1元素
% output：栈顶1元素
% 为栈顶元素添加合适的句点
FUNCTION {append.period} {
  language empty$ switch.chs.punc #0
}

% 将页码中单独或者超过两个的"-"变为"--"
% input：栈顶1元素
% output：栈顶1元素
FUNCTION {dashify} {
  'var.string2 :=
  ""
  { var.string2 empty$ not }
  { var.string2 #1 #1 substring$ "-" =
    { "--" *
      var.string2 #1 #2 substring$ "--" = not
      { var.string2 #2 global.max$ substring$ 'var.string2 :=
      }
      {
        { var.string2 #1 #1 substring$ "-" = }
        { var.string2 #2 global.max$ substring$ 'var.string2 :=
        }
        while$
      }
      if$
    }
    { var.string2 #1 #1 substring$ *
      var.string2 #2 global.max$ substring$ 'var.string2 :=
    }
    if$
  }
  while$
}

% 输出函数
% input：栈顶2元素
% output：栈顶1元素
% 输出次栈顶元素，栈顶元素保留不变
FUNCTION {output} {
  swap$

  % 根据当前输出位置添加前置标点
  output.state state.mid.bibitem =
  { punc.period *
    write$ newline$
  }
  { output.state state.before.bibitem =
    { write$ }
    { "Undefined output.state!" top$ }
    if$
    state.mid.bibitem 'output.state :=
  }
  if$
}

% 无警告输出函数
% input：栈顶2元素
% output：栈顶1元素
% 判断栈顶元素是否为空：空则舍弃栈顶元素；非空则输出次栈顶元素；
FUNCTION {output.wo.warning} {
  duplicate$ empty$
  { pop$ }
  { output }
  if$
}

% 有警告输出函数
% input：栈顶3元素
% output：栈顶1元素
% 判断次栈顶元素是否为空：空则舍弃次栈顶元素并输出栈顶提供的警告；非空则输出次次栈顶元素；
FUNCTION {output.w.warning} {
  'var.message :=
  duplicate$ empty$
  { pop$
    var.message " is empty in " *
    cite$ *
    warning$
  }
  { output }
  if$
}

% 无警告输出附加信息函数
% input：栈顶3元素
% output：栈顶1元素
% 判断次栈顶元素是否为空：空则舍弃栈顶元素和次栈顶元素；非空则输出次次栈顶元素，并将栈顶元素附加到次栈顶元素之后；
FUNCTION {output.w.appendix.wo.warning} {
  'var.desinator :=
  duplicate$ empty$
  { pop$ }
  { var.desinator *
    output
  }
  if$
}

% 有警告输出附加信息函数
% input：栈顶4元素
% output：栈顶1元素
% 判断次次栈顶元素是否为空：空则舍弃次次栈顶元素和次栈顶元素并输出栈顶提供的警告；非空则输出次次次栈顶元素，并将次栈顶元素附加到次次栈顶元素之后；
FUNCTION {output.w.appendix.w.warning} {
  'var.message :=
  'var.desinator :=
  duplicate$ empty$
  { pop$
    var.message " is empty in " *
    cite$ *
    warning$
  }
  { var.desinator *
    output
  }
  if$
}

% 输出 item 开始
% output：栈顶1元素
FUNCTION {generate.bibitem.begin} {
  newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$ newline$

  % 在栈顶压入""，作为 output.state 为 state.before.bibitem 时的输出
  ""
  state.before.bibitem 'output.state :=
}

% 输出 item 结束
% input：栈顶1元素
FUNCTION {generate.bibitem.end} {
  % 不借助 output 而直接输出栈顶元素
  punc.period *
  write$ newline$
}

% 删除用户添加的缩写符号"."
% input：栈顶1元素
% output：栈顶1元素
% 将栈顶元素的字符逐一和"."比较，如果相等则舍弃
FUNCTION {remove.period}
{ 'var.string :=
  % 先用""占据栈顶，防止出现所有字符都是"."的情况导致栈顶无元素
  ""
  { var.string empty$ not }
  { var.string #1 #1 substring$
    var.string #2 global.max$ substring$ 'var.string :=
    duplicate$ "." =
    { pop$ }
    { * }
    if$
  }
  while$
}

% 排版姓名
% input：栈顶1元素
% output：栈顶1元素
% 根据 formation.name 排版姓名
FUNCTION {format.names} {
  % 获得所有姓名
  'var.namelist :=
  % 初始化正在处理的姓名序号
  #1 'idx.names :=
  % 获得姓名的数量并置于 num.names 中
  var.namelist num.names$ 'num.names :=

  { idx.names num.names > not }
  { var.namelist idx.names formation.name format.name$
    remove.period % 删除用户添加的缩写符号"."
    'var.name :=

    % 第一个姓名直接输出
    % 后面的姓名前置逗号并输出
    % 姓名多于特定数量就前置逗号并输出 et al
    idx.names #1 >
    { idx.names maxnum.authors >
      { punc.comma *
        bbl.etal *
        num.names 'idx.names :=
      }
      { punc.comma *
        var.name *
      }
      if$
    }
    { var.name }
    if$
    idx.names #1 + 'idx.names :=
  }
  while$
}

% 排版盲审姓名
% input：栈顶1元素
% output：栈顶1元素
% 排版盲审姓名
FUNCTION {format.names.peerreview} {
  % 获得所有姓名
  'var.namelist :=
  % 防止用户输入错误导致输出空栈，需要先在栈中压入空字符串
  ""
  % 初始化正在处理的姓名序号
  #1 'idx.names :=
  % 获得姓名的数量并置于 num.names 中
  var.namelist num.names$ 'num.names :=

  { idx.names num.names > not }
  { var.namelist idx.names "{vv{}}{ll{}}{ff{}}{jj{}}" format.name$
    remove.period % 删除用户添加的缩写符号"."
    'var.name :=

    language empty$
    { name.author.eng }
    { name.author.chs }
    if$

    var.name =
    { idx.names int.to.str$
      "\CJKnumber{" swap$ * "}" *
      "第" swap$ * "作者" * *
    }
    { "" * }
    if$

    idx.names #1 + 'idx.names :=
  }
  while$
}

% 排版 author 域
% output：栈顶1元素
% 判断 author 域是否为空：空则将""压栈；非空则将 author 排版后压栈；
FUNCTION {format.authors} {
  author empty$
  { "" }
  { switch.peerreview #1 =
    { author format.names.peerreview }
    { author format.names }
    if$
  }
  if$
}

% 排版 editor 域
% output：栈顶1元素
% 判断 editor 域是否为空：空则将""压栈；非空则将 editor 排版后压栈；
FUNCTION {format.editors} {
  author empty$
  { "" }
  { editor format.names }
  if$
}

% 排版 title 域
% output：栈顶1元素
% 判断 title 域是否为空：空则将""压栈；非空则将 title 排版后压栈；
FUNCTION {format.title} {
  title empty$
  { "" }
  { title }
  if$
}

% 排版 booktitle 域
% output：栈顶1元素
% 判断 booktitle 域是否为空：空则将""压栈；非空则将 booktitle 排版后压栈；
FUNCTION {format.booktitle} {
  booktitle empty$
  { "" }
  { booktitle }
  if$
}

% 排版 translator 域
% output：栈顶1元素
% 判断 translator 域是否为空：空则将""压栈；非空则将 translator 排版后压栈；
FUNCTION {format.translator} {
  translator empty$
  { "" }
  { translator format.names }
  if$
}

% 从字符串中逐位提取前导数字字符串
% 例："2nd"->"2"，"11"->"11"
% input：栈顶1元素
% output：栈顶1元素
FUNCTION {extract.num.str} {
  'var.string :=
  "" 'var.string2 :=
  { var.string empty$ not }
  { var.string #1 #1 substring$
    var.string #2 global.max$ substring$ 'var.string :=
    duplicate$ is.num
    { var.string2 swap$ *
      'var.string2 :=
    }
    { pop$
      "" 'var.string :=
    }
    if$
  }
  while$
  var.string2
}

% 为数字字符串添加序数后缀
% 例："2"->"2nd"，"11"->"11th"
FUNCTION {num.str.to.order} {
  'var.string :=
  var.string text.length$ 'var.length :=

  % 区分数字字符串长度是否为1
  var.length #1 =
  { var.string "1" =
    { var.string "st" * }
    { var.string "2" =
      { var.string "nd" * }
      { var.string "3" =
        { var.string "rd" * }
        { var.string "th" * }
        if$
      }
      if$
    }
    if$
  }
  { var.string var.length #1 - #1 substring$ "1" =
    { var.string "th" * }
    { var.string var.length #1 substring$ "1" =
      { var.string "st" * }
      { var.string var.length #1 substring$ "2" =
        { var.string "nd" * }
        { var.string var.length #1 substring$ "3" =
          { var.string "rd" * }
          { var.string "th" * }
          if$
        }
        if$
      }
      if$
    }
    if$
  }
  if$
}

% 排版 edition 域
% output：栈顶1元素
% 判断 edition 域是否为空：空则将""压栈；非空则将 edition 排版后压栈；
FUNCTION {format.edition} {
  edition empty$
  { "" }
  { edition extract.num.str
    duplicate$ "1" = not
    { language empty$
      { num.str.to.order  " ed" *
      }
      { 'var.order :=
        "第~" var.order *
        "~版" *
      }
      if$
    }
    { pop$
      ""
    }
    if$
  }
  if$
}

% 排版 booktitle, year, volume(number): pages 域
% output：栈顶1元素
% 将 booktitle、year、volume、number 和 pages 域整理后压栈，遇到空缺就输出相关区域空白的信息
% 同时判断是否为分期或非连续页期刊文章并进行相应处理
FUNCTION {format.booktitle.year.volume.number.pages} {
  ""
  booktitle empty$
  { "booktitle is empty in " cite$ *
    warning$
    year empty$
    { "year is empty in " cite$ *
      warning$
    }
    { year * }
    if$
  }
  { year empty$
    { "year is empty in " cite$ *
      warning$
      booktitle *
    }
    { booktitle * punc.comma * year * }
    if$
  }
  if$

  'var.string :=
  ""
  var.string "" =
  { volume empty$
    { "volume is empty in " cite$ *
      warning$
    }
    { volume * }
    if$
  }
  { volume empty$
    { "volume is empty in " cite$ *
      warning$
      var.string *
    }
    { var.string * punc.comma * volume * }
    if$
  }
  if$

  'var.string :=
  ""
  var.string "" =
  { number empty$
    { "number is empty in " cite$ *
      warning$
    }
    { number * }
    if$
  }
  { number empty$
    { "number is empty in " cite$ *
      warning$
      var.string *
    }
    { var.string * punc.lbracket * number * punc.rbracket * }
    if$
  }
  if$

  'var.string :=
  ""
  var.string "" =
  { pages empty$
    { "pages is empty in " cite$ *
      warning$
    }
    { pages dashify * }
    if$
  }
  { pages empty$
    { "pages is empty in " cite$ *
      warning$
      var.string *
    }
    { var.string * punc.colon * pages dashify * }
    if$
  }
  if$

  multiseriesmsg empty$
  { skip$ }
  { punc.semicolon * multiseriesmsg dashify * }
  if$
}

% 排版 address: publisher, year{: pages} 域
% output：栈顶1元素
% 将 address、publisher、year 和 pages 域整理后压栈，遇到空缺就输出相关区域空白的信息
FUNCTION {format.address.publisher.year.pages} {
  ""
  address empty$
  { "address is empty in " cite$ *
    warning$
  }
  { address *
  }
  if$

  ""
  publisher empty$
  { "publisher is empty in " cite$ *
    warning$
    year empty$
    { "year is empty in " cite$ *
      warning$
    }
    { year * }
    if$
  }
  { year empty$
    { "year is empty in " cite$ *
      warning$
      publisher *
    }
    { publisher * punc.comma * year * }
    if$
  }
  if$

  duplicate$ "" =
  { pop$ }
  { 'var.string :=
    address empty$
    { var.string * }
    { punc.colon * var.string *
    }
    if$
  }
  if$

  'var.string :=
  pages empty$
  { var.string }
  { var.string "" =
    { pages dashify }
    { var.string punc.colon * pages dashify * }
    if$
  }
  if$
}

% 排版 address: series, date 域
% output：栈顶1元素
% 将 address、series 和 date 域整理后压栈，遇到空缺就输出相关区域空白的信息
FUNCTION {format.address.series.date} {
  ""
  address empty$
  { "address is empty in " cite$ *
    warning$
  }
  { address *
  }
  if$

  ""
  series empty$
  { "series is empty in " cite$ *
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
      series *
    }
    { series * punc.comma * date dashify * }
    if$
  }
  if$

  duplicate$ "" =
  { pop$ }
  { 'var.string :=
    address empty$
    { var.string * }
    { punc.colon * var.string *
    }
    if$
  }
  if$
}

% 排版 series 和 title 域
% output：栈顶1元素
FUNCTION {format.series.title} {
  ""
  series empty$
  { "series is empty in " cite$ *
    warning$
    title empty$
    { "title is empty in " cite$ *
      warning$
    }
    { title * }
    if$
  }
  { title empty$
    { "title is empty in " cite$ *
      warning$
      series *
    }
    { series * punc.comma * title * }
    if$
  }
  if$
}

% 排版 booktitle、date 和 pages 域
% output：栈顶1元素
% 将 address、publisher、year 和 pages 域整理后压栈，遇到空缺就输出相关区域空白的信息
FUNCTION {format.booktitle.date.pages} {
  ""
  booktitle empty$
  { "booktitle is empty in " cite$ *
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
      booktitle *
    }
    { booktitle * punc.comma * date dashify * }
    if$
  }
  if$

  'var.string :=
  pages empty$
  { var.string }
  { var.string "" =
    { pages dashify }
    { var.string punc.lbracket * pages dashify * punc.rbracket * }
    if$
  }
  if$
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

% 为 electronic 分配类型和载体
% output：栈顶1元素
% 若未指定，则默认 etype 为 EB，默认 ehowpublished 为 OL
FUNCTION {electronic.desinator} {
  "["
  etype empty$
  { "EB" * }
  { etype * }
  if$
  "/" *
  ehowpublished empty$
  { "OL" * }
  { ehowpublished * }
  if$
  "]" *
}

% 排版 note 域
% output：栈顶1元素
% 判断 note 域是否为空：空则将""压栈；非空则将 note 压栈；
FUNCTION {format.note} {
  note empty$
  { "" }
  { note }
  if$
}

%%%%%%%%%%%%%%%%
% 模块函数
%%%%%%%%%%%%%%%%
% 输出 .bbl 文件头
FUNCTION {generate.bibfile.begin} {
  % 输出版本与提示信息
  "% Generated by BUPTGraduateThesis.bst, version: " bstfile.version *
  " (" * bstfile.date * ")" *
  write$ newline$

  % 输出前导信息
  preamble$ empty$
  { skip$ }
  { preamble$ write$ newline$ }
  if$

  % 输出 thebibliography 环境的开始
  "\begin{thebibliography}{" label.widest *
  "}" *
  write$ newline$
}

% 输出 .bbl 文件尾
FUNCTION {generate.bibfile.end} {
  newline$

  % 输出 thebibliography 环境的结束
  "\end{thebibliography}"
  write$ newline$
}

% 初始化控制变量
FUNCTION {initialize.controls} {
  default.formation.name 'formation.name :=
  default.maxnum.authors 'maxnum.authors :=
  default.switch.chs.punc 'switch.chs.punc :=
  default.switch.peerreview 'switch.peerreview :=
}

% 初始化位置常量
FUNCTION {initialize.const.state} {
  #0 'state.before.bibitem :=     % 条目起始，输出次栈顶元素
  #1 'state.mid.bibitem :=        % 条目中间，输出次栈顶元素并附加句点
}

% 获取最宽条目标号
FUNCTION {initialize.widest.label} {
  #1 'num.label :=
  #0 'maxwidth.label :=
  "" 'label.widest :=
}

%%%%%%%%%%%%%%%%
% 参考文献分类处理
%%%%%%%%%%%%%%%%

% 普通图书
% [序号] 作者. 专著名[M].{ 译者, 译.}{ 版本（第一版不加标注）.} 出版地: 出版者, 年{: 参考页码}.{ note.}
% [] author. booktitle[M].{ translator, 译}{ edition.} address: publisher, year{: pages}.{ note.}
FUNCTION {book} {
  generate.bibitem.begin

  format.authors "author" output.w.warning
  format.booktitle "[M]" "booktitle" output.w.appendix.w.warning
  format.translator punc.comma "译" * output.w.appendix.wo.warning
  format.edition output.wo.warning
  format.address.publisher.year.pages output.wo.warning
  format.note output.wo.warning

  generate.bibitem.end
}

% 期刊
% [序号] 作者. 论文题目[J]. 刊名, 年, 卷号(期号): 页码范围{, 非连续页或分期期刊的分期信息}.{ note.}
% [] author. title[J]. booktitle, year, volume(number): pages{, multiseriesmsg}.{ note.}
FUNCTION {article} {
  generate.bibitem.begin

  format.authors "author" output.w.warning
  format.title "[J]" "title" output.w.appendix.w.warning
  format.booktitle.year.volume.number.pages output.wo.warning
  format.note output.wo.warning

  generate.bibitem.end
}

% 会议录
% [序号] 编者. 论文集名[C]. 出版地: 出版者, 年{: 页码范围}.{ note.}
% [] editor. booktitle[C]. address: publisher, year{: pages}.{ note.}
FUNCTION {proceedings} {
  generate.bibitem.begin

  format.editors "editor" output.w.warning
  format.booktitle "[C]" "booktitle" output.w.appendix.w.warning
  format.address.publisher.year.pages output.wo.warning
  format.note output.wo.warning

  generate.bibitem.end
}

% 会议论文
% [序号] 作者. 论文题目[A]. // 论文集名[C]. 出版地: 出版者, 年: 页码范围.{ note.}
% [] author. title[A]. // booktitle[C]. address: publisher, year: pages.{ note.}
%FUNCTION {inproceedings} {
%  generate.bibitem.begin
%
%  format.authors "author" output.w.warning
%  format.title "[A]" "title" output.w.appendix.w.warning
%  booktitle empty$
%  { "booktitle is empty in " cite$ *
%    warning$
%  }
%  { punc.parallel format.booktitle * "[C]" * output.wo.warning }
%  if$
%
%  format.address.publisher.year.pages output.wo.warning
%  format.note output.wo.warning
%
%  generate.bibitem.end
%}

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

% 学位论文
% [序号] 作者. 论文题目[D]. 出版地: 出版者, 年{: 页码范围}.{ note.}
% [] author. title[D]. address: publisher, year{: pages}.{ note.}
FUNCTION {dissertation} {
  generate.bibitem.begin

  format.authors "author" output.w.warning
  format.title "[D]" "title" output.w.appendix.w.warning
  format.address.publisher.year.pages output.wo.warning
  format.note output.wo.warning

  generate.bibitem.end
}

% 科技报告
% [序号] 作者. 报告题名[R]. 出版地: 出版者, 年{: 页码范围}.{ note.}
% [] author. title[R]. address: publisher, year{: pages}.{ note.}
FUNCTION {techreport} {
  generate.bibitem.begin

  format.authors "author" output.w.warning
  format.title "[R]" "title" output.w.appendix.w.warning
  format.address.publisher.year.pages output.wo.warning
  format.note output.wo.warning

  generate.bibitem.end
}

% 专利
% [序号] 申请者. 专利题目[P]. 专利国别: 专利号, 日期.{ note.}
% [] author. title[P]. address: series, date.{ note.}
FUNCTION {patent} {
  generate.bibitem.begin

  format.authors "author" output.w.warning
  format.title "[P]" "title" output.w.appendix.w.warning
  format.address.series.date output.wo.warning
  format.note output.wo.warning

  generate.bibitem.end
}

% 技术标准
% [序号] {责任者. }标准号, 标准题目[S].{ 出版地: 出版者, 年.}{ note.}
% [] {author. }series, title[S].{ address: publisher, year.}{ note.}
FUNCTION {standard} {
  generate.bibitem.begin

  format.authors output.wo.warning
  format.series.title "[S]" output.w.appendix.wo.warning
  format.address.publisher.year.pages output.wo.warning
  format.note output.wo.warning

  generate.bibitem.end
}

% 报纸
% [序号] 作者. 文章题目[N]. 报纸名, 日期{(版面)}.{ note.}
% [] author. title[N]. booktitle, date.{ note.}
FUNCTION {newspaper} {
  generate.bibitem.begin

  format.authors "author" output.w.warning
  format.title "[N]" "title" output.w.appendix.w.warning
  format.booktitle.date.pages output.wo.warning
  format.note output.wo.warning

  generate.bibitem.end
}

% 电子文献
% [序号] 作者. 文献题目[电子文献类型标识/载体类型标识]. 来源或URL{, 发表或更新日期}.{ note.}
% 电子文献类型：数据库DB，计算机程序CP，电子公告EB
% 载体类型：磁带MT，磁盘DK，光盘CD，网络OL
% [] author. title[etype/ehowpublished]. source{, date}.{ note.}
%FUNCTION {electronic} {
%  generate.bibitem.begin
%
%  format.authors "author" output.w.warning
%  format.title electronic.desinator "title" output.w.appendix.w.warning
%  format.source.date output.wo.warning
%  format.note output.wo.warning
%
%  generate.bibitem.end
%
%}

FUNCTION {electronic} {
  generate.bibitem.begin

  format.authors "author" output.w.warning
  format.title electronic.desinator "title" output.w.appendix.w.warning
  format.date output.wo.warning
  format.source.date output.wo.warning
  format.note output.wo.warning

  generate.bibitem.end

}

% 未分类
% [序号] note.
% 说明：对于bstcn中未涵盖的参考文献类型，可以手动在note中排版
FUNCTION {unclassified} {
  generate.bibitem.begin

  format.note output.wo.warning

  generate.bibitem.end
}

% 专用控制类型 BUPTGraduateThesisBSTCTL 用于提供方便的用户设置接口
FUNCTION {BUPTGraduateThesisBSTCTL} {
  "** BUPTGraduateThesis BST control entry" quote$ *
  cite$ * quote$ * " detected. **" * top$

  CTLformation_name empty$
  { skip$ }
  { CTLformation_name 'formation.name := }
  if$

  CTLmaxnum_authors empty$
  { skip$}
  { CTLmaxnum_authors string.to.int 'maxnum.authors := }
  if$

  CTLname_author_eng empty$
  { skip$ }
  { CTLname_author_eng 'name.author.eng := }
  if$

  CTLname_author_chs empty$
  { skip$ }
  { CTLname_author_chs 'name.author.chs := }
  if$

  CTLswitch_peerreview empty$
  { skip$ }
  { CTLswitch_peerreview yes.no.to.int 'switch.peerreview := }
  if$

  CTLswitch_chs_punc empty$
  { skip$ }
  { CTLswitch_chs_punc yes.no.to.int 'switch.chs.punc := }
  if$
}

%%%%%%%%%%%%%%%%
% 类型别名
%%%%%%%%%%%%%%%%
FUNCTION {default.type} { unclassified }

%%%%%%%%%%%%%%%%
% 主程序
%%%%%%%%%%%%%%%%

READ

EXECUTE { show.banner.begin }           % 显示初始提示信息

EXECUTE { initialize.controls }         % 初始化控制变量
EXECUTE { initialize.const.state }      % 初始化状态常量
EXECUTE { initialize.widest.label }     % 计算最宽标号
ITERATE { obtain.width.label }          % 获取最宽条目标号，置于 label.widest 中

EXECUTE { generate.bibfile.begin }      % 输出 .bbl 文件头
ITERATE { call.type$ }                  % 逐一处理引用的条目
EXECUTE { generate.bibfile.end }        % 输出 .bbl 文件尾

EXECUTE { show.banner.end }             % 显示完成提示信息
