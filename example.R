## Script execução do Analisador Automático de Editais
# por Rodrigo N. Peclat
#     Guilherme N. Ramos (gnramos@unb.br | http://github.com/gnramos)
#

# Load package
# library('A2E')

# The alternative for not installing the package is:
library(devtools)
load_all('A2E')

# Actual example code starts here

load.required.NLPmodel('pt')

pdfs <- list.files(path='A2E/data', pattern="pdf", full.names=TRUE)
for (edital in pdfs) {
  txt <- get.text.content(edital)
  print(txt)
}