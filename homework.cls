\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2020/01/18 Homework class]

\LoadClass{article}
\RequirePackage{fancyhdr}
\RequirePackage{extramarks}
\RequirePackage[a4paper,left=2cm,right=2cm,top=2cm,bottom=2cm]{geometry}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions{\relax}

\newcommand{\@course}{Course}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\title{Homework}
\author{Name}
\date{Date}

\pagestyle{fancy}
\lhead{\@course}
\chead{\@title, \firstxmark}
\rhead{\@author}
\lfoot{\lastxmark}
\cfoot{\thepage}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

\setlength{\parindent}{0pt}

\renewcommand{\maketitle}{{
  \centering
  \thispagestyle{empty}
  \LARGE{\textbf{\@course: \@title}} \\
  \Large{\@date} \\
  \Large{\@author} \\
}}

\newcommand{\enterproblemheader}[1]{
  \nobreak\extramarks{}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
  \nobreak\extramarks{Problem \arabic{#1} (continued)}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
}

\newcommand{\exitproblemheader}[1]{
  \nobreak\extramarks{Problem \arabic{#1} (continued)}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
  \stepcounter{#1}
  \nobreak\extramarks{Problem \arabic{#1}}{}\nobreak{}
}

\setcounter{secnumdepth}{0}
\newcounter{hmwkpartcounter}
\newcounter{hmwkproblemcounter}
\setcounter{hmwkproblemcounter}{1}
\nobreak\extramarks{Problem \arabic{hmwkproblemcounter}}{}\nobreak{}

\newenvironment{problem}[1][-1]{
  \ifnum#1>0
    \setcounter{hmwkproblemcounter}{#1}
  \fi
  \section{Problem \arabic{hmwkproblemcounter}}
  \setcounter{hmwkpartcounter}{1}
  \renewcommand{\part}{\subsubsection{\large Part \alph{hmwkpartcounter}}\stepcounter{hmwkpartcounter}}
  \newcommand{\solution}{\subsubsection{\large Solution}}
  \enterproblemheader{hmwkproblemcounter}
}{
  \exitproblemheader{hmwkproblemcounter}
}
