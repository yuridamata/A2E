\name{get.text.content}
\alias{get.text.content}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Função para ler um arquivo PDF e extrair seu conteúdo em formato de texto simples.
}
\description{
Esta função lê um arquivo PDF e extrai seu conteúdo, que é retornado em formato de texto simples.
}
\usage{
get.text.content(pdf.uri, language = "pt")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pdf.uri}{
O identificador do arquivo PDF, que deve conter o caminho completo, incluindo o nome do arquivo.
}
  \item{language}{
O código do idioma desejado.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Retorna um string contendo o conteúdo textual do arquivo dado.
}
\references{
https://CRAN.R-project.org/package=tm
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
txt <- get.text.content('/tmp/edict.pdf')
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
