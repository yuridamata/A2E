limiares= list(A10RedirecionamentosInvalidos.txt = list(), 
                  A1injection.txt=list(), 
                  A2QuebraAutenticacaoAutorizacao.txt = list(),
                  A3XSS.txt = list(),
                  A4ReferenciaInsegura.txt = list(),
                  A5ConfiguracaoInadequada.txt = list(),
                  A6ExposicaoDadosSensiveis.txt = list(),
                  A7FaltaFuncaoControleAcesso.txt = list(),
                  A8CRSF.txt = list(),
                  A9UtilizacaoComponentesVulnerabilidadeConhecida.txt = list(),
                  Administrativo.txt = list(),
                  EngenhariaSoftware.txt = list()
                  )

for(i in 1:dim(resultado)[1]){
  for(j in 13:15){
    if(resultado[i,j] %in% resultado[i, 16:19])
      limiares[[resultado[i,j]]][length(limiares[[resultado[i,j]]])+1]=as.numeric(resultado[i, resultado[i,j]]);
  }
}


for(i in 1:length(limiares)){
  amostra = as.vector(limiares[[i]], mode="numeric");
  media = sum(amostra)/length(amostra);
  desvioPadrao = sqrt(var(amostra));
  erro = qt(0.975,df=(length(amostra)-1))*desvioPadrao/sqrt(length(amostra));
  
  intervaloInferior = media-erro;
  intervaloSuperior = media+erro;
  
  if(i==1){
    intervalos = matrix(c(media, intervaloInferior, intervaloSuperior), nrow=1, ncol=3);
    #rownames(intervalos) = names(limiares);
  }else{
    intervalos = rbind(intervalos, c(media, intervaloInferior, intervaloSuperior));
  }
  
}