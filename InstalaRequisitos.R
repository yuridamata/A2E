## Script instalação dos pacotes necessários para aplicação do A2E
# por Guilherme N. Ramos (gnramos@unb.br | http://github.com/gnramos)
#
# A instalação necessita de privilégios de root.

required.packages <- c('openNLPdata', 'NLP', 'tm', 'bigmemory')
repository <- 'http://cran.r-project.org'
for (pkg in required.packages) {
  if (!require(pkg, character.only = TRUE)) {
    ignore <- install.packages(pkg, repos = repository, dependencies = TRUE)
  }
}

required.packages.src <- 'http://datacube.wu.ac.at/src/contrib/openNLPmodels.pt_1.5-2.tar.gz'
if (!require(openNLPmodels.pt)) {
  ignore <-  install.packages(required.packages.src, type = 'source',
                              repos = NULL, dependencies = TRUE)
}