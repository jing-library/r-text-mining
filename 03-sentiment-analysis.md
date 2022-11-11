---
title: "Sentiment Analysis"
teaching: 0
exercises: 0
---

:::::::::::::::::::::::::::::::::::::: questions 

- What is sentment analysis?
- How can text analysis evaluate emotion?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Analyze sentiment using general-purpose lexicons
- Visualize the sentiment analysis results using column chart and word cloud 

::::::::::::::::::::::::::::::::::::::::::::::::

## Sentiment Analysis

Sentiment Analysis identifies the emotional tone behind a body of text. Sentiment Analysis or opinion mining is a text analysis technique that automatically identify and extracts the sentiment tone from within text. 

The tidytext package comes with several sentiment lexicons datasets. These lexicons are based on unigrams, i.e., single words from the English language and the words are assigned scores for positive or negative sentiment and possibly emotions like joy, anger, sadness, and surprise.

The function get_sentiments() allows us to get specific sentiment lexicons with the appropriate measures for each one.













Beyond displaying the word frequencies in a table, we can also visualize it using the package [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html)
or the packages [wordcloud](https://cran.r-project.org/web/packages/wordcloud/wordcloud.pdf).

```r
tidy_time_machine %>% 
  count(word, sort = TRUE) %>%
  filter(n > 40) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(n, word))+
  geom_col()+
  theme_bw()
```
The output is a column chart:
![Column chart for word frequency](word_frequency_bar.png)


```r
count_time_machine <- tidy_time_machine %>% 
  count(word, sort = TRUE)
  
wordcloud(words = count_time_machine$word,
          freq = count_time_machine$n,
          random.order = FALSE,
          max.words = 100,
          colors = brewer.pal(8,"Dark2"))
```

![Wordcloud using the package wordcloud](wordcloud.png)


::::::::::::::::::::::::::::::::::::: challenge 

## Challenge 2: Can you create wordcloud using the package `wordcloud`?

Display the word frequencies of the clean data of the three novels by H.G. Wells that appear over 100 times.

:::::::::::::::::::::::: solution 

## Output

```r
tidy_hgwells %>% 
  count(word, sort = TRUE) %>% 
  filter(n > 100) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n)) +
    geom_col() +
    xlab(NULL) +
    coord_flip()
```
![Column chart for word frequency](challenge2_solution.png)

:::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::











This is a lesson created via The Carpentries Workbench. It is written in
[Pandoc-flavored Markdown](https://pandoc.org/MANUAL.txt) for static files and
[R Markdown][r-markdown] for dynamic files that can render code into output. 
Please refer to the [Introduction to The Carpentries 
Workbench](https://carpentries.github.io/sandpaper-docs/) for full documentation.

What you need to know is that there are three sections required for a valid
Carpentries lesson template:

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

What is the output of this command?

```r
paste("This", "new", "lesson", "looks", "good")
```

:::::::::::::::::::::::: solution 

## Output
 
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

You can also include figures generated from R Markdown:


```r
pie(
  c(Sky = 78, "Sunny side of pyramid" = 17, "Shady side of pyramid" = 5), 
  init.angle = 315, 
  col = c("deepskyblue", "yellow", "yellow3"), 
  border = FALSE
)
```

<div class="figure" style="text-align: center">
<img src="fig/03-sentiment-analysis-rendered-pyramid-1.png" alt="pie chart illusion of a pyramid"  />
<p class="caption">Sun arise each and every morning</p>
</div>

Or you can use standard markdown for static figures with the following syntax:

`![optional caption that appears below the figure](figure url){alt='alt text for
accessibility purposes'}`

![You belong in The Carpentries!](https://raw.githubusercontent.com/carpentries/logo/master/Badge_Carpentries.svg){alt='Blue Carpentries hex person logo with no text.'}

## Math

One of our episodes contains $\LaTeX$ equations when describing how to create
dynamic reports with {knitr}, so we now use mathjax to describe this:

`$\alpha = \dfrac{1}{(1 - \beta)^2}$` becomes: $\alpha = \dfrac{1}{(1 - \beta)^2}$

Cool, right?

::::::::::::::::::::::::::::::::::::: keypoints 

- Well we can use this 
- Use 

::::::::::::::::::::::::::::::::::::::::::::::::

[r-markdown]: https://rmarkdown.rstudio.com/