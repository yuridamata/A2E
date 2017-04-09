require(tm)
require(SnowballC)
require(slam)
require(bigmemory)

#formando o corpo a partir dos editais
paragrafos<-scan("F:/rodrigo/MPCA/mineracaoDados/fabrica/auxiliar/compendioEditais.txt","character",sep=".", quote="");
Corpo = Corpus(VectorSource(paragrafos))
Corpo = tm_map(Corpo, stripWhitespace)
Corpo = tm_map(Corpo, content_transformer(tolower))
Corpo = tm_map(Corpo, removePunctuation)
Corpo = tm_map(Corpo, removeWords, stopwords("portuguese"))
Corpo = tm_map(Corpo, removeWords, stopwords("english"))
Corpo = tm_map(Corpo, stemDocument, language="portuguese")
Corpo = tm_map(Corpo, stemDocument, language="english")
#matrizParagrafos = DocumentTermMatrix(Corpo, control = list(dictionary = rownames(matrizConceitos_Normalizada), weighting = weightTfIdf))
matrizParagrafos = DocumentTermMatrix(Corpo, control = list(dictionary = rownames(matrizConceitos_Normalizada), weighting = weightTf))


rm(Corpo);
rm(paragrafos)
gc();

matrizParagrafos_Normalizada = as.big.matrix(as.matrix(matrizParagrafos), backingfile="matrizParagrafos_Normalizada2.bin",
                                             backingpath="/home/rnpeclat/R/", descriptorfile="matrizParagrafos_Normalizada2.desc",
                                             shared = FALSE);

resultado = processaMatriz(matrizParagrafos_Normalizada);

#is.nan.data.frame <- function(x) do.call(cbind, lapply(x, is.nan))
#matrizParagrafos_Normalizada[is.nan(matrizParagrafos_Normalizada)] = 0

#matrizParagrafos_Normalizada = apply(matrizParagrafos_Normalizada, 2, function(x) x*((sqrt(t(x)%*%x))^(-1)))

#multiplicando a matriz ASVS pela matriz OWASP
#matrizSentencasConceitos = matprod_simple_triplet_matrix(matrizParagrafosASVS, matrizParagrafos

#criando coluna classificatoria
#classificacaoASVS = c(1:nrow(multiplicacaoASVS))
#classificacaoASVS = mapply(function(x) names(sort(multiplicacaoASVS[x,], decreasing=TRUE)[1]), classificacaoASVS)

#adicionando a coluna na matriz
#multiplicacaoASVS = cbind(multiplicacaoASVS, classificacaoASVS)