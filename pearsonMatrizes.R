pearsonMatrix = function(matrix1, matrix2){
  if(ncol(matrix1) != ncol(matrix2)){
    print("incompatibilidade entre as colunas das matrizes");
    return();
  }
  
  somaMatrix1 = vector("numeric", length = ncol(matrix1));
  somaMatrix2 = somaMatrix1;
  count=0;
  for(i in 1:nrow(matrix1)){
    if(any(matrix1[i,1:5]) && any(matrix2[i,])){
      somaMatrix1 = somaMatrix1 + matrix1[i,];
      somaMatrix2 = somaMatrix2 + matrix2[i,];
      count = count+1;
    }
  }
  if(count!=0){ 
    somaMatrix1 = somaMatrix1/count;
    somaMatrix2 = somaMatrix2/count;
  }else{
    return();
  }
  
  somaPearson = 0;
  count = 0;
  for(i in 1:nrow(matrix1)){
    if(any(matrix1[i,]) && any(matrix2[i,])){
      auxPearson = crossprod(matrix1[i,]-somaMatrix1, matrix2[i,]-somaMatrix2)/sqrt(crossprod(matrix1[i,]-somaMatrix1) * crossprod(matrix2[i,]-somaMatrix2));
      somaPearson = somaPearson + auxPearson;
      count = count + 1;
    }
  }
  if(count!=0){ 
    return(somaPearson/count);
  }else{
    return(-3);
  }
}