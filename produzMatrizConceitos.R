#Cria um array contendo as bibliotecas necessárias e faz o apply com o "require" nelas
bibliotecas <- c("tm", "SnowballC", "class")
lapply(bibliotecas,require,character.only = TRUE)


require("NLP")
require("openNLP")

options(stringsAsFactors = TRUE)

#Configura o Working Directory correto
setwd("C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - A2E/Codigo Novo");

#Inclui o arquivo "config.R", contendo as seguintes variáveis de configuração
#   1. caminhoConceitos: String com o caminho para a pasta contendo os arquivos TXT que descrevem os conceitos.
#   2. caminhoConceitosMWE: String com o caminho para a pasta contendo os arquivos TXT que descrevem os conceitos para o Minimum Working Example
#   3. caminhoTexto: String com o caminho para a pasta contendo os arquivos TXT com os textos a serem analisados



caminhoConceitoMWE = "C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - A2E/Codigo Novo/conceitoMWE"
caminhoConceitos = "C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - A2E/Codigo Novo/owasp"

caminhoTexto = "C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - A2E/Codigo Novo/textoMWE"
source("config.R")

source("extraiFeatures.R")


#função que irá limpar o texto
limparCorpus <- function(corpus){
  
  corpus.temp <- tm_map(corpus,removePunctuation)
  corpus.temp <- tm_map(corpus,stripWhitespace)
  corpus.temp <- tm_map(corpus,tolower)
  corpus.temp <- tm_map(corpus.temp,removeWords,stopwords(kind = "portuguese"))
  corpus.temp <- tm_map(corpus.temp,stemDocument)
  corpus.temp <- tm_map(corpus.temp,removeNumbers)
  return(corpus.temp)
  
}

#função que gera um DataFrame contendo cada um do Arquivos de conceitos e o TF-IDF de cada palavara, neste espaço de conceitos
DF_TFIDF <- function(caminho){
  #corpusConceitos<-Corpus(DirSource("C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - A2E/Codigo Novo/owasp", encoding = "UTF-8"),readerControl = list(language = "pt-BR"))
  corpusConceitos<-Corpus(DirSource(caminho),readerControl = list(language = "pt-BR"))
  corpusConceitosLimpo <- limparCorpus(corpusConceitos)
  matrizTDM <-TermDocumentMatrix(corpusConceitosLimpo, control = list(weighting = weightTfIdf))
  
  return (as.data.frame(as.matrix(matrizTDM)))
}
      


#As variáveis iniciadas em DF são Data Frames. Aquelas iniciadas em V são vetores.

#Data Frame contendo os conceitos
DF_Conceitos <- DF_TFIDF(caminhoConceitoMWE)
#Data Frame contendo o texto analizado
DF_Texto <- DF_TFIDF(caminhoTexto)

V_FeaturesConceitos <- extraiFeatures(DF_Conceitos,)



