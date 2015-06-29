k=2;
matrizCossenoRespostas = matrix(rep(0,100), 10, 10);
matrizPearsonRespostas = matrix(rep(0,100), 10, 10);
for(i in 1:length(listaRespostasSurvey)){
  if(i==7) i=i+1;
  
  for(j in k:length(listaRespostasSurvey)){
    if(j==7) j=j+1;
    matrizCossenoRespostas[i,j] = cosineMatrix(listaRespostasSurvey[[i]], listaRespostasSurvey[[j]]);
    matrizPearsonRespostas[i,j] = pearsonMatrix(listaRespostasSurvey[[i]], listaRespostasSurvey[[j]]);
  }
  if(k<10){
    k=k+1;
  }else{
    k=10;
  }
 
}