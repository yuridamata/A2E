#Configura o Working Directory correto
setwd("C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - A2E/Codigo Novo");

require(tm)
require(SnowballC)
require(slam)
source("extraiFeatures.R")



#formando o corpo a partir dos editais
conceitos<-Corpus(DirSource("C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - A2E/Codigo Novo/owasp", encoding = "UTF-8"),readerControl = list(language = "por"))
conceitos = tm_map(conceitos, stripWhitespace);
conceitos = tm_map(conceitos, tolower);
conceitos = tm_map(conceitos, removePunctuation);
conceitos = tm_map(conceitos, removeWords, stopwords("portuguese"));

matrizConceitos = DocumentTermMatrix(conceitos, control = list(weighting = weightTfIdf));  
matrizConceitos= as.data.frame(t(as.matrix(matrizConceitos)))
features = extraiFeatures(matrizConceitos, "relativo");
matrizConceitos_Normalizada = matrizConceitos[features,];
matrizConceitos_Normalizada = apply(matrizConceitos_Normalizada, 2, function(x) x*((sqrt(t(x)%*%x))^(-1)));
rownames(matrizConceitos_Normalizada) = features;
