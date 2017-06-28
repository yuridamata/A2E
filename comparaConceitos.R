#Script que mede a similaridade entre todos os conceitos

#Compara todas os conceitos entre si e apresenta as similaridade
for (i in colnames(DF_Conceitos)){
  
  if(substr(as.String(i),7,7) == "0"){
    conceito1 <- substr(as.String(i),5,7)
  }else{
    conceito1 <- substr(as.String(i),5,6)
  }
  
  for (j in colnames(DF_Conceitos)){
    if(substr(as.String(j),7,7) == "0"){
      conceito2 <- substr(as.String(j),5,7)
    }else{
      conceito2 <- substr(as.String(j),5,6)
    }
    cat("Similaridade cosseno entre ",conceito1,"e",conceito2,"é",sim(simCosseno,DF_Conceitos[,i],DF_Conceitos[,j]),"\n")
    
  }
}

#Script para extrair os nomes dos arquivos que contém texto e conceitos
V_nomeArq <- colnames(DF_Corpus)
V_nomeArqTXT <- NULL
V_nomeArqCPT <- NULL


for(i in nomeArq){
  if(substr(i,1,3) == "CPT"){
    V_nomeArqCPT <- c(nomeArqCPT,i)
  }else{
    V_nomeArqTXT <- c(nomeArqTXT,i)
  }
}

#Script que irá comparar os conceitos aos textos sem features
for(texto in V_nomeArqTXT){
  for(conceito in V_nomeArqCPT){
    cat(texto," - ",conceito, " - ",simCosseno(DF_Corpus[,texto],DF_Corpus[,conceito]),"\n")  
  }
}

#Script que irá comparar os conceitos aos textos com features
for(texto in V_nomeArqTXT){
  for(conceito in V_nomeArqCPT){
    cat(texto," - ",conceito, " - ",simCosseno(DF_Corpus[features,texto],DF_Corpus[features,conceito]),"\n")  
  }
}












