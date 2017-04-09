# Loads required NLP models, installs them if unavailable.
#
# Installation of new packages requires root privileges.

# Loads the NLP models of the given language from Datacube (http://datacube.wu.ac.at)
load.required.NLPmodel <- function(language, version='1.5-2') {
  model <- paste('openNLPmodels.', language, sep='')
  if (!require(model, character.only=TRUE)) {
    gz.file <- paste('openNLPmodels.', language, '_', version, '.tar.gz', sep='')
    src.url <- 'http://datacube.wu.ac.at/src/contrib/'
    pkg.src <- paste(src.url, gz.file, sep='')
    ignore <- install.packages(pkg.src, repos=NULL)
  }
}