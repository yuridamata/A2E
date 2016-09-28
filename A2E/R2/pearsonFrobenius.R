require(matrixcalc)

pearsonFrobenius = function(matriz1, matriz2, matrizCentro){
  
  
  if(ncol(matriz1) != ncol(matriz2) || ncol(matrizCentro)!=ncol(matriz1)){
    print("incompatibilidade entre as colunas das matrizes");
    return();
  }
  matrizAux1 = c();
  matrizAux2 = c();
  for(i in 1:nrow(matriz1)){
    if(any(matriz1[i,])&& any(matriz2[i,])){
      matrizAux1 = rbind(matrizAux1, matriz1[i,]-matrizCentro[i,]);
      matrizAux2 = rbind(matrizAux2, matriz2[i,]-matrizCentro[i,]);
    }
  }
  if(!is.null(matrizAux1)){
    return(frobenius.prod(matrizAux1, matrizAux2)/frobenius.norm(matrizAux1)/frobenius.norm(matrizAux2));
  }
  else{
    return(-100);
  }
}