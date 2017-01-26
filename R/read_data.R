##' internal method to load data
##'
##' This method loads a big dataset that takes a while to load 
##' @title internal_load_data
##' @return A data.frame
##' @author Thomas Rosendal
internal_load_data <- function() {
    Sys.sleep(5)
    df <- data.frame(x = seq(1, 100),
                     y = seq(1, 1000, by = 10))
}

##' Build the closure
##'
##' This returns a function with an environment that contains the
##' object x = NULL.
##' @title load_data_closure
##' @return A function
##' @author Thomas Rosendal
load_data_closure <- function() {
    x <- NULL
    function() {
        if(is.null(x)) {
            x <<- internal_load_data()
        }
        return(x)
    }
}

##' Exported method to load data
##'
##' This method loads a dataset only when it has not already been
##' loaded
##' @title load_data
##' @return A data.frame
##' @export
##' @author Thomas Rosendal
load_data <- load_data_closure()
