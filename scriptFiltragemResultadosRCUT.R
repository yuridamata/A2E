filtragemResultadosRCUT = function(matrizResultados, pesosRCUT){
  
  #calcula os limiares a partir dos pesos
  aux = rep(c(1), each=nrow(matrizResultados));
  aux = cbind(matrizResultados, aux);
  class(aux) = "numeric";
  limiaresRCUT = aux%*%pesosRCUT;
  
  #criação da nova matriz
  resultadosFiltrados = matrix(nrow=dim(matrizResultados)[1], ncol=dim(matrizResultados)[2]);
  dimnames(resultadosFiltrados)[1]=dimnames(matrizResultados)[1];
  
  #filtragem sobre a matriz de resultados, filtrando aqueles que são maiores que cada limiarSCUT
  for(i in 1:nrow(matrizResultados)){
    #resultadosFiltrados[i,1]=i;
    for(j in 1:ncol(matrizResultados)){
      if(matrizResultados[i,j]>limiaresRCUT[i]) {resultadosFiltrados[i,j]=1;}
      else resultadosFiltrados[i,j]=0;  
    }
  }
  
  #simplificacao da matriz, mantendo apenas as linhas em que pelo menos uma das classificações é um risco
  linhasBuscadas = apply(resultadosFiltrados, 1, function(x) any(x !=0 ));
  resultadosFiltrados = resultadosFiltrados[linhasBuscadas,]
  
  #retorno da matriz
  return(resultadosFiltrados);
}