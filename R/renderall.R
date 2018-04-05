#' @importFrom rstudioapi getActiveDocumentContext documentSave
#' @importFrom tools file_ext
#' @importFrom rmarkdown render
NULL

renderAll <- function() {
  active_doc <- rstudioapi::getActiveDocumentContext()
  file_path <- active_doc$path
  extension <- tools::file_ext(file_path)
  if (extension %in% c("Rmd", "rmd", "md")) {
    cat("Rendering all output formats...\n")
    rstudioapi::documentSave(id = active_doc$id)
    rmarkdown::render(file_path, output_format = "all")
  } else {
    cat("File extension does not correspond to a RMarkdown file.")
  }
}
