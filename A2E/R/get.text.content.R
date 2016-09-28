get.text.content <- function(pdf.uri, language='pt') {
  txt <- tm::readPDF(control=list(text = '-layout'))(elem=list(uri=pdf.uri),
                                                     language=language)

  return(txt$content)
}