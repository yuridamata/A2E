calculaMatrizCentro = function(listaMatrizes){
    
    vetorCount = vector("numeric", nrow(listaMatrizes[[1]]));
    for(i in 1:length(listaMatrizes)){
      for(j in 1:nrow(listaMatrizes[[i]])){
        if(any(listaMatrizes[[i]][j,])){
          vetorCount[j] = vetorCount[j]+1;
        }
      }
    }
    
    somaMatrizes = Reduce("+", listaMatrizes)
    
    somaMatrizesFinal = matrix(rep(0, times=nrow(somaMatrizes)*ncol(somaMatrizes)), nrow(somaMatrizes), ncol(somaMatrizes));
    for(i in 1:length(vetorCount)){
      if(vetorCount[i]!=0) {
        somaMatrizesFinal[i,] = somaMatrizes[i,]/vetorCount[i];
      }
    }
    return(somaMatrizesFinal);    

}