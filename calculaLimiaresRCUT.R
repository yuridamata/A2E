require(MASS);

calculaLimiaresRCUT = function(matrizResultado, vetorLimiaresIdeaisRCUT){
  
  if(nrow(matrizResultado)!=length(vetorLimiaresIdeaisRCUT)){
    return("parâmetros com número de linhas diferentes");
  }
  vetorAux = rep(c(1), each=nrow(matrizResultado));
  matrizAuxiliar = cbind(matrizResultado, vetorAux);
  pesosRCUT = ginv(t(matrizAuxiliar)%*%matrizAuxiliar)%*%t(matrizAuxiliar)%*%vetorLimiaresIdeaisRCUT;
  return(pesosRCUT);
}
