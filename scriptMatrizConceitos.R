require(tm)
require(SnowballC)
require(slam)

#formando o corpo a partir dos editais
conceitos<-Corpus(DirSource("/media/usb0/rodrigo/MPCA/mineracaoDados/cwe/cwes/Riscos/", encoding = "UTF-8"),readerControl = list(language = "en"))
conceitos = tm_map(conceitos, stripWhitespace)
conceitos = tm_map(conceitos, content_transformer(tolower))
conceitos = tm_map(conceitos, removePunctuation)
#conceitos = tm_map(conceitos, removeWords, stopwords("portuguese"))
conceitos = tm_map(conceitos, removeWords, stopwords("english"))
#conceitos = tm_map(conceitos, stemDocument, language="portuguese")
conceitos = tm_map(conceitos, stemDocument, language="english")
matrizConceitos = DocumentTermMatrix(conceitos, control = list(weighting = weightTfIdf))

matrizConceitos= as.data.frame(t(as.matrix(matrizConceitos)))

features = extraiFeatures(matrizConceitos, "relativo");

matrizConceitos_Normalizada = matrizConceitos[features,];

matrizConceitos_Normalizada = apply(matrizConceitos_Normalizada, 2, function(x) x*((sqrt(t(x)%*%x))^(-1)))

rownames(matrizConceitos_Normalizada) = features;
