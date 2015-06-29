filtragemResultados = function(matrizResultados, intervalosConfianca){
  resultadosFiltrados = matrix(nrow=dim(matrizResultados)[1], ncol=3);
  dimnames(resultadosFiltrados)[1]=dimnames(matrizResultados)[1];
  
  #filtragem sobre a matriz de resultados, filtrando aqueles que são maiores que a média de cada risco
  for(i in 1:dim(matrizResultados)[1]){
    #resultadosFiltrados[i,1]=i;
    for(j in 13:15){
      if(matrizResultados[i,j]!="Administrativo.txt" && matrizResultados[i,j] != "EngenhariaSoftware.txt" && (matrizResultados[i, matrizResultados[i,j]]>=intervalosConfianca[matrizResultados[i,j]])){
        resultadosFiltrados[i,j-12]=matrizResultados[i,j];
      }else{
        resultadosFiltrados[i,j-12]="NULO";
      }   
    }
  }
  
  #simplificacao da matriz, mantendo apenas as linhas em que pelo menos uma das classificações é um risco
  linhasBuscadas = apply(filtragem, 1, function(x) any(x !="NULO" ));
  resultadosFiltrados = filtragem[linhasBuscadas,]
  
  #retorno da matriz
  return(resultadosFiltrados);
}