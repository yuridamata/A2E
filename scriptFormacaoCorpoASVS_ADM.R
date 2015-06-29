require(openNLP)
require(openNLPmodels.pt)
require(NLP)
require(tm)
require(bigmemory)
require(SnowballC)


fonte = DirSource(directory="/media/Lexar/rodrigo/MPCA/mineracaoDados/fabrica/baseSeguranca/corpo8666/", encoding="UTF-8");
elem = pGetElem(stepNext(fonte));

#formacao da string a ser analisada
textoString = paste(elem[[1]][[1]], collapse="");
textoString = as.String(textoString);

#realizando as anotacoes das sentencas presentes no texto extraido
anotador = Maxent_Sent_Token_Annotator(language = "pt", probs = FALSE, model = NULL);
anotacao = annotate(textoString, anotador);

#formacao do corpo
rowNamesCorpo = textoString[anotacao];

amostraTexto = rowNamesCorpo[amostraADM];

paragrafosASVS = scan("/media/usb0/rodrigo/MPCA/mineracaoDados/fabrica/baseSeguranca/requisitosASVS/requisitosASVS.txt","character",sep="\n", fileEncoding="latin1");
paragrafosASVS = c(amostraTexto,paragrafosASVS);
Corpo_RequisitosASVS = Corpus(VectorSource(paragrafosASVS))
Corpo_RequisitosASVS <- tm_map(Corpo_RequisitosASVS,
                               content_transformer(function(x) iconv(x, to='latin1', sub='byte')),
                               mc.cores=1)
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, stripWhitespace)
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, content_transformer(tolower))
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, removePunctuation)
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, removeWords, stopwords("portuguese"), lazy=TRUE)
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, removeWords, stopwords("english"), lazy=TRUE)
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, stemDocument, language="portuguese", lazy=TRUE)
Corpo_RequisitosASVS = tm_map(Corpo_RequisitosASVS, stemDocument, language="english", lazy=TRUE)
matrizParagrafos = DocumentTermMatrix(Corpo_RequisitosASVS, control = list(dictionary = rownames(matrizConceitos_NormalizadaTraduzida), weighting = weightTf))
#matrizParagrafos = DocumentTermMatrix(Corpo_RequisitosASVS)

rownames(matrizParagrafos) = paragrafosASVS


#rm(Corpo);
#rm(paragrafos)
#gc();

matrizParagrafos_Normalizada = as.big.matrix(as.matrix(matrizParagrafos), backingfile="matrizParagrafos_Normalizada2.bin",
                                             backingpath="/home/rnpeclat/Desktop/requisitosASVS/", descriptorfile="matrizParagrafos_Normalizada2.desc",
                                             shared = FALSE);

resultadoOWASP = processaMatriz(matrizParagrafos_Normalizada);