str_strip <- function(x) {
  loc <- lapply(strsplit(x, "\n")[[1]], function(x) {
    gsub("^#'\\s*", "", x)
  })
  Filter(function(x) nchar(x) > 0, loc)
}

#' @export
run_roxygen_examples <- function() {
  id <- rstudioapi::getActiveDocumentContext()
  sel <- rstudioapi::primary_selection(id)
  if (sel$text == "") return()
  lapply(str_strip(sel$text), function(x) {
    rstudioapi::sendToConsole(x)
  })
}



