estratificadorConjuntoMultilabel = function (matrizGabarito, numeroConjuntos, vetorProporcao){
  
  #aleatorizando as linhas da tabela
  matrizGabarito = matrizGabarito[sample(nrow(matrizGabarito)),];
  
  #outras validacoes ainda seriam necessarias
  #if(nrow(matrizGabarito)!=nrow(matrizGabarito) || length(vetorProporcao)!=numeroConjunto) return();
  
  vetorNomesLinhasConceitos = vector("list",0);
  matrizLabelsSubconjunto = matrix(data = rep(0, each=ncol(matrizGabarito)*numeroConjuntos), nrow=ncol(matrizGabarito), ncol=numeroConjuntos);
  subconjuntos = vector("list", 0);
  
  #composicao da estrutura dos subconjuntos
  for(i in 1:numeroConjuntos){
    aux = as.character();
    subconjuntos = append(subconjuntos, list(aux));
  }
  
  #calculo do numero desejado de exemplos em cada subconjunto
  tamanhoSubconjuntos = vector(mode="integer", length=numeroConjuntos)
  for(i in 1:length(tamanhoSubconjuntos)){
    tamanhoSubconjuntos[i] = floor(nrow(matrizGabarito)*vetorProporcao[i]);
  }  
  
  #calculo do numero de exemplos em cada label
  for(i in 1:ncol(matrizGabarito)){
    auxVetorNome= rownames(matrizGabarito)[matrizGabarito[,i]==1];
    vetorNomesLinhasConceitos = append(vetorNomesLinhasConceitos, list(auxVetorNome));
    for(j in 1:length(vetorProporcao)){
      matrizLabelsSubconjunto[i,j] = floor(length(vetorNomesLinhasConceitos[[i]])*vetorProporcao[j]);
    }
  }

  
  
  contador = nrow(matrizGabarito);
  while(contador>0){
    print("nova iteracao")
    for(k in 1:length(subconjuntos)){
      print(length(subconjuntos[[k]]))
    }
    #tomada do vetor de nomes com menor numero de elementos
    aux = sapply(vetorNomesLinhasConceitos, length);
    aux1 = unique(sort(aux));
    minimo = aux1[1];
    if(minimo==0 && length(aux1)==1 ){
      return(subconjuntos);
    }else if(length(aux1)!=1){
      minimo = aux1[2];
    }
    
    indiceConceitoMenor = match(minimo, aux);
    auxVetorLinhasConceitos = vetorNomesLinhasConceitos[[indiceConceitoMenor]];
    
    for(i in 1:length(auxVetorLinhasConceitos)){
      valor = max(matrizLabelsSubconjunto[indiceConceitoMenor,]);
      indicesSubconjuntosCandidatos = which(matrizLabelsSubconjunto[indiceConceitoMenor,] %in% c(valor));
      auxIndice = indicesSubconjuntosCandidatos;
      

      elementoInteracao = auxVetorLinhasConceitos[[i]];
 
      if(length(auxIndice)==1){
        subconjuntos[[auxIndice]] = c(subconjuntos[[auxIndice]], elementoInteracao);
        
      }else{
        auxSomaTotal = apply(matrizLabelsSubconjunto, 2, function(x){sum(x)});
        auxSoma = auxSomaTotal[auxIndice]
        if(length(which(auxSoma %in% max(auxSoma)))==1){
          #print("A")
          auxIndice = match(max(auxSoma), auxSomaTotal);
          subconjuntos[[auxIndice]] = c(subconjuntos[[auxIndice]], elementoInteracao);
        }else{
          #print("B")
          auxIndice = sample(which(auxSomaTotal %in% max(auxSoma)), 1);
          subconjuntos[[auxIndice]] = c(subconjuntos[[auxIndice]], elementoInteracao);
        }
      }
      contador = contador - 1;
      for(j in 1:length(vetorNomesLinhasConceitos)){
          #print(j)
         if(elementoInteracao %in% vetorNomesLinhasConceitos[[j]]){
           #print("F1")
           vetorNomesLinhasConceitos[[j]] = vetorNomesLinhasConceitos[[j]][vetorNomesLinhasConceitos[[j]]!=elementoInteracao];
           #print("F2")
           matrizLabelsSubconjunto[j, auxIndice] = matrizLabelsSubconjunto[j, auxIndice] - 1;
           #print("F3")
         }
      }
    }
  }
  return(subconjuntos);
}