recallMatrizes = function(matrizResposta, matrizMedida){
  recall = 0;
  count = 0;
  for(i in 1:nrow(matrizMedida)){
    if(any(matrizMedida[i,]) && any(matrizResposta[i,1:5])){
      acertosSentenca = as.numeric(matrizResposta[i,] & matrizMedida[i,]);
      recall = recall + sum(acertosSentenca==1)/sum(matrizMedida[i,]==1);
      count = count + 1;
    }
  }
  return(recall/count);
}