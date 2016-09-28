require(openNLP)
require(openNLPmodels.pt)
require(NLP)
require(tm)
require(bigmemory)

formaCorpo = function (vetorTexto){
  
    
    #formacao da string a ser analisada
    textoString = paste(vetorTexto, collapse="");
    textoString = as.String(textoString);
    
    #realizando as anotacoes das sentencas presentes no texto extraido
    anotador = Maxent_Sent_Token_Annotator(language = "pt", probs = FALSE, model = NULL);
    anotacao = annotate(textoString, anotador);
    
    #formacao do corpo
    rowNamesCorpo = textoString[anotacao];
    Corpo = Corpus(VectorSource(rowNamesCorpo));
    Corpo = tm_map(Corpo, removePunctuation);
    Corpo = tm_map(Corpo, stripWhitespace);
    Corpo = tm_map(Corpo, content_transformer(tolower));
    Corpo = tm_map(Corpo, removeWords, stopwords("portuguese"));
    Corpo = tm_map(Corpo, removeWords, stopwords("english"));
    Corpo = tm_map(Corpo, stemDocument, language="portuguese");
    Corpo = tm_map(Corpo, stemDocument, language="english");
    
    #geracao da matrix
    matrizParagrafos = DocumentTermMatrix(Corpo, control = list(dictionary = rownames(matrizConceitos_Normalizada), weighting = weightTf))
    
    #busca apenas as sentencas que passaram na filtragem anterior com o dicionario
    auxNames = rownames(matrizParagrafos);
    auxNames = as.numeric(auxNames);
    
    matrizParagrafos = as.matrix(matrizParagrafos);
    
    rownames(matrizParagrafos) = rowNamesCorpo[auxNames];

    return(matrizParagrafos)         
    
  
}