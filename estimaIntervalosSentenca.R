estimaIntervalosSentenca = function(sentencasClassificadas, listaSentencas, matrizResultados){

      #sentencasClassificadas = classificacaoSentencasOWASP;
      #listaSentencas = listaNomes;
      #matrizResultados = matrizResultadoEditais_Conceitos;
      
      
      
      #vetorResultado = vector(mode="numeric", length=3);
      vetorResultado = as.numeric();
      nomes = as.integer();
      labels = c("A10", "A1", "A2", "A3", "A4", "A6", "A7", "A8", "buffer" )
      count=1;
      for(i in 1:ncol(sentencasClassificadas)){
        #i=6;
        auxSentenca = subset(sentencasClassificadas, colnames(sentencasClassificadas)[i]!="NA")[i];
        auxVetor = unlist(listaSentencas[[i]]);
        auxMatriz = matrizResultados[auxVetor[which(auxSentenca==1)],i];
      
        if(length(auxMatriz)>1){
            nomes = c(nomes, i);
            auxMatriz = as.numeric(auxMatriz);
     
              aux = c(length(auxMatriz), estimaIntervalo(0.95, auxMatriz));
              vetorResultado = rbind(vetorResultado, aux); 
            
        }else if(i==1){
          s= paste("A coluna", i, "retornou apenas um verdadeiro positivo");
          print(s);
        }
      }
      
      colnames(vetorResultado) = c("nº TP", "limiteInferior", "media", "limiteSuperior");
      rownames(vetorResultado) = labels[nomes];
      return(vetorResultado);

}