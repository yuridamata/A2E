npvLabelMatrizes = function(matriz1, matriz2){
  if(ncol(matriz1) != ncol(matriz2)){
    print("incompatibilidade entre as colunas das matrizes");
    return();
  }
  
  indiceMatriz1 = c();
  for(i in 1:nrow(matriz1)){
    if(any(matriz1[i,])){
      indiceMatriz1 = c(indiceMatriz1, i);
    }
  }  
  
  indiceMatriz2 = c();
  for(i in 1:nrow(matriz2)){
    if(any(matriz2[i,])){
      indiceMatriz2 = c(indiceMatriz2, i);
    }
  }
  
  indice = intersect(indiceMatriz1, indiceMatriz2);
  
  if(!is.null(indice)){
  
      npvLabels = vector("numeric", 5);
      for(j in 1:5){
        numeroClassificacoes = sum(matriz1[,j]==0);
        numeroClassificacoesCorretas = sum((!matriz1[,j] & !matriz2[,j])==1);
        npvLabels[j] = numeroClassificacoesCorretas/numeroClassificacoes;
      }
      return(npvLabels);
  }else return();
  
}