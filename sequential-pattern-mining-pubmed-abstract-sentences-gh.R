##################################################################################################
# Script for sequential pattern mining in sentences about anticancer activity, using SPADE algorithm
# Author: Ramon Gustavo Teodoro Marques da Silva - ramongsilva@yahoo.com.br

# Instaltion of auxiliar libraries required
install.packages("arules")
install.packages("arulesSequences")
install.packages('Rcpp')

# Import libraries
library(plyr) 
library(DBI)
library(RMySQL)
library(RCurl)
library(RSQLite)
library(stringr)
library(XML)
library(rJava)
library(qdap)
library(reshape)
library(reshape2)
library(Matrix)
library(arules)
library(arulesSequences)
require(tm)


##################################################################################################
# Retrieving and pre-processing of the transformed sentences with associations of entities 
stopwords_pubmed = c('a','about','all','almost','also','although','always','among','an','and','another','any','are','as','at','because','before','between','both','but','can','could','do','does','done','due','during','each','either','enough','especially','for','found','from','further','here','how','however','i','if','in','into','it','its','itself','just','kg','km','made','mainly','make','may','mg','might','ml','mm','most','mostly','must','nearly','neither','no','nor','obtained','often','our','overall','perhaps','pmid','quite','rather','really','regarding','several','should','show','showed','significantly','since','so','some','such','than','that','the','their','theirs','them','then','there','therefore','these','they','this','those','through','thus','to','upon','using','various','very','we','were','what','when','which','while','with','within','without','would')
stopwords_obs = c('Method','Methods','Results','Conslusion','conclusions','Discussion')
setwd("folder-project/")
df_sentences_anotated = read.table(file = 'anotated_sentences.tsv', sep = '\t')
# Sample fo test
df_sentences_anotated = df_sentences_anotated[c(1:10000),]
df_sentences_anotated$sentences = as.character(df_sentences_anotated$sentences)
df_sentences_anotated$sentences = removeWords(df_sentences_anotated$sentences, stopwords_pubmed)
df_sentences_anotated$sentences = removeWords(df_sentences_anotated$sentences, stopwords_obs)
df_sentences_anotated$sentences = removePunctuation(df_sentences_anotated$sentences)
df_sentences_anotated$sentences = stripWhitespace(df_sentences_anotated$sentences)

##################################################################################################
# Transforming and writing sentences in sequence formats for sequential pattern mining
start_time = Sys.time()
pmids = c('11111')
words_final = c('CH&')
cod_sentence = 0
c = 1
ids = 1
for(i in 1:nrow(df_sentences_anotated)){
  words = paste(unlist(strsplit(df_sentences_anotated$sentences[i], " ")))
  cod_sentence = cod_sentence + 1
  pmid_sentence = str_c(df_sentences_anotated$pmid[i],cod_sentence)
  for(x in 1:length(words)){
    c = c + 1
    words_final = c(words_final,stripWhitespace(words[x]))
    #pmids = c(pmids,pmid_sentence)
    pmids = c(pmids,df_sentences_anotated$pmid[i])
    ids = c(ids,cod_sentence)
  }
  cat("\n Sentence: ",i)
}

sequences = words_final
ids = as.numeric(ids)
#ids_events = c(1:length(words_final))
lst_size = 1
mytxt = data.frame(cbind(ids,lst_size,sequences))
mytxt <- mytxt[order(ids),] 
mytxt$ids_events = c(1:length(words_final))
mytxt = mytxt[,c(1,4,2,3)]
write.table(mytxt, "mytxt.txt", sep=" ", row.names = FALSE, col.names = FALSE, quote = FALSE)
data <- read_baskets(con = "mytxt.txt", info = c("sequenceID","eventID","SIZE"))
as(data, "data.frame")


##################################################################################################
# Execute the CSPADE algorithm for pattern mining
s1 <- cspade(data, parameter = list(support = 0.003), control = list(verbose = TRUE))
# Results vizualization 
summary(s1)
df_patterns = as(s1, "data.frame")
df_patterns$sequence = as.character(df_patterns$sequence)
# Visualization of dataframe with total of patterns
View(df_patterns)


##################################################################################################
# Processing of patterns for classifications in unique and asssociation patterns: polyphenol-cancer, polyphenol-gene and gene-cancer pattenrs.
lst_patterns4 = list()
lst_freq4 = list()
c_pattern4 = 0
c_pattern_unique = 0
lst_patterns_unique = 0
lst_freq_unique = 0
for(w in 1:nrow(df_patterns)){
  if(sapply(strsplit(df_patterns$sequence[w], ","), length) > 1){
    # Conditional test for 'CH', 'DS' or 'GN'. Here its presented with 'CH'
    if(grepl('CH', df_patterns$sequence[w])){
            c_pattern4 = c_pattern4 + 1
            lst_patterns4[c_pattern4] = df_patterns$sequence[w]
            lst_freq4[c_pattern4] = df_patterns$support[w]
          }
    }else{
      c_pattern_unique = c_pattern_unique + 1
      lst_patterns_unique[c_pattern_unique] = df_patterns$sequence[w]
      lst_freq_unique[c_pattern_unique] = df_patterns$support[w]
    }
}
df_patterns_unique = data.frame(pattern = unlist(lst_patterns_unique), support = unlist(lst_freq_unique), stringsAsFactors = FALSE)
df_patterns = data.frame(pattern = unlist(lst_patterns4), support = unlist(lst_freq4), stringsAsFactors = FALSE)
df_patterns_unique = df_patterns_unique[order(-df_patterns_unique$support),]
df_patterns = df_patterns[order(-df_patterns$support),]
# Visualization of dataframe with unique patterns
View(df_patterns_unique)
# Visualization of dataframe with association patterns
View(df_patterns)


