# requiRements
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


#' @title Install the packages provided to this function
#' @description Install the packages provided to this function
#' @param packages (Optional, String, also as vector)
#'   The actual packages to install.
#' @param path_to_requirements (Optional, String) The path (including filename
#'   and type ending) to a text file containing all the packages to install.
#'
#' @return (Boolean) `TRUE` if all packages are successfully installed,
#'  `FALSE` otherwise.
#' @export
#'
install <- function(packages = NULL,
                    path_to_requirements = NULL) {
  packages_file <- ""
  if (!is.null(path_to_requirements)) {
    con <- file(path_to_requirements)
    packages_file <- readLines(con = con, warn = FALSE)
    close(con)
  }

  if (length(packages) == 1) {
    ## Make a vector out of the `packages` string:
    packages <- strsplit(packages, split = "\n")[[1]]
  }

  ## Combine the packages from the file with the packages from the parameter:
  packages <- c(packages, packages_file)

  ## Remove "uncommented" lines (the ones starting with a '#'):
  packages <- packages[!grepl(pattern = "^(#)", x = packages)]

  ## Remove empty elements:
  packages <- packages[nchar(packages) > 0]

  ## Remove duplicates:
  packages <- unique(packages)

  ## Make sure the remotes package is installed,
  ## which is needed to install all other packages:
  if (!"remotes" %in% rownames(utils::installed.packages())) {
    utils::install.packages("remotes")
  }

  ## And install all of them:
  for (package in packages) {
    cat(paste0(
      "\n\n## Starting to install '",
      package,
      "' with all dependencies:\n"
    ))
    if (grepl(pattern = "/", x = package)) {
      if (grepl(pattern = "@", x = package)) {
        ## Extract the branch:
        branch <-
          gsub(pattern = "^(.*)@",
               replacement = "",
               x = package)
        remotes::install_github(repo = package, ref = branch)
      } else {
        ## Install the master/main branch:
        remotes::install_github(repo = package)
      }
    } else {
      remotes::update_packages(
        packages = package,
        build_manual = FALSE,
        quiet = TRUE,
        upgrade = "always"
      )
    }
  }
}
