calculaThresholdRCUT = function (matrizResultado, matrizGabarito){
  
  #verificação se as matriz submetidas à função podem ser manipuladas 
  if (nrow(matrizResultado)!=nrow(matrizGabarito)){
    print("Matrizes têm diferentes números de linha")
    return();
  }
  
  vetorThreshold = vector(mode="numeric", length=nrow(matrizResultado));
  
  for(i in 1:nrow(matrizResultado)){
    
    threshold = vetorThreshold[i];
    erro = length(ncol(matrizResultado));
    
    gabaritosIteracao = colnames(matrizGabarito)[matrizGabarito[i,]==TRUE];
    naoGabaritosIteracao = colnames(matrizGabarito)[matrizGabarito[i,]==FALSE];
    
    scoresOrdenados = unique(sort(matrizResultado[i,1:ncol(matrizResultado)]));
    
    if(length(scoresOrdenados)==1) {
      
      vetorThreshold[i] = scoresOrdenados[1];
      break;
      
    }else{
      
      for(k in 1:length(scoresOrdenados)){
        
        auxThreshold = scoresOrdenados[k];
        
        rotulosAbaixoThreshold = colnames(matrizResultado[,1:ncol(matrizResultado)])[matrizResultado[i,1:ncol(matrizResultado)] <= auxThreshold];
        rotulosAcimaThreshold = colnames(matrizResultado[,1:ncol(matrizResultado)])[matrizResultado[i,1:ncol(matrizResultado)] > auxThreshold];
        
        auxErro = length(intersect(gabaritosIteracao, rotulosAbaixoThreshold))+length(intersect(naoGabaritosIteracao, rotulosAcimaThreshold));
        
        if(auxErro <= erro){
          erro = auxErro;
          threshold = auxThreshold;
        } 
      }
      
      vetorThreshold[i] = threshold;
    }    
  }
  
  return(vetorThreshold);
    
}