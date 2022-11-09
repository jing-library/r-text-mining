---
title: "Clean the Text"
teaching: 0
exercises: 1
---

:::::::::::::::::::::::::::::::::::::: questions 

- What is clean text?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Clean the example documents with the package tidytext
- Calculate the word frequencies in the example documents

::::::::::::::::::::::::::::::::::::::::::::::::

## About Text Mining and Text Analysis

Depending on how it is organized, data can be grouped into two categories: 
**structured data** and **unstructured data**. **Structured data** is data that has 
been predefined and formatted to a tabular format with rows and columns, such as 
data stored in a relational database, or membership information housed in an Excel 
spreadsheet. While **unstructured data** does not have a predefined data format.
It comes in various formats, for example, email, presentation, images, etc. Another
category is a blend between structured and unstructured data formats, which is
called **semi-structured data**. It refers to what would normally be considered 
unstructured data, but that also has metadata that identifies certain characteristics. 
Some common examples of semi-structured data are XML, JSON, and HTML files. 

**Text mining**, or **text analytics**, is the process of exploring and analyzing 
unstructured or semi-structured text data to identify key concepts, pattens, 
relationships, or other attributions of the data. **Text mining** began with the
computational and information management areas, whereas **text analysis** originated
in the humanities with the manual analysis of text such as newspaper indexes and Bible
concordances. Now these two terms are exchangeable, and generally refer to the use of
computational methods to explore and analyze unstructured text data. 

A simplified process of a typical text mining study can include four steps: data gather, 
text preprocessing or cleaning, text analysis, and integration with the study. 

In terms of data gathering, we may create a dataset, which is called
a corpus, or we may select an existing data for mining. After a corpus
is generated, usually, we need to preprocess or clean it to get it ready
for analysis. Common techniques used for preparing a corpus include converting
text to lower case, removing punctuation and non-alphanumeric character,
remove stopwords, tokenization, tagging parts of speech, word replacement,
stemming and lemmatization, etc. Next step will be text mining. Some common
text mining methods are topic modelling, sentiment analysis, term frequency
and TD-IDF, and collocation analysis. We will then integrate the findings
from text mining to the study. Various text preprocessing techniques and text
mining methods serve different research purposes. This lesson is to demo how to
use the R package `tidytext` to preprocess text data from an existing dataset to
perform a sentiment analysis.

## Using R Package `tidytext` in Text Mining

