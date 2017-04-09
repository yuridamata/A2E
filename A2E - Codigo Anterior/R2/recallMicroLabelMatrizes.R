recallMicroLabelMatrizes = function(matriz1, matriz2){
  if(ncol(matriz1) != ncol(matriz2)){
    print("incompatibilidade entre as colunas das matrizes");
    return();
  }
  
  numeroRotulos = 0;
  numeroClassificacoesCorretas = 0;
  for(j in 1:5){
    numeroRotulos = numeroRotulos + sum(matriz2[,j]==1);
    numeroClassificacoesCorretas = numeroClassificacoesCorretas + sum((matriz1[,j] & matriz2[,j])==1);
  }
  
  return(numeroClassificacoesCorretas/numeroRotulos);
}