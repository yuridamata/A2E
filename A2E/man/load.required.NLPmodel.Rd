\name{load.required.NLPmodel}
\alias{load.required.NLPmodel}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Função para carregar os modelos de dados para processamento de linguagem natural (openNLP) de um idioma específico.
}
\description{
Esta função tenta carregar o modelo de dados de um idioma dado. Caso não haja, tenta instalar o pacote a partir do código fonte de Datacube (http://datacube.wu.ac.at). A instalação pode exigir privilégios de administrador da máquina.
}
\usage{
load.required.NLPmodel(language, version = "1.5-2")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{language}{
O código do idioma desejado. Em 27/09/2016 as opções disponíveis eram `da', `de', `en', `es', `it', `nl', `pt' e `sv'.
}
  \item{version}{
A versão do modelo desejado. Em 27/09/2016 as opções disponíveis eram `1.5-1' e `1.5-2'.}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Não há valores de retorno.
}
\references{
https://CRAN.R-project.org/package=openNLP
http://datacube.wu.ac.at
}
\author{
Guilherme N. Ramos <gnramos@unb.br>
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
load.required.NLPmodel('pt')
load.required.NLPmodel('it', '1.5-1')
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
