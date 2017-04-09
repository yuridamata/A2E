calculaPrecisao = function(matrizResultados, matrizGabarito){
  
  #validacoes quanto às matrizes
  if(!is.matrix(matrizResultados) || !is.matrix(matrizGabarito)) {
    print("funcao necessita receber duas matrizes para serem comparadas")
    return();}
  
  if((dim(matrizResultados)[1]!=dim(matrizGabarito)[1])) {
    print("dimensoes das matrizes parametros necessitam serem iguais")
    return();
  }
  
  vetorPrecisao = vector(mode="numeric", length=(dim(matrizResultados)[1]+1));
  totalAvaliacoes=0;
  
  for(i in 1:dim(matrizResultados)[1]){
    
    numeroRotulosInterseccao=0;
    numeroRotulosPrevistos=1;
    
    for(j in 1:dim(matrizResultados)[2]){
      if(matrizResultados[i,j]=="NULO"){
        vetorPrecisao[i]=numeroRotulosInterseccao/numeroRotulosPrevistos;
        break
      }
      numeroRotulosPrevistos = numeroRotulosPrevistos +1;
      
      if(matrizResultados[i,j] %in% matrizGabarito[i,]) numeroRotulosInterseccao=numeroRotulosInterseccao+1;
      if(i==105){
        print(numeroRotulosPrevistos);
        print(numeroRotulosInterseccao);
      }
    }
    if(numeroRotulosPrevistos!=1){
      vetorPrecisao[i]=numeroRotulosInterseccao/(numeroRotulosPrevistos-1);
      totalAvaliacoes=totalAvaliacoes+1;
    }
  }
  
  vetorPrecisao[length(vetorPrecisao)]=sum(vetorPrecisao)/totalAvaliacoes;
  
  return(vetorPrecisao[]);
}