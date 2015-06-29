require(openNLP)
require(openNLPmodels.pt)
require(NLP)
require(tm)
require(bigmemory)

  
  
  #extracao dos textos depositados num diretorio
  fonte = DirSource(directory="/media/usb0/rodrigo/MPCA/mineracaoDados/fabrica/textos/", encoding="latin1");
  elem = pGetElem(stepNext(fonte));
  
  for(i in 1:length(elem)){
    
    aux = formaCorpo(elem[[i]][1]);
    
    matrizParagrafos_Normalizada = as.big.matrix(aux, backingfile="matrizParagrafos2_Normalizada.bin",
                                                 backingpath="/home/rnpeclat/Desktop/processamentoEditais/", 
                                                 descriptorfile="matrizParagrafos2_Normalizada.desc",
                                                 shared = FALSE);
    
    aux = processaMatriz(matrizParagrafos_Normalizada);
    
    if(i==1){
      matrizResultado_Conceitos = aux;
      #colnames(matrizR;esultado_Conceitos) = colnames(matrizConceitos_Normalizada);
      save(matrizResultado_Conceitos, file="/home/rnpeclat/Desktop/processamentoEditais/matrizResultado2_Conceitos.RData");
    } else{
      load("/home/rnpeclat/Desktop/processamentoEditais/matrizResultado2_Conceitos.RData");
      matrizResultado_Conceitos = rbind(matrizResultado_Conceitos, aux);
      
      #organizando o nome das linhas
      #auxVetor = seq(1, length(matrizREsultado_Conceitos), 1);
      #class(auxVetor) = "character";
      #rownames(matrizResultado_Conceitos) = auxVetor;
      
      
      save(matrizResultado_Conceitos, file="/home/rnpeclat/Desktop/processamentoEditais/matrizResultado2_Conceitos.RData");
      save(i, file="/home/rnpeclat/Desktop/processamentoEditais/contador2.RData");
    }
    
    gc(reset=TRUE);
    
  }