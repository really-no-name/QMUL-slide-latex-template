\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{custombeamer}[2024/04/07 Custom Beamer Class]
\LoadClass[aspectratio=169]{beamer}
\RequirePackage{xcolor} % 确保xcolor包被加载
\RequirePackage[scaled=0.92]{helvet} % 使用helvet包，Helvetica字体作为Arial的替代
\renewcommand{\familydefault}{\sfdefault} % 设置默认字体族为无衬线，这将默认选择Helvetica

% 定义颜色
% \definecolor{customblue}{rgb}{0.16, 0.21, 0.45} % 将RGB值转换为0-1范围
\definecolor{customblue}{rgb}{0.13, 0.22, 0.42}

% 设置没有页码的脚注模板
\setbeamertemplate{navigation symbols}{} % 去除导航符号
\setbeamertemplate{footline}{} % 去除页码

% 设置frametitle的颜色
\setbeamercolor{frametitle}{fg=customblue}

% 设置目录的颜色
\setbeamercolor{section in toc}{fg=customblue} % 目录中的章节标题
\setbeamercolor{subsection in toc}{fg=customblue} % 目录中的小节标题


% 定义背景图像命令
\newcommand{\backone}{\includegraphics[width=\paperwidth]{background/back1.pdf}}
\newcommand{\backzheng}{\includegraphics[width=\paperwidth]{background/backzheng.pdf}}
\newcommand{\backendone}{\includegraphics[width=\paperwidth]{background/end1.pdf}}
\newcommand{\backendtwo}{\includegraphics[width=\paperwidth]{background/end2.pdf}}

% 设置不同部分的文字格式
\setbeamerfont{title}{series=\bfseries, size=\fontsize{40}{48}} % series=\bfseries加粗
\setbeamerfont{subtitle}{series=\mdseries, size=\fontsize{20}{24}}
\setbeamerfont{author}{series=\mdseries, size=\fontsize{20}{24}}
\setbeamerfont{institute}{series=\bfseries, size=\fontsize{12}{14}}
\setbeamerfont{date}{size=\fontsize{12}{14}}
\setbeamerfont{frametitle}{series=\bfseries, size=\fontsize{25}{30}}
\setbeamerfont{normal text}{series=\mdseries, size=\fontsize{14}{18}}


% 封面页样式
\defbeamertemplate*{title page}{custom}[1][]
{
  \begingroup
    \setbeamertemplate{footline}{} % 确保封面页没有页码
    \usebackgroundtemplate{\backone}
    \begin{frame}[plain]
      \begin{textblock*}{10cm}(1cm,0cm)
        \color{white} % 设置文本颜色为白色
        \usebeamerfont{title}\inserttitle\par
        \usebeamerfont{subtitle}\insertsubtitle\par
        \smallskip
        \usebeamerfont{author}\insertauthor
      \end{textblock*}
    \end{frame}
  \endgroup
}

% 正文页样式，在此处我们不需要设置 footline，因为它已经在全局被去除
\newcommand{\setregularbackground}{
  \usebackgroundtemplate{\backzheng}
}

% 目录页样式
\AtBeginSection[]{
  \begingroup
    \setregularbackground
    \begin{frame}
      \frametitle{mulu}
      \tableofcontents[currentsection]
    \end{frame}
  \endgroup
}

% 结束页1
\newenvironment{finalframeone}{
  \begingroup
    \usebackgroundtemplate{\backendone}
    \begin{frame}[plain]
}{
    \end{frame}
  \endgroup
}

% 结束页2
\newenvironment{finalframetwo}{
  \begingroup
    \usebackgroundtemplate{\backendtwo}
    \begin{frame}[plain]
}{
    \end{frame}
  \endgroup
}

\endinput
