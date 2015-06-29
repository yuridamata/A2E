calculaThresholdMacroSCUT = function (matrizResultado, matrizGabarito, beta){
  
  #verificação se as matriz submetidas à função podem ser manipuladas 
  if (ncol(matrizResultado)!=ncol(matrizGabarito)){
    print("Matrizes têm diferentes números de colunas")
    return();
  }
  
  class(matrizResultado) = "numeric";
  vetorThreshold = vector(mode="numeric", length=ncol(matrizResultado));
  FMeasure =  vector(mode="numeric", length=ncol(matrizResultado));
  indefinicao = 0;
  
  
  for(i in 1:ncol(matrizResultado)){

    if(sum(matrizGabarito[,i])==0){
      indefinicao = indefinicao+1;
      break;
    } 
    
    gabaritosIteracao = rownames(matrizGabarito)[matrizGabarito[,i]==TRUE];
    naoGabaritosIteracao = rownames(matrizGabarito)[matrizGabarito[,i]==FALSE];
    
    
    scoresOrdenados = unique(sort(matrizResultado[,i]));
    FMeasure[i] = 0;
    
    for(k in 1:length(scoresOrdenados)){
        
        auxThreshold = scoresOrdenados[k];
        
        rotulosAbaixoThreshold = rownames(matrizResultado)[matrizResultado[,i] < auxThreshold];
        rotulosAcimaThreshold = rownames(matrizResultado)[matrizResultado[,i] >= auxThreshold];
          
        truePositives= length(intersect(gabaritosIteracao, rotulosAcimaThreshold));
        falsePositives = length(intersect(naoGabaritosIteracao, rotulosAcimaThreshold));
        falseNegatives = length(intersect(gabaritosIteracao, rotulosAbaixoThreshold));
        
        #calculo da precisao
        if(truePositives!=0 && falsePositives!=0){ 
          precisao = truePositives/(truePositives+falsePositives);
        } else precisao = 0;
        
        #calculo do recall
        if(truePositives!=0 && falseNegatives!=0){
          recall =  truePositives/(truePositives+falseNegatives);
        } else recall = 0;
        
        #calculo do FMeasure
        if(precisao!=0 && recall!=0){
          auxFMeasure = (1+beta^2)*(precisao*recall/((beta^2)*precisao+recall));
        } else auxFMeasure = 0;
        
        #if(is.nan(auxFMeasure)) break;
        
        #print("Segue sequencia");
        #print(k);
        #print(auxThreshold);
        #print(auxFMeasure);
        if(auxFMeasure >= FMeasure[i]){
          FMeasure[i] = auxFMeasure;
          vetorThreshold[i] = auxThreshold;
        }
    }
  }
  for(i in 1:ncol(matrizResultado)) print(FMeasure[i]);
  print("O valor do FMeasure �:")
  print(sum(FMeasure)/(length(FMeasure)-indefinicao));
  return(vetorThreshold);
}  