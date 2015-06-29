require(Matrix)

extraiFeatures = function(matrizConceitos, modo){
  
  palavrasEscolhidas = character();
  
  for(i in 1:ncol(matrizConceitos)){
    
    aux = matrizConceitos[,i];
    
    if(is.null(rownames(aux))){
      dim(aux) = c(nrow(matrizConceitos), 1);
      rownames(aux) = rownames(matrizConceitos);
    }
    
    aux2 = sort(aux[,1], decreasing=TRUE);
    
    if(modo=="absoluto"){
      count=100
    } 
    
    if(modo=="relativo"){
      count = floor(0.11*nnzero(aux2))
    }
    
    
      palavrasEscolhidas = c(palavrasEscolhidas, names(aux2)[1:count]);
    
  }
  palavrasEscolhidas = unique(palavrasEscolhidas);
  return(palavrasEscolhidas);
}