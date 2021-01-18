<h1> Sequential pattern mining in PubMed abstracts sentences on anticancer activity</h1>
<p> This repository contains all files used in the sequential pattern mining applied at 72.019 sentences with entity associations from PubMed abstracts classified as positive in <a href='https://github.com/ramongsilva/Text-classification-of-pubmed-abstracts-on-polyphenols-anticancer-activity'> Text Classification Step</a>.  Bellow, there is information about the files:</p>
<ul>
  <li><a href='https://github.com/ramongsilva/sequential-pattern-mining-in-pubmed-abstracts-sentences/blob/main/sequential-pattern-mining-pubmed-abstract-sentences-gh.R'>sequential-pattern-mining-pubmed-abstract-sentences-gh.R</a>: R script for sequential pattern mining in PubMed abstract sentences on polyphenols anticancer activity.</li>
  <li><a href='https://github.com/ramongsilva/sequential-pattern-mining-in-pubmed-abstracts-sentences/blob/main/anotated_sentences.tsv'>anotated_sentences.tsv</a>: tsv file with a list of 72.019 sentences annotated with entities about polyphenols, cancers and genes, for sequential pattern mining. Save this file in the same folder of sequential-pattern-mining-pubmed-abstract-sentences-gh.R script, because it is needed to execute the script.</li>
  
</ul>
<h2>Patterns mined</h2>
<p> Bellow, there is information about the files with the patterns mined, used in the creation of rules for information extraction about anticancer activity in PubMed abstracts:</p>
<ul>
  <li><a href='https://github.com/ramongsilva/sequential-pattern-mining-in-pubmed-abstracts-sentences/blob/main/Patterns-unique-trasaction.tsv'>Patterns-unique-trasaction.tsv</a>: list of patterns mined with a unique term.</li>
  <li><a href='https://github.com/ramongsilva/sequential-pattern-mining-in-pubmed-abstracts-sentences/blob/main/Patterns-polifenol-cancer-associations.tsv'>Patterns-polifenol-cancer-associations.tsv</a>: list of patterns mined with polyphenol-cancer entities associations.</li>
 <li><a href='https://github.com/ramongsilva/sequential-pattern-mining-in-pubmed-abstracts-sentences/blob/main/Patterns-polifenol-gene-associations.tsv'>Patterns-polifenol-gene-associations.tsv</a>: list of patterns mined with polyphenol-gene entities associations.</li>
 <li><a href='https://github.com/ramongsilva/sequential-pattern-mining-in-pubmed-abstracts-sentences/blob/main/Patterns-gene-cancer-associations.tsv'>Patterns-gene-cancer-associations.tsv</a>: list of patterns mined with gene-cancer entities associations.</li>  
</ul>

<h2>Rules Dictionary</h2>
<p>The sequential pattern mining contributes for creation of a dictionary with 25 rules for the <a href='https://github.com/ramongsilva/Information-extraction-from-pubmed-abstracts-sentences-on-polyphenols-anticancer-activity'>Information Extraction Step</a>. Click to see <a href='https://drive.google.com/file/d/1DotCACylU7GueHaPJkstwriWsJElFyI3/view' target='_blank'>more information about the Rules Dictionary Implementation</a>.</p>
