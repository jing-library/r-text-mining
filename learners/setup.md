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
1. Open RStudio, and click on "Help" > "Check for updates". If a new version is 
available, quit RStudio, and download the latest version for RStudio.
2. To check which version of R you are using, start RStudio and the first thing 
that appears in the console indicates the version of R you are running. 
Alternatively, you can type `sessionInfo()`, which will also display which 
version of R you are running. Go on the 
[CRAN website](https://cran.r-project.org/bin/windows/base/) and check whether 
a more recent version is available. If so, you can update R using the `installr` 
package, by running:  

```r
if( !("installr" %in% installed.packages()) ){install.packages("installr")}
installr::updateR(TRUE)
```
#### If you don't have R and RStudio installed,
1. Download R from the [CRAN website](http://cran.r-project.org/bin/windows/base/release.htm).
2. Run the `.exe` file that was just downloaded.
3. Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download).
4. Under *All Installers* select **RStudio-yyyy.mm.v-xxx.exe** (where y, m, v, and x
represent version numbers).
5. Double click the file to install it.
6. Once it's installed, open RStudio to make sure it works and you don't get any error messages.
:::::::::::::::::::::::::

:::::::::::::::: solution

### MacOS

#### If you already have R and RStudio installed

1. Open RStudio, and click on "Help" > "Check for updates". If a new version is available, quit RStudio, and download the latest version for RStudio.
2. To check the version of R you are using, start RStudio and the first thing that appears on the terminal indicates the version of R you are running. Alternatively, you can type `sessionInfo()`, which will also display which version of R you are running. Go on the [CRAN website](https://cran.r-project.org/bin/macosx/) and check whether a more recent version is available. If so, please download and install it. In any case, make sure you have at least R 3.2.

#### If you don’t have R and RStudio installed
1. Download R from the [CRAN website](http://cran.r-project.org/bin/macosx/).
2. Select the `.pkg` file for the latest R version.
3. Double click on the downloaded file to install R.
4. It is also a good idea to install [XQuartz](https://www.xquartz.org/) (needed by some packages).
5. Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download).
6. Under Installers select RStudio-yyyy.mm.v-xxx.dmg (where y, m, v, and x represent version numbers).
7. Double click the file to install RStudio.
8. Once it’s installed, open RStudio to make sure it works and you don’t get any error messages.

:::::::::::::::::::::::::


:::::::::::::::: solution

### Linux

1. Follow the instructions for your distribution from [CRAN](https://cloud.r-project.org/bin/linux), they provide information to get the most recent version of R for common distributions. For most distributions, you could use your package manager (e.g., for Debian/Ubuntu run `sudo apt-get install r-base`, and for Fedora `sudo yum install R`), but we don’t recommend this approach as the versions provided by this approach are usually out of date. In any case, make sure you have at least R 3.2.
2. Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download).
3. Under *Installers* select the version that matches your distribution, and install it with your preferred method (e.g., with Debian/Ubuntu `sudo dpkg -i rstudio-yyyy.mm.v-xxx-amd64.deb` at the terminal).
4. Once it’s installed, open RStudio to make sure it works and you don’t get any error messages.
5. Before installing the `tidyverse` package, **Ubuntu** (and related) users may need to install the following dependencies: `libcurl4-openssl-dev libssl-dev libxml2-dev` (e.g. `sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev`).

:::::::::::::::::::::::::


:::::::::::::::: solution

### For everyone

**After installing R and RStudio, you need to install the `tidyverse`, `tidytext`, and `gutenbergr` packages.**

* After starting RStudio, at the console type: `install.packages("tidyverse")` followed by the enter key. Once this has installed, type `install.packages("tidytext")` followed by the enter key. Once this has installed, type `install.packages("gutenbergr")` followed by the enter key. All three packages should now be installed.

:::::::::::::::::::::::::
