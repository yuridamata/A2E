for (pkg in c('bigmemory', 'NLP', 'openNLP', 'tm'))
  if (!require(pkg, character.only=TRUE))
    ignore <- install.packages(pkg, repos='http://cran.r-project.org', dependencies=TRUE)