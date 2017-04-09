calculaThresholdSCUT = function (matrizResultado, matrizGabarito, beta){
  
  #verificação se as matriz submetidas à função podem ser manipuladas 
  if (ncol(matrizResultado)!=ncol(matrizGabarito)){
    print("Matrizes têm diferentes números de colunas")
    return();
  }
  
  vetorThreshold = vector(mode="numeric", length=ncol(matrizResultado));
  truePositives =  vector(mode="numeric", length=ncol(matrizResultado));
  falsePositives = vector(mode="numeric", length=ncol(matrizResultado));
  falseNegatives = vector(mode="numeric", length=ncol(matrizResultado));
  
  FMeasure = 0;
  count=1;
  
  while(TRUE){
    
    novoFMeasure = 0;
    #print(count);
  
    for (i in 1:ncol(matrizResultado)){
      
      gabaritosIteracao = rownames(matrizGabarito)[matrizGabarito[,i]==TRUE];
      naoGabaritosIteracao = rownames(matrizGabarito)[matrizGabarito[,i]==FALSE];
      
      scoresOrdenados = unique(sort(matrizResultado[,i]));
      
      valorInicialThreshold = max(scoresOrdenados[1], vetorThreshold[i]);
      
      for(k in match(valorInicialThreshold, scoresOrdenados):length(scoresOrdenados)){
        
        auxThreshold = scoresOrdenados[k];
        
        rotulosAbaixoThreshold = rownames(matrizResultado)[matrizResultado[,i] < auxThreshold];
        rotulosAcimaThreshold = rownames(matrizResultado)[matrizResultado[,i] >= auxThreshold];
        
        truePositiveOriginal = truePositives[i];
        falsePositiveOriginal = falsePositives[i];
        falseNegativesOriginal = falseNegatives[i];
        
        truePositives[i] = length(intersect(gabaritosIteracao, rotulosAcimaThreshold));
        falsePositives[i] = length(intersect(naoGabaritosIteracao, rotulosAcimaThreshold));
        falseNegatives[i] = length(intersect(gabaritosIteracao, rotulosAbaixoThreshold));
        
        auxFMeasure = (1+beta^2)/((1+beta^2)+(sum(falsePositives)+(beta^2)*sum(falseNegatives))/sum(truePositives));
        
        if((auxFMeasure >= novoFMeasure)||(count==1&&k==1)){
          novoFMeasure=auxFMeasure;
          vetorThreshold[i]=auxThreshold;
        } 
        else{
          truePositives[i] = truePositiveOriginal;
          falsePositives[i] = falsePositiveOriginal;
          falseNegatives[i] = falseNegativesOriginal;
        }
        
        ##pois o valor inicial nao corresponde à realidade
        #if(count==1&&k==1) vetorThreshold[i]=auxThreshold;
      }    
  }
    if(novoFMeasure <= FMeasure){
      #for(i in 1:ncol(matrizResultado))
        #print(truePositives[i])
        #print(truePositives[i]/(truePositives[i]+falsePositives[i]));
      #print(sum(truePositives))
      
      print(FMeasure);
      return(vetorThreshold);
    }else{
      FMeasure = novoFMeasure;
      count=count+1;
    }
  
  }
}