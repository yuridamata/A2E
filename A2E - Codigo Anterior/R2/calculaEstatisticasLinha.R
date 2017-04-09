calculaEstatisticasLinha = function(matrizResultado, matrizGabarito, matrizLimiares){
  
  vetorPrecisao = vector(mode="integer", length=nrow(matrizResultado));
  vetorRecall = vector(mode="integer", length=nrow(matrizResultado));
  beta = vector(mode="integer", length=3);
  resultado = rep(c(0), each=12);
  resultado = matrix(resultado, nrow=ncol(matrizLimiares), ncol=4);
  resultado = matrix(resultado, nrow=ncol(matrizLimiares)*length(beta), ncol=4);

  beta[1] = 0.5;
  beta[2] = 1;
  beta[3] = 2;
  
  for(k in 1:ncol(matrizLimiares)){
      
      for(i in 1:nrow(matrizResultado)){
    
        threshold = matrizLimiares[i,k];
        
        gabaritosIteracao = colnames(matrizGabarito)[matrizGabarito[i,]==TRUE];
        naoGabaritosIteracao = colnames(matrizGabarito)[matrizGabarito[i,]==FALSE];
        
        scoresOrdenados = unique(sort(matrizResultado[i,1:12]));
              
        rotulosAbaixoThreshold = colnames(matrizResultado[,1:12])[matrizResultado[i,1:12] < threshold];
        rotulosAcimaThreshold = colnames(matrizResultado[,1:12])[matrizResultado[i,1:12] >= threshold];
        
        truePositives = length(intersect(gabaritosIteracao, rotulosAcimaThreshold));
        
        vetorPrecisao[i]=truePositives/length(rotulosAcimaThreshold);
        vetorRecall[i]= truePositives/length(gabaritosIteracao);
  
    }
    
    for(j in 1:length(beta)){
      resultado[3*(k-1)+j,1] = k;
      resultado[3*(k-1)+j,2] = sum(vetorPrecisao)/length(vetorPrecisao);
      resultado[3*(k-1)+j,3] = sum(vetorRecall)/length(vetorRecall);
      resultado[3*(k-1)+j,4]= ((1+beta[j]^2)*(resultado[3*(k-1)+j,2]*resultado[3*(k-1)+j,3]))/((beta[j]^2)*resultado[3*(k-1)+j,2]+resultado[3*(k-1)+j,3]);
    }
  }  
   
  return(resultado);
}