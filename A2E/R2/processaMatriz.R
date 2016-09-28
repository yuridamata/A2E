require(bigmemory)
require(bigalgebra)
require(bigtabulate)
require(biganalytics)
require(tm)

processaMatriz = function(matrizGigante){
  if(!is.big.matrix(matrizGigante)){
    print("Argumento não é do tipo big.matrix")
    return();
  } else{
    colunasProcessadas = ncol(matrizGigante);
    if(colunasProcessadas>31645000){
      print("linha grande demais para ser processada em um computador de 8GB")
      return();
    } else{
      linhasProcessadas = floor(31645000/colunasProcessadas);
      aux = list();
      for (i in 1:ceiling(nrow(matrizGigante)/linhasProcessadas)){
        limiteInferior = 1+(i-1)*linhasProcessadas;
        limiteSuperior = min(i*linhasProcessadas, nrow(matrizGigante));
        matrizAuxiliar = as.matrix(sub.big.matrix(matrizGigante, limiteInferior, limiteSuperior, 1, colunasProcessadas, "/home/rnpeclat/Desktop/processamentoEditais/"));
       
        
        #filtragem das linhas nulas
        matrizAuxiliar = matrizAuxiliar[rowSums(matrizAuxiliar[,-1]>0)!=0,];
        
        #guarda os nomes das linhas e das colunas
        auxNamesLinha = rownames(matrizAuxiliar);
        auxNamesColuna = colnames(matrizAuxiliar);
        
        #normalização das linhas
        matrizAuxiliar = t(apply(matrizAuxiliar, 1, function(x) x*((sqrt(t(x)%*%x))^(-1))));
        
        #carga da matriz de conceitos normalizada
        #load("/media/usb0/rodrigo/MPCA/projetoFinal/experimentos/experimentosConceitosOriginais/semFeature/matrizConceitos_Normalizada.RData");
        
        #recuperacao do nome das linhas perdidas durante a normalizacao
        rownames(matrizAuxiliar) = auxNamesLinha;
        colnames(matrizAuxiliar) = auxNamesColuna;
        
        #multiplicação das matrizes
        matrizAuxiliar = matrizAuxiliar%*%matrizConceitos_Normalizada[colnames(matrizAuxiliar),];
        
        #chamando o garbage collector
        #rm(matrizConceitos_Normalizada);
        gc();
        
        #adicao das colunas classificatórias
        matrizAuxiliar2 = matrizAuxiliar;
        for (j in 1:3){
          classificacao = c(1:nrow(matrizAuxiliar));
          matrizAuxiliar2 = cbind(matrizAuxiliar2, mapply(function(x) names(sort(matrizAuxiliar[x,], decreasing=TRUE)[j]), classificacao));
        }
       
        #exclusao de objeto contendo matrix sem as colunas classificatorias
        rm(matrizAuxiliar);
        
        #formacao da matriz final
        if(i==1){
          aux = matrizAuxiliar2;
        } else{
          aux = rbind(aux, matrizAuxiliar2);
        }
        
        #limpeza dos objetos
        rm(matrizAuxiliar2);
        gc();
      }
      
      "retorno da matriz"
      return(aux);
      
    }
    
  }
}