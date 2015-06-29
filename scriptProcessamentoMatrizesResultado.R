precisaoMedia = 0
for(i in 1:7){
  precisaoMedia = precisaoMedia + precisaoMatrizes(listaRespondenteSurveyFinal[[8]], listaRespondenteSurveyFinal[[i]])
}

precisaoMedia = precisaoMedia/7



require(matrixcalc)

listaSurveyRespostasEditais = vector("list", 9);
listaSurveyRespostasOWASP = vector("list", 9);
for(i in 1:length(listaSurveyRespostasEditais)){
  listaSurveyRespostasEditais[[i]] = listaRespondenteSurveyFinal[[i]][indicesEditais,];
  listaSurveyRespostasOWASP[[i]] = listaRespondenteSurveyFinal[[i]][indicesOWASP,];
}


matrizResultadoCossenoEditais = matrix(rep(0, 81), nrow=9, ncol=9);
matrizResultadoCossenoOWASP = matrix(rep(0, 81), nrow=9, ncol=9);
matrizResultadoPearsonEditais = matrix(rep(0, 81), nrow=9, ncol=9);
matrizResultadoPearsonOWASP = matrix(rep(0, 81), nrow=9, ncol=9);
matrizResultadoPrecisaoEditais = matrix(rep(0, 81), nrow=9, ncol=9);
matrizResultadoPrecisaoOWASP = matrix(rep(0, 81), nrow=9, ncol=9);
matrizResultadoHammingEditais = matrix(rep(0, 81), nrow=9, ncol=9);
matrizResultadoHammingOWASP = matrix(rep(0, 81), nrow=9, ncol=9);
matrizResultadoNPVEditais = matrix(rep(0, 81), nrow=9, ncol=9);
matrizResultadoNPVOWASP = matrix(rep(0, 81), nrow=9, ncol=9);
matrizResultadoRecallEditais = matrix(rep(0, 81), nrow=9, ncol=9);
matrizResultadoRecallOWASP = matrix(rep(0, 81), nrow=9, ncol=9);

for(i in 1:9){
  for(j in 1:9){
    matrizResultadoCossenoEditais[i,j] = cosineFrobenius(listaSurveyRespostasEditais[[i]], listaSurveyRespostasEditais[[j]]);
    matrizResultadoCossenoOWASP[i,j] = cosineFrobenius(listaSurveyRespostasOWASP[[i]], listaSurveyRespostasOWASP[[j]]);
    matrizResultadoPearsonEditais[i,j] = pearsonFrobenius(listaSurveyRespostasEditais[[i]], listaSurveyRespostasEditais[[j]], calculaMatrizCentro(listaSurveyRespostasEditais));
    matrizResultadoPearsonOWASP[i,j] = pearsonFrobenius(listaSurveyRespostasOWASP[[i]], listaSurveyRespostasOWASP[[j]], calculaMatrizCentro(listaSurveyRespostasOWASP));
    matrizResultadoPrecisaoEditais[i,j] = precisaoMatrizes(listaSurveyRespostasEditais[[i]], listaSurveyRespostasEditais[[j]]);
    matrizResultadoPrecisaoOWASP[i,j] = precisaoMatrizes(listaSurveyRespostasOWASP[[i]], listaSurveyRespostasOWASP[[j]]);
    matrizResultadoHammingEditais[i,j] = hammingLossMatrizes(listaSurveyRespostasEditais[[i]], listaSurveyRespostasEditais[[j]]);
    matrizResultadoHammingOWASP[i,j] = hammingLossMatrizes(listaSurveyRespostasOWASP[[i]], listaSurveyRespostasOWASP[[j]]);
    matrizResultadoNPVEditais[i,j] = npvMatrizes(listaSurveyRespostasEditais[[i]], listaSurveyRespostasEditais[[j]]);
    matrizResultadoNPVOWASP[i,j] = npvMatrizes(listaSurveyRespostasOWASP[[i]], listaSurveyRespostasOWASP[[j]]);
    matrizResultadoRecallEditais[i,j] = recallMatrizes(listaSurveyRespostasEditais[[i]], listaSurveyRespostasEditais[[j]]);
    matrizResultadoRecallOWASP[i,j] = recallMatrizes(listaSurveyRespostasOWASP[[i]], listaSurveyRespostasOWASP[[j]]);
  }
  
}