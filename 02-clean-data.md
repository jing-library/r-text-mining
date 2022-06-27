---
title: "Clean up the Text"
teaching: 0
exercises: 0
---

:::::::::::::::::::::::::::::::::::::: questions 

- What is clean text?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Clean up the example documents with the package tidytext
- Calculate the word frequencies in the example documents

::::::::::::::::::::::::::::::::::::::::::::::::

## Introduction - Text Mining and R

Depending on how it is organized, data can be grouped into two categories: 
**structured data** and **unstructured data**. **Structured data** is data that has 
been predefined and formatted to a tabular format with rows and columns, such as 
data stored in a relational database, or membership information housed in an Excel 
spreadsheet. While **unformatted data** does not have a predefined data format.
It comes in various formats, for example, email, presentation, images, etc. Another
category is a blend between structured and unstructured data formats, which is
called **semi-structured data**. It refers to what would normally be considered 
unstructured data, but that also has metadata that identifies certain characteristics. 
Some common examples of semi-structured data are XML, JSON, and HTML files. 

**Text mining**, or **text analytics**, is the process of exploring and analyzing 
unstructured or semi-structured text data to identify key concepts, pattens, 
relationships, or other attributions of the data. 

R is powerful processing structured data, or tabular data, where data display in 
columns or tables. R can also handle unstructured and semi-structured data such as text. 
Julia Silge and David Robinson followed the [tidy data principles](https://doi.org/10.18637/jss.v059.i10) 
branded by [Hadley Wickham](https://hadley.nz/) and developed the package 
`tidytext` to analyze textual data. This lesson will focus on using the package 
`tidytext` for text mining.

In the package `tidytext`, **tidy text** is defined as a one-token-per-row data 
frame, where a **token** is a meaningful unit of text, such as a word, a sentence, 
or a paragraph, that we are interested in analyzing. **Tokenization** is a process 
of splitting text into tokens. 

Tidy data sets allow manipulation with a standard set of "tidy" tools, including popular 
packages such as dplyr ([Wickham and Francois 2016](https://www.tidytextmining.com/references.html#ref-R-dplyr)), 
tidyr ([Wickham 2016](https://www.tidytextmining.com/references.html#ref-R-tidyr)), 
ggplot2 ([Wickham 2009](https://www.tidytextmining.com/references.html#ref-R-ggplot2)), 
and broom ([Robinson 2017](https://www.tidytextmining.com/references.html#ref-R-broom)).
These packages extend the capacities of `tidytext` of exploring and visualizing textual 
data. Users can transit fluidly between these packages by keeping the input and output 
in tidy formats. 

## Token and Tokenization
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
The function `unnest_tokens` has three primary arguments: 
1. tbl: the data frame to be tokenized
2. output: the column to be created as string or symbol
3. input: the column that gets split as string or symbol

It also has several optional arguments. The default token is "words". It can be set as 
"characters", "sentences", "ngrams", "lines", "paragraphs", etc. `unnest_tokens` automatically 
converts tokens to lowercase and drops the input column if not specified. 

The result of `unnest_tokens` is a tibble. In our case, 41 words in the lyrics are broken 
into 41 rows. The input column *lyrics* is removed; the new column, or the output column 
*word*, is added; and the column *line* is kept unchanged.  

Since the first argument of `unnest_tokens` is a data frame, we can also use pipes to send 
a data frame to it and obtain the same results:
```r
lyrics_df %>% 
  unnest_tokens(word, lyrics)
```

## 


This is a lesson created via The Carpentries Workbench. It is written in
[Pandoc-flavored Markdown](https://pandoc.org/MANUAL.txt) for static files and
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
