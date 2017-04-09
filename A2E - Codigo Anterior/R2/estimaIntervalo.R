estimaIntervalo = function(probConfianca, vetorAmostra){
  
  vetorLimites = vector(mode="numeric", length=3);
  
  if(length(vetorAmostra)<30){
    media = mean(vetorAmostra);
    variancia = var(vetorAmostra)/sqrt(length(vetorAmostra));
    Z = qt(probConfianca+(1-probConfianca)/2, length(vetorAmostra)-1);
    vetorLimites[3] = media+3*Z*variancia;
    vetorLimites[2] = media;
    vetorLimites[1] = media-3*Z*variancia;
    return(vetorLimites);
  }
}