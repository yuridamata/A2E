cosineMatrix = function(matrix1, matrix2){
  if(ncol(matrix1) != ncol(matrix2)){
    print("incompatibilidade entre as colunas das matrizes");
    return();
  }
  somaCossenos = 0;
  count = 0;
  for(i in 1:nrow(matrix1)){
    if(any(matrix1[i,]) && any(matrix2[i,])){
      auxCosine = crossprod(matrix1[i,], matrix2[i,])/sqrt(crossprod(matrix1[i,]) * crossprod(matrix2[i,]));
      somaCossenos = somaCossenos + auxCosine;
      count = count + 1;
    }
  }
  if(count!=0){ 
    return(somaCossenos/count);
  }else{
    return(-3);
  }
}