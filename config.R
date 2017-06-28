caminhoCorpusMWE = "C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - A2E/Codigo Novo/conceitosMWE"
caminhoConceitosMWE = "C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - A2E/Codigo Novo/corpusMWE/"
caminhoCorpusMWELivros = "C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - A2E/Codigo Novo/corpusMWE"

caminhoCorpusFolhaSP = "C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - FolhaSP/A2E - Python/"
caminhoValidacaoCruzada = "C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - FolhaSP/A2E - Python/baseConceitos/veiValidacaoCruzada"

caminhoValidacaoCruzada = "C:/Users/Andrew Yuri/Andrew Yuri da Silva Mata/UNB/Estudos em Inteligência Artificial/Minimum Working Example - FolhaSP/A2E - Python/baseConceitos/"

listaConceitosFolhaSP = c('agr','com','eco','opi','pol','soc','vei')
arrayTiposLimiares = c('max','min','media','mediana')

# Colunas =      Máx            Min        Média      Mediana
VC_agr		= c(0.174772200,	0.05395588,	0.12220299,	0.16282370)
VC_cltsoc = c(0.434015800,	0.18696830,	0.29231868,	0.20656250)
VC_com 		= c(0.276304900,	0.25121910,	0.25958280,	0.25641610)
VC_eco 		= c(0.047267790,	0.02426439,	0.04199198,	0.04606664)
VC_opi 		= c(0.276996500,	0.26953930,	0.27205178,	0.27171560)
VC_pol 		= c(0.098405940,	0.04513758,	0.08637611,	0.09559907)
VC_soc 		= c(0.319554400,	0.25808760,	0.29328450,	0.30682830)
VC_vei 		= c(0.450999400,	0.17509290,	0.30028618,	0.29006970)

matrizVC <- cbind(VC_agr,VC_com,VC_eco,VC_opi,VC_pol,VC_soc,VC_vei)
matrizLimiares <- t(matrizVC)