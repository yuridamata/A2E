## Script instalação dos pacotes necessários para aplicação do A2E
# por Guilherme N. Ramos (gnramos@unb.br | http://github.com/gnramos)
#
# A instalação necessita de privilégios de root.


repositorio <- "http://cran.r-project.org"
ignore <- install.packages("openNLP", repos = repositorio)
ignore <- install.packages("NLP", repos = repositorio)
ignore <- install.packages("tm", repos = repositorio)
ignore <- install.packages("bigmemory", repos = repositorio)
# ignore <- install.packages("openNLPdata", repos = repositorio)
ignore <- install.packages("http://datacube.wu.ac.at/src/contrib/openNLPmodels.pt_1.5-2.tar.gz",
                           repos = NULL, type = "source")
