#MWE - Para o projeto A2E 

#Autor: Andrew Yuri da Silva Mata
# Última Atualização: 07/05/2017
# e-mail: yuridamata@gmail.com

#Cria um array contendo as bibliotecas necessárias e faz o apply com o "require" nelas
bibliotecas <- c("tm", "SnowballC", "class")
lapply(bibliotecas,require,character.only = TRUE)


#require("NLP")
#require("openNLP")
#require("coop")

options(stringsAsFactors = TRUE)

#Configura o Working Directory correto
setwd("C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - A2E/Codigo Novo");


#Inclui o arquivo "config.R", contendo as seguintes variáveis de configuração
#   1. caminhoCorpusMWE: String com o caminho para a pasta contendo os arquivos TXT que descrevem os conceitos para o Minimum Working Example
#     1.1 Para que a biblioteca funcione corretamente, o nomes dos arquivos devem seguir a seguinte convenção
#           Conceito: Pecedido de CPT_: CPT_ConceitoExemplo1.txt, CPT_ConceitoExemplo2.txt, etc
#           Texto: Pecedido de TXT_: TXT_TextoExemplo1.txt, TXT_TextoExemplo2.txt, etc

source("config.R")
source("extraiFeatures.R")
source ("similaridade.R")


#função que irá limpar o texto
limparCorpus <- function(corpus){
  
  corpus.temp <- tm_map(corpus,removePunctuation)
  corpus.temp <- tm_map(corpus,stripWhitespace)
  corpus.temp <- tm_map(corpus,tolower)
  corpus.temp <- tm_map(corpus.temp,removeWords,tm::stopwords(kind = "portuguese"))
  corpus.temp <- tm_map(corpus.temp,stemDocument)
  corpus.temp <- tm_map(corpus.temp,removeNumbers)
  return(corpus.temp)
  
}

#função que gera um DataFrame contendo cada um do Arquivos de conceitos e o TF-IDF de cada palavara, neste espaço de conceitos
DF_TFIDF <- function(caminho){
  
  corpusConceitos<-Corpus(DirSource(caminho),readerControl = list(language = "pt-BR"))
  corpusConceitos<-Corpus(DirSource(caminho),readerControl = list(language = "pt-BR"))  
  
  corpusConceitosLimpo <- limparCorpus(corpusConceitos)
  matrizTDM <-TermDocumentMatrix(corpusConceitosLimpo, control = list(weighting = weightTfIdf))
  
  return (as.data.frame(as.matrix(matrizTDM)))
}




