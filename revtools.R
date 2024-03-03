# revtools package documentation: https://cran.r-project.org/web/packages/revtools/revtools.pdff

# install and load package
## install.packages("revtools")
## install.packages("RefManageR")
library (revtools)
library(RefManageR)
library(bibliometrix)

# merging bib files from wos and scopus
# Read .bib files from Web of Science and Scopus

wos_bib <- ReadBib("savedrecs.bib")


#scopus_bib <- ReadBib("scopus.bib")

# Merge the two lists of references
merged_bib <- c(wos_bib, scopus_bib)

# Remove duplicates based on DOI (assuming DOI is present in both .bib files)
unique_bib <- unique(merged_bib, by = "DOI")

# Write the merged and deduplicated .bib file
WriteBib(unique_bib, file = "merged_and_deduplicated2.bib")

# read file
data <- read_bibliography("merged_and_deduplicated.bib")

# distribute tasks
task <- distribute_tasks(data,reviewers,write_csv=TRUE, file_name="reviewer.csv",return_data=FALSE,...)

## find duplicates
duplicates <- screen_duplicates(data)

## titles
result_titles <- screen_titles(data)

## asbtracts
result_abstracts <- screen_abstracts(data)

## topics
topics <- screen_topics(data)





