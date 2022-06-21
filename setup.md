---
title: Setup
---

Setup instructions live in this document. Please specify the tools and the data
sets the Learner needs to have installed.

## Data Sets

This lesson uses the data sets from the [Gutenberg Project](https://www.gutenberg.org/)
collection. We will install the package `gutenbergr`, download the books and metadata 
in the class. 


## Software Setup

::::::::::::::::::::::::::::::::::::::: discussion

### Details

**R** and **RStudio** are separate downloads and installations. R is the underlying 
statistical computing environment, but using R alone is no fun. RStudio is a 
graphical integrated development environment (IDE) that makes using R much easier 
and more interactive. You need to install R before you install RStudio. Once 
installed, because RStudio is an IDE, RStudio will run R in the background. 
You do not need to run it separately.

After installing both programs, you will need to install the `tidyverse` package 
from within RStudio. The `tidyverse` package is a powerful collection of data science 
tools within R see the [`tidyverse` website](https://www.tidyverse.org/) for more 
details. Follow the instructions below for your operating system, and then follow 
the instructions to install `tidyverse`.

:::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::: solution

### Windows

#### If you already have R and RStudio installed,
1. Open RStudio, and click on "Help" > "Check for updates". If a new version is available, quit RStudio, and download the latest version for RStudio.
2. To check which version of R you are using, start RStudio and the first thing that appears in the console indicates the version of R you are running. Alternatively, you can type `sessionInfo()`, which will also display which version of R you are running. Go on the [CRAN website](https://cran.r-project.org/bin/windows/base/) and check whether a more recent version is available. If so, you can update R using the `installr` package, by running:  

~~~
if( !("installr" %in% installed.packages()) ){install.packages("installr")}
installr::updateR(TRUE)
~~~
{: .language-r}


:::::::::::::::::::::::::

:::::::::::::::: solution

### MacOS

Use Terminal.app

:::::::::::::::::::::::::


:::::::::::::::: solution

### Linux

Use Terminal

:::::::::::::::::::::::::

