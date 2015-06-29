npvMatrizes = function(matrizResposta, matrizMedida){
  npv = 0;
  count = 0;
  for(i in 1:nrow(matrizMedida)){
    if(any(any(matrizResposta[i,1:5]) && matrizMedida[i,])){
      acertosSentenca = as.numeric(!matrizResposta[i,] & !matrizMedida[i,]);
      npv = npv + sum(acertosSentenca==1)/sum(matrizResposta[i,]==0);
      count = count + 1;
    }
  }
  return(npv/count);
}