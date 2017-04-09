precisaoLabelConjuntoMatrizes = function(matriz1, lista){
  auxMatriz = c();
  for(i in 1:length(lista)){
    if(ncol(matriz1) != ncol(lista[[i]])){
      print("matrizes com diferentes números de colunas");
      return();
    }
    auxMatriz = rbind(auxMatriz, precisaoLabelMatrizes(matriz1, lista[[i]]));
  }
  return(auxMatriz);
}