recallLabelMatrizes = function(matriz1, matriz2){
  if(ncol(matriz1) != ncol(matriz2)){
    print("incompatibilidade entre as colunas das matrizes");
    return();
  }
  
  recallLabels = vector("numeric", 5);
  for(j in 1:5){
    numeroClassificacoes = sum(matriz2[,j]==1);
    numeroClassificacoesCorretas = sum((matriz1[,j] & matriz2[,j])==1);
    recallLabels[j] = numeroClassificacoesCorretas/numeroClassificacoes;
  }
  
  return(recallLabels);
}