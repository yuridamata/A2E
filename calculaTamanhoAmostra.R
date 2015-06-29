calculoTamanhoAmostra = function (Z, B, var, N){
  D = (B/Z)^2;
  return(ceiling(1/(1/N+D/var)))
}