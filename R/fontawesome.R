##' search fontawesome
##'
##'
##' @title search_fontawesome
##' @param str string text
##' @param approximate logical
##' @return corresponding aliases
##' @export
##' @author ygc
search_fontawesome <- function(str, approximate=FALSE) {
    efproto$search(str=str, type='aliases', approximate=approximate, font_data=fontawesome_data)
}


##' random fontawesome
##'
##'
##' @title sample_fontawesome
##' @param size a non-negative integer giving the number of items to choose
##' @param replace Should sampling be with replacement?
##' @return random fontawesome
##' @export
##' @examples
##' sample_fontawesome(3)
##' @author guangchuang yu
sample_fontawesome <- function(size, replace=FALSE) {
    sample(unlist(fontawesome_data$aliases), size, replace)
}

##' convert fontawesome aliases to text
##'
##'
##' @title fontawesome
##' @param aliases aliases
##' @return text
##' @export
##' @examples
##' fontawesome('fa-twitter')
##' @author ygc
fontawesome <- function(aliases) {
    mapper_(aliases, fontawesome_data)
}

##' load fontawesome
##'
##'
##' @title load.fontawesome
##' @param font font
##' @return NULL
##' @export
##' @author ygc
load.fontawesome <- function(font = "fa-solid-900.ttf") {
    efproto$load_font(font=font, type='fontawesome')
}


##' @importFrom utils read.delim
get_fontawesome_data <- function() {
    ## copy font table from:
    ## https://fontawesome.com/v5/cheatsheet/free/brands
    y <- read.delim("inst/fonts/v5_cheatsheet.txt", stringsAsFactors=F)
    colnames(y) <- c("fa", "aliases", "html")

    y$aliases <- paste0("fa-", y$aliases)
    y$html <- paste0("&#x", y$html, ";")
  
    return(y)
}

# fontawesome_data <- get_fontawesome_data()
# usethis::use_data(fontawesome_data, internal = TRUE, overwrite = T)

## example
# library(emojifont)
# load.fontawesome()
# set.seed(123)
# d = data.frame(x=rnorm(20),
#                y=rnorm(20),
#                z=sample(fontawesome(c('fa-route','fa-flag', 'fa-arrow-trend-up')), replace=T, 10))
# 
# library(ggplot2)
# ggplot(d, aes(x, y, color=z)) + geom_text(aes(label=z), family='fa-solid-900', size=8)
