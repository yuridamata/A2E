hammingLossMatrizes = function(matriz1, matriz2){
    
  if(ncol(matriz1) != ncol(matriz2)){
      print("incompatibilidade entre as colunas das matrizes");
      return();
  }

    auxHamming = 0;
    count=0;
    for(i in 1:nrow(matriz1)){
      if(any(matriz1[i,1:5])&& any(matriz2[i,])){
        auxHamming = auxHamming + sum(as.numeric(xor(matriz1[i,1:5],matriz2[i,1:5]))==1)/5;
        count = count + 1;
      }
    }
  #if(count>0){
    return(auxHamming/count);
  #}
  #else{
  #  return();
  #}
}