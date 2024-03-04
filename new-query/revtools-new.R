#CSV TO BIB tool:https://www.bibtex.com/c/doi-to-bibtex-converter/
#revtools PDF: https://cran.r-project.org/web/packages/revtools/revtools.pdf

library (revtools)
library(RefManageR)
library(bibliometrix)
library(bibtex)


wos_bib <- ReadBib("wos.bib")

pub_bib <- ReadBib("pubmed.bib")

# Merge the two lists of references

merged_bib <- c(wos_bib, pub_bib)

# Remove duplicates based on DOI (assuming DOI is present in both .bib files)

unique_bib <- unique(merged_bib, by = "DOI")

# Write the merged and deduplicated .bib file

WriteBib(unique_bib, file = "merged2.bib")


# read file
data <- read_bibliography()

# distribute tasks
task <- distribute_tasks(data,reviewers,write_csv=TRUE, file_name="reviewer.csv",return_data=FALSE)

x <- read_bibliography("cleaned_merged2.csv")

result <- distribute_tasks(x, 4, write_csv=TRUE)#splitevenlyamong4reviewers

## find duplicates
duplicates <- screen_duplicates()

## titles
result_titles <- screen_titles()

## asbtracts
result_abstracts <- screen_abstracts()

## topics
topics <- screen_topics(data)





