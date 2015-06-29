precisaoLabelMatrizes = function(matriz1, matriz2){
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
  
      precisaoLabels = vector("numeric", 5);
      for(j in 1:5){
        numeroClassificacoes = sum(matriz1[indice,j]==1);
        numeroClassificacoesCorretas = sum((matriz1[indice,j] & matriz2[indice,j])==1);
        precisaoLabels[j] = numeroClassificacoesCorretas/numeroClassificacoes;
      }
      
      return(precisaoLabels);
  }else return();
}