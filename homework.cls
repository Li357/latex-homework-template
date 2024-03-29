\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2021/03/22 Homework class]

\LoadClass{article}
\RequirePackage{fancyhdr}
\RequirePackage{extramarks}
\RequirePackage{datetime}
\RequirePackage[a4paper,left=2cm,right=2cm,top=2cm,bottom=2cm]{geometry}

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{enumerate}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions{\relax}

\newdateformat{monthyeardate}{\monthname[\THEMONTH] \THEYEAR}

\newcommand{\@course}{Course}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\title{Homework}
\author{Name}
\date{\monthyeardate\today}

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
\newcounter{hmwkproblemcounter}
\setcounter{hmwkproblemcounter}{1}
\nobreak\extramarks{Problem \arabic{hmwkproblemcounter}}{}\nobreak{}

\newenvironment{problem}[1][-1]{
  \ifnum#1>0
    \setcounter{hmwkproblemcounter}{#1}
  \fi
  \section{Problem \arabic{hmwkproblemcounter}}
  \newenvironment{parts}{
    \begin{enumerate}[(a)]
    \newcommand{\part}{\item}
  }{\end{enumerate}}
  \newcommand{\solution}{\subsubsection{\large Solution}}
  \enterproblemheader{hmwkproblemcounter}
}{
  \exitproblemheader{hmwkproblemcounter}
}
