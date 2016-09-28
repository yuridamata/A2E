require(tm)
require(SnowballC)
require(slam)
require(bigmemory)

#formando o corpo do ASVS a partir de seus requisitos
paragrafosASVS<-scan("/media/usb0/rodrigo/MPCA/mineracaoDados/fabrica/baseSeguranca/requisitosASVS.txt","character",sep="\n");
Corpo_RequisitosASVS = Corpus(VectorSource(paragrafosASVS))
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, stripWhitespace)
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, tolower)
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, removePunctuation)
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, removeWords, stopwords("portuguese"))
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, removeWords, stopwords("english"))
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, stemDocument, language="portuguesde")
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, stemDocument, language="english")
matrizParagrafos = DocumentTermMatrix(Corpo_RequisitosASVS, control = list(dictionary = rownames(matrizConceitos_Normalizada), weighting = weightTf))

rm(Corpo);
rm(paragrafos)
gc();

matrizParagrafos_Normalizada = as.big.matrix(as.matrix(matrizParagrafos), backingfile="matrizParagrafos_Normalizada2.bin",
                                             backingpath="/home/rnpeclat/R/", descriptorfile="matrizParagrafos_Normalizada2.desc",
                                             shared = FALSE);

resultadoOWASP = processaMatriz(matrizParagrafos_Normalizada);