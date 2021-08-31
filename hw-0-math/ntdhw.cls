\LoadClass[10pt,letterpaper]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ntdhw}[2017/08/20 Homework LaTeX class]
%\renewcommand\normalsize{\fontsize{10pt}{10pt}\selectfont}

\usepackage{fancyhdr}
\usepackage{lastpage}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage[margin=1in]{geometry}
\usepackage{tikz}

\pagestyle{fancyplain}

\usepackage[linkbordercolor={1 1 1},citebordercolor={1 1
  1},urlbordercolor={0.0 0.0
  0.0},urlcolor=blue,colorlinks=true,linkcolor=black,citecolor=black]{hyperref}

\newcommand{\descnl}[0]{$ $ \\ \vspace{-1.5em}}
\lhead{\hwans{\textbf{SOLUTIONS}}}
\rhead{Name:\hspace{1.5in}}
\cfoot{{\thepage} {of} {\pageref{LastPage}}}
\renewcommand{\headrulewidth}{0pt}

\usepackage{ntdmath}

\usepackage{xcolor}
\newif\ifkey
\newcommand\hwansv[2]{ %
  \ifkey
  {\color{green!50!black}{#2}} %
  \else
  \vspace{#1}
  \fi
}

\ifdefined\setkey {} \else \newcommand{\setkey}{\keyfalse} \fi

\definecolor{primarycolor}{RGB}{33,49,77}
\definecolor{accentcolor}{RGB}{146,162,189}
\definecolor{lightcolor}{RGB}{146,162,189}
\definecolor{angrycolor}{RGB}{210,73,42}
\definecolor{Accentcolor}{RGB}{210,73,42}
\definecolor{bgfillcolor}{RGB}{206,213,221}
\definecolor{metallic}{RGB}{139,141,142}


\newcommand\hwans[1]{ %
  \hwansv{0em}{#1}}


\newcommand\hwgrading[1]{ %
  \ifkey
  {\emph{\color{gray!100!black}{#1}}} %
  \fi
}

\tikzset{%
  fastate/.style = {%
    circle,draw,align=center,node distance=6em,thick
  },
  fastateo/.style = {%
    ellipse,draw,align=center,node distance=6em,thick,
    align=center
  },
  faaccept/.style = {%
    fastate,double
  },
  faedge/.style = {%
    ->,thick,>=stealth
  },
  faedgeup/.style = {%
    out=30,in=150
  },
  faedgedn/.style = {%
    out=210,in=330
  },
  faouter/.style={%
    draw,rounded corners=1em,node distance=4em
  }
}

\newcommand{\fastart}[2][]{%
  \draw[faedge]
  node[node distance=2em,font=\scriptsize,#1] {start}
  edge (#2);
}


%%%%%%%%%%%%%%%%%%%%%
%%% Cons Diagrams %%%
%%%%%%%%%%%%%%%%%%%%%

\tikzset{%
  cons/.style = {%
    rectangle split, rectangle split parts=2,
    draw, rectangle split horizontal, on chain, align=center,
    append after command={%
      \pgfextra{%
        \let\mainnode=\tikzlastnode}
      coordinate (car \mainnode) at ($(\mainnode.west)!.5!(\mainnode.one split)$)
      coordinate (cdr \mainnode) at ($(\mainnode.one split)!.5!(\mainnode.east)$)}
    },
    sexpptr/.style = {%
      >=latex,->,thick
    },
    sexpval/.style  = {%
      font=\tt
    },
    sexpnil/.style = {%
      sexpval,on chain
    }
}


\newcommand{\cdrptr}[2]{%
    \draw[sexpptr] (cdr #1) -- (#2);
    \draw[fill] (cdr #1) circle (.2em);
}

\newcommand{\carptr}[2]{%
    \draw[sexpptr] (car #1) -- (#2);
    \draw[fill] (car #1) circle (.2em);
}

\newcommand{\carbezptr}[4]{%
  \draw[sexpptr] (car #1)
  .. controls (#3) and (#4) ..
  (#2);
  \draw[fill] (car #1) circle (.2em);
}


%%%%%%%%%%%%%%%%%
%%% WORKSHEET %%%
%%%%%%%%%%%%%%%%%

% 1: num
% 2: code
% 3: name

% \newcommand{\worksheettitle}[3]{%
%   \newcommand{\theworksheettitle}[0]{Worksheet: L{#1}---{#3}}
%   \title{\theworksheettitle}
%   \author{\coursecode: \coursename}
%   \newcommand{\lecturenum}[0]{#1}
%   \newcommand{\lecturecode}[0]{#2}
% }

% \newcommand{\lecworksheet}[3]{%
%   \newcommand{\theworksheettitle}[0]{{\bfseries Worksheet} -- L{#1}: {#3}}
%   \title{\theworksheettitle}
%   \author{\coursecode: \coursename}
%   \newcommand{\lecturenum}[0]{#1}
%   \newcommand{\lecturecode}[0]{#2}
% }

\RequirePackage{qrcode}

\newcommand{\worksheet}[1]{%
  \newcommand{\theleccode}[0]{#1}

  \newcommand{\thelecurl}[0]{\urlbase/L\thelecnum-\theleccode-prelecture.pdf}

  \newcommand{\theworksheettitle}[0]{{\bfseries Worksheet} --
    L{\thelecnum}: {\thelectitle}}
  \title{\theworksheettitle}
  \author{\coursecode: \coursename}

  % No QR-code for non-printed WS
  \makeatletter
  \renewcommand{\maketitle}[0]{
    %\begin{minipage}{5.25in}
      \begin{center}
        {\Large \theworksheettitle}\\[.75em]
        \coursecode: \coursename,
        \theterm\\[.75em]
    %   \end{center}
    % \end{minipage}
    % \hfil
    % \begin{minipage}{.75in}
    %   \centering
    %   \vspace{3em}
    %   \hypersetup{urlcolor=black}%
    %   \qrcode[height=\columnwidth]{\thelecurl}%
    %   \hypersetup{urlcolor=blue}%
    % \end{minipage}
    % \begin{center}
      \url{\thelecurl}
    \end{center}
    \vspace{1em}
    \thispagestyle{fancyplain}
  }
  \makeatother

}




\newcommand{\lecquiz}[0]{%
  \title{{\bfseries Quiz} -- L{\thelecnum}: \thelectitle}
  \author{\coursecode: \coursename}
}

\makeatletter
\newcommand{\makehandouttitle}[0]{
\begin{minipage}{5.25in}
  %\maketitle
  \begin{center}
    {\Large \theworksheettitle}\\[.75em]
    \coursecode: \coursename,
    \theterm\\[.75em]
    \slideurl{\lecturenum}{\lecturecode}
  \end{center}
\end{minipage}
\hfil
\begin{minipage}{.75in}
  \centering
  \vspace{3em}
  \handoutslidelink{\lecturenum}{\lecturecode}
\end{minipage}
\thispagestyle{fancyplain}
%\vspace{em}
}
\makeatother
