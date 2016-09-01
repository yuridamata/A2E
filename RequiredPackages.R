## Script instalação dos pacotes necessários para aplicação do A2E
# por Guilherme N. Ramos (gnramos@unb.br | http://github.com/gnramos)
#
# A instalação necessita de privilégios de root.

for (pkg in c('openNLPdata', 'NLP', 'tm', 'bigmemory'))
  if (!require(pkg, character.only = TRUE))
    ignore <- install.packages(pkg, repos='http://cran.r-project.org')

if (!require(openNLPmodels.pt))
  ignore <- install.packages('http://datacube.wu.ac.at/src/contrib/openNLPmodels.pt_1.5-2.tar.gz', repos=NULL)
