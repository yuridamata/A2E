require(MASS)

calculaPageRank = function(grafoConceitos, resultadoParagrafosESA){
  
  if(nrow(grafoConceitos)!=ncol(resultadoParagrafosESA)) 
    return("É necessário que o grafo e os resultados do ESA tenham o mesmo número de linhas");
  
  #convertendo os elementos das matrizes para numeric
  class(grafoConceitos)= "numeric";
  class(resultadoParagrafosESA) = "numeric";
  
  #permutando elementos dessas matrizes/vetores de forma a isolar os nós dangling
  auxVetor = resultadoParagrafosESA[,11];
  resultadoParagrafosESA[,11] = resultadoParagrafosESA[,12];
  resultadoParagrafosESA[,12] = auxVetor;
  
  auxVetor = grafoConceitos[11,];
  grafoConceitos[11,] = grafoConceitos[12,];
  grafoConceitos[12,] = auxVetor;
  
  auxVetor = grafoConceitos[,11];
  grafoConceitos[,11] = grafoConceitos[,12];
  grafoConceitos[,12]= auxVetor;
  
  #aplicando a normalizacao L1 para o grafo de conceitos e oresultadoParagrafosESA
  grafoConceitos = t(apply(grafoConceitos, 1, function(x){x*(1/sum(x))}));
  grafoConceitos[is.nan(grafoConceitos)]=0;
  
  resultadoParagrafosESA = t(apply(resultadoParagrafosESA, 1, function(x){x*(1/sum(x))}));
  resultadoParagrafosESA[is.nan(resultadoParagrafosESA)]=0;
    
  #escolhendo o damping factor
  c = 0.85;
  
  matrixAux = resultadoParagrafosESA%*%ginv(diag(nrow(grafoConceitos))-c*grafoConceitos);
  matrixAux = t(apply(matrixAux, 1, function(x){x*1/sum(x)}));
  matrixAux[is.nan(matrixAux)]=0;
  
  #permutando para a posicao de entrada antes do retorno
  auxVetor = matrixAux[,11];
  matrixAux[,11] = matrixAux[,12];
  matrixAux[,12] = auxVetor;
  
  colnames(matrixAux) = colnames(resultadoParagrafosESA);
  rownames(matrixAux) = rownames(resultadoParagrafosESA);
  
  return(matrixAux);
  
}