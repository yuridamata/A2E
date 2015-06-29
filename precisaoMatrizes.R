precisaoMatrizes = function(matrizResposta, matrizMedida){
  precisao = 0;
  count = 0;
  for(i in 1:nrow(matrizMedida)){
    if(any(matrizMedida[i,]) && any(matrizResposta[i,1:5])){
       acertosSentenca = as.numeric(matrizResposta[i,] & matrizMedida[i,]);
       precisao = precisao + sum(acertosSentenca==1)/sum(matrizResposta[i,]==1);
       count = count + 1;
    }
  }
  return(precisao/count);
}