R is powerful processing structured data, or tabular data, where data display in 
columns or tables. R can also handle unstructured and semi-structured data such as text. 
Julia Silge and David Robinson followed the [tidy data principles](https://doi.org/10.18637/jss.v059.i10) 
branded by [Hadley Wickham](https://hadley.nz/) and developed the package 
`tidytext` to analyze textual data. 

In the package `tidytext`, **tidy text** is defined as a one-token-per-row data 
frame, where a **token** is a semantically meaningful unit of text, such as a word, 
a sentence, or a paragraph, that we are interested in analyzing. **Tokenization** 
is a process of segmenting running text into a list of tokens to create a table 
with one-token-per-row. 

Tidy data sets allow manipulation with a standard set of "tidy" tools, including popular 
packages such as dplyr ([Wickham and Francois 2016](https://www.tidytextmining.com/references.html#ref-R-dplyr)), 
tidyr ([Wickham 2016](https://www.tidytextmining.com/references.html#ref-R-tidyr)), 
ggplot2 ([Wickham 2009](https://www.tidytextmining.com/references.html#ref-R-ggplot2)), 
and broom ([Robinson 2017](https://www.tidytextmining.com/references.html#ref-R-broom)).
These packages extend the capacities of `tidytext` of exploring and visualizing textual 
data. Users can transit fluidly between these packages by keeping the input and output 
in tidy formats. 

### Token and Tokenization
In R, textual data can be stored as character vectors. For example:

```r
lyrics <- c("How many roads must a man walk down", 
            "Before you call him a man?", 
            "How many seas must a white dove sail", 
            "Before she sleeps in the sand?", 
            "Yes, and how many times must the cannonballs fly", 
            "Before they're forever banned?")
lyrics
```
```output
[1] "How many roads must a man walk down"             
[2] "Before you call him a man?"                      
[3] "How many seas must a white dove sail"            
[4] "Before she sleeps in the sand?"                  
[5] "Yes, and how many times must the cannonballs fly"
[6] "Before they're forever banned?"
```
To tokenize this character vector, we first need to put it into a data frame. We use the 
function [tibble](https://tibble.tidyverse.org/reference/tibble.html) from the package 
`tidyverse` to convert a character vector into a tibble. 

```r
library(tidyverse)
lyrics_df <- tibble(line = 1:6, lyrics)

lyrics_df
```
```output
# A tibble: 6 × 2
   line lyrics                                          
  <int> <chr>                                           
1     1 How many roads must a man walk down             
2     2 Before you call him a man?                      
3     3 How many seas must a white dove sail            
4     4 Before she sleeps in the sand?                  
5     5 Yes, and how many times must the cannonballs fly
6     6 Before they're forever banned? 
```
Next step is tokenization, where we split the text into units, or tokens for further
analyses. We will use the function [`unnest_tokens`](https://rdrr.io/pkg/tidytext/man/unnest_tokens.html)
to break the lyrics into words and strip punctuations. 

The function `unnest_tokens` has three primary arguments:

 1. tbl: the data frame to be tokenized.
 2. output: the column to be created as string or symbol.
 3. input: the column that gets split as string or symbol.

```r
library(tidytext)

unnest_tokens(tbl = lyrics_df,
              output = word,
              input = lyrics)
```

```outupt
# A tibble: 41 × 2
    line word  
   <int> <chr> 
 1     1 how   
 2     1 many  
 3     1 roads 
 4     1 must  
 5     1 a     
 6     1 man   
 7     1 walk  
 8     1 down  
 9     2 before
10     2 you   
# … with 31 more rows
```

Beyond these three primary arguments, the function [`unnest_tokens`](https://rdrr.io/pkg/tidytext/man/unnest_tokens.html)
also has several optional arguments. The default token is "words". It can be set as 
"characters", "sentences", "ngrams", "lines", "paragraphs", etc. `unnest_tokens` automatically 
converts tokens to lowercase and drops the input column if not specified. Punctuations
are stripped druing the tokenization. 

The result of `unnest_tokens` is a tibble. In our case, 41 words in the lyrics are broken 
into 41 rows. The input column *lyrics* is removed; the new column, or the output column 
*word*, is added; and the column *line* is kept unchanged.  

Since the first argument of `unnest_tokens` is a data frame, we can also use pipes to send 
a data frame to it and obtain the same results:
```r
lyrics_df %>% 
  unnest_tokens(word, lyrics)
```

### Project Gutenberg collection

The [Project Gutenberg](https://www.gutenberg.org/) is a collection of free electronic books, 
or eBooks, available online. The R package [`gutenbergr`](https://cran.r-project.org/web/packages/gutenbergr/vignettes/intro.html), 
developed by [David Robinson](https://en.wikipedia.org/wiki/David_G._Robinson_(data_scientist)), 
allows users to download public domain works from the Project Gutenberg collection as well as 
search and filter works by author, title, language, subjects, and other metadata. Project 
Gutenberg ID numbers are listed in this metadata, which allows us to download the text for each 
novel using the function gutenberg_download() . Let's use [The Time Machine](https://www.gutenberg.org/ebooks/35), [The War of the Worlds](https://www.gutenberg.org/ebooks/36), and [The Invisilbe Man](https://www.gutenberg.org/ebooks/5230). 
 
```r
library(gutenbergr)

hgwells <- gutenberg_download(c(35, 36, 5230))
```

::::::::::::::::::::::::::::::::::::: challenge 

## Challenge 1: Can you do it?

How can we use unnest_tokens with the H.G. Wells novels?



:::::::::::::::::::::::: solution 

## Output

```r
tidy_hgwells <- hgwells %>%
  unnest_tokens(word, text)
```
```output
TEST TEST TEST NEED TO ADD
```

:::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::




## Word Frequencies

One of the first steps used in text analysis, is word frequency. Word frequency looks at how how often words are repeat in texts. In order to count the words, we first need to remove extremely common words called stop words such as "the", "have", "is", "are" amoung others in English. We can remove. Using the H.G. Wells books let's look at how we could run it in R. 


```r
tidy_hgwells <- hgwells %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)
```

This is a lesson created via The Carpentries Workbench. It is written in
[Pandoc-flavored Markdown](https://pandoc.org/MANUAL.html) for static files and
[R Markdown][r-markdown] for dynamic files that can render code into output. 
Please refer to the [Introduction to The Carpentries 
Workbench](https://carpentries.github.io/sandpaper-docs/) for full documentation.

What you need to know is that there are three sections required for a valid
Carpentries lesson:

 1. `questions` are displayed at the beginning of the episode to prime the
    learner for the content.
 2. `objectives` are the learning objectives for an episode displayed with
    the questions.
 3. `keypoints` are displayed at the end of the episode to reinforce the
    objectives.

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor

Inline instructor notes can help inform instructors of timing challenges
associated with the lessons. They appear in the "Instructor View"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: challenge 

## Challenge 1: Can you do it?

Rearrange the lines below to display the word(s) that appear over 600 times.

```r
tidy_books
  filter(n > 600)
  mutate(word = reorder(word, n))
  count(word, sort = TRUE) 
  ggplot(aes(word, n)) +
	  geom_col() +
	  xlab(NULL) +
	  coord_flip()
```

:::::::::::::::::::::::: solution 

## Output

```r
tidy_books %>%
  count(word, sort = TRUE) %>%
  filter(n > 600) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()
```
```output
[1] "This new lesson looks good"
```

:::::::::::::::::::::::::::::::::


## Challenge 2: how do you nest solutions within challenge blocks?

:::::::::::::::::::::::: solution 

You can add a line with at least three colons and a `solution` tag.

:::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::

## Figures

You can use standard markdown for static figures with the following syntax:

`![optional caption that appears below the figure](figure url){alt='alt text for
accessibility purposes'}`

![You belong in The Carpentries!](https://raw.githubusercontent.com/carpentries/logo/master/Badge_Carpentries.svg){alt='Blue Carpentries hex person logo with no text.'}

## Math

One of our episodes contains $\LaTeX$ equations when describing how to create
dynamic reports with {knitr}, so we now use mathjax to describe this:

`$\alpha = \dfrac{1}{(1 - \beta)^2}$` becomes: $\alpha = \dfrac{1}{(1 - \beta)^2}$

Cool, right?

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

[r-markdown]: https://rmarkdown.rstudio.com/
