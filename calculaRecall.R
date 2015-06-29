calculaRecall = function(matrizResultados, matrizGabarito){
  
  #validacoes quanto às matrizes
  if(!is.matrix(matrizResultados) || !is.matrix(matrizGabarito)) {
    print("funcao necessita receber duas matrizes para serem comparadas")
    return();}
  
  if((dim(matrizResultados)[1]!=dim(matrizGabarito)[1])) {
    print("dimensoes das matrizes parametros necessitam serem iguais")
    return();
  }
  
  vetorRecall = vector(mode="numeric", length=(dim(matrizResultados)[1]+1));
  totalAvaliacoes=0;
  
  for(i in 1:dim(matrizResultados)[1]){
    
    numeroRotulosInterseccao=0;
    numeroRotulosGabarito= sum(matrizGabarito[i,]!="NULO");
    
    for(j in 1:dim(matrizResultados)[2]){
      if(matrizResultados[i,1]=="NULO"){
        if(numeroRotulosGabarito==0) vetorPrecisao[i]=0;
        break
      }
      
      if(matrizResultados[i,j] %in% matrizGabarito[i,]) numeroRotulosInterseccao=numeroRotulosInterseccao+1;
    }
    
    if(numeroRotulosGabarito>0){
      vetorRecall[i]=numeroRotulosInterseccao/numeroRotulosGabarito;
      totalAvaliacoes=totalAvaliacoes+1;
    }
  }
  
  vetorRecall[length(vetorRecall)]=sum(vetorRecall)/totalAvaliacoes;
  
  return(vetorRecall[]);
}