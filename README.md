<h1> Sequential pattern mining in pubmed abstracts sentences on anticancer activity</h1>
<p>  This repository contains all files used in the sequential pattern mining applied in sentences from pubmed abstracts classified as positive in <a href='https://github.com/ramongsilva/Text-classification-of-pubmed-abstracts-on-polyphenols-anticancer-activity'>Text Classification Step</a>. The patterns mined were used for find terms and keywords for creation of rules based in regular expressions, for <a href='https://github.com/ramongsilva/Information-extraction-from-pubmed-abstracts-sentences-on-polyphenols-anticancer-activity'>Information Extraction Step</a>.  Bellow, there are information about the files:</p>
<ul>
  <li><a href='https://github.com/ramongsilva/sequential-pattern-mining-in-pubmed-abstracts-sentences/blob/main/sequential-pattern-mining-pubmed-abstract-sentences-gh.R'>sequential-pattern-mining-pubmed-abstract-sentences-gh.R</a>: R script for sequential pattern mining in pubmed abstract sentences on polyphenols anticancer activity.</li>
  <li><a href='https://github.com/ramongsilva/sequential-pattern-mining-in-pubmed-abstracts-sentences/blob/main/anotated_sentences.tsv'>anotated_sentences.tsv</a>: tsv file with a list of 72.019 sentences anotated with entities about polyphenols, cancers and genes, for sequential pattern mining.</li>
  
</ul>
<h3>Patterns mined</h3>
<p> Bellow, there are information about the files with the patterns mined, used in creation of rules for information extraction about anticancer activity in pubmed abstracts:</p>
<ul>
  <li><a href='https://github.com/ramongsilva/sequential-pattern-mining-in-pubmed-abstracts-sentences/blob/main/Patterns-unique-trasaction.tsv'>Patterns-unique-trasaction.tsv</a>: list of patterns mined with a unique term.</li>
  <li><a href='https://github.com/ramongsilva/sequential-pattern-mining-in-pubmed-abstracts-sentences/blob/main/Patterns-polifenol-cancer-associations.tsv'>Patterns-polifenol-cancer-associations.tsv</a>: list of patterns mined with polyphenol-cancer entities associations.</li>
 <li><a href='https://github.com/ramongsilva/sequential-pattern-mining-in-pubmed-abstracts-sentences/blob/main/Patterns-polifenol-gene-associations.tsv'>Patterns-polifenol-gene-associations.tsv</a>: list of patterns mined with polyphenol-gene entities associations.</li>
 <li><a href='https://github.com/ramongsilva/sequential-pattern-mining-in-pubmed-abstracts-sentences/blob/main/Patterns-gene-cancer-associations.tsv'>Patterns-gene-cancer-associations.tsv</a>: list of patterns mined with gene-cancer entities associations.</li>  
</ul>
