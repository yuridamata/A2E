require(nortest)

listaNomes = vector("list", 0);
matrizEstatisticasPopulacao = as.numeric();
matrizValidacaoFiltrada = filtragemResultadosSCUT(matrizValidacaoEditais, limiarCUT_semPR);
aux = apply(matrizValidacaoFiltrada, 2, function(x){sum(x)});
aux = sapply(aux, function(x) {calculoTamanhoAmostra(1.96, 0.05, 0.057392, x)});


for(i in 1:ncol(matrizValidacaoFiltrada)){
  auxLinhas = rownames(matrizEditaisFiltradaSCUT_SemPR)[matrizEditaisFiltradaSCUT_SemPR[,i]==1];
 
  listaNomes = append(listaNomes, list(sample(auxLinhas, aux[i])));
  
  auxVetor = matrizResultadoEditais_Conceitos[auxLinhas,i];
  auxVetor = as.numeric(auxVetor);

  if(length(auxVetor)<=5000 && length(auxVetor)>=3 ){
    if(shapiro.test(auxVetor)[[2]]>=0.01){
      print("coluna i nao e normal");
    }
  }else if(length(auxVetor)>=7){
      if(ad.test(auxVetor)[[2]]>=0.01){
        print("coluna i nao e normal");
      }
  }
  
  auxEstatisticas = c(mean(auxVetor), var(auxVetor), quantile(auxVetor));
  if(i==1){
    matrizEstatisticasPopulacao = auxEstatisticas;
    names(matrizEstatisticasPopulacao)[1] = "mean";
    names(matrizEstatisticasPopulacao)[2] = "var";    
  }else{
    matrizEstatisticasPopulacao = rbind(matrizEstatisticasPopulacao, auxEstatisticas);
  } 
}