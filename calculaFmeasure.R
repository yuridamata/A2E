calculaFmeasure = function(precisao, recall, beta){
  f_measure= ((1+beta^2)(precisao*recall))/((beta^2)*precisao+recall);
  return(f_measure);
}