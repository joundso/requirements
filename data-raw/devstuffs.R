packagename <- "requiRements"

# remove existing description object
unlink("DESCRIPTION")

# Create a new description object
my_desc <- desc::description$new("!new")

# Set your package name
my_desc$set("Package", packagename)

# Set author names 2
# http://r-pkgs.had.co.nz/description.html
# Full list of roles: http://www.loc.gov/marc/relators/relaterm.html
my_desc$set_authors(c(
  person(
    "Jonathan M.",
    "Mang",
    role = c("aut", "cre"),
    email = "jonathan.mang@uk-erlangen.de",
    comment = c(ORCID = "0000-0003-0518-4710")
  ),
  person(
    "MIRACUM - Medical Informatics in Research and Care in University Medicine",
    role = c("fnd")
  ),
  person("Universitätsklinikum Erlangen", role = "cph")
))

# Remove some author fields
my_desc$del("Maintainer")
my_desc$del("LazyData")

# Set the version
my_desc$set_version("0.0.2")

# The title of your package
my_desc$set(Title = "Helper Package to Install Packages for R")

# The description of your package
my_desc$set(
  Description = paste0(
    "Helper function to install packages for R",
    " using an external 'requirements.txt' or a",
    " string containing diverse packages from",
    " several resources like Github or CRAN."
  )
)


# The date when description file has been created
my_desc$set("Date" = as.character(Sys.Date()))

# The date package language:
my_desc$set("Language" = "en-US")

# The urls
my_desc$set("URL", "https://github.com/joundso/requirements")
my_desc$set("BugReports",
            "https://github.com/joundso/requirements/issues")

# Vignette Builder
# my_desc$set("VignetteBuilder" = "knitr")

# License
my_desc$set("License", "GPL-3")

# System requirements (for CRAN to avoid Rpostgres-errors):
# my_desc$set("SystemRequirements",
#             "libpq >= 9.0: libpq-dev (deb) or postgresql-devel (rpm)")

# Save everyting
my_desc$write(file = "DESCRIPTION")

# License
#usethis::use_gpl3_license(name = "Universitätsklinikum Erlangen")


# add Imports and Depends
# Listing a package in either Depends or Imports ensures that it’s installed when needed
# Imports just loads the package, Depends attaches it
# Loading will load code, data and any DLLs; register S3 and S4 methods; and run the .onLoad() function.
##      After loading, the package is available in memory, but because it’s not in the search path,
##      you won’t be able to access its components without using ::.
##      Confusingly, :: will also load a package automatically if it isn’t already loaded.
##      It’s rare to load a package explicitly, but you can do so with requireNamespace() or loadNamespace().
# Attaching puts the package in the search path. You can’t attach a package without first loading it,
##      so both library() or require() load then attach the package.
##      You can see the currently attached packages with search().

# Depends
usethis::use_package("R", min_version = "4.1.0", type = "Depends")

## Imports
# usethis::use_package("utils", type = "Imports")
usethis::use_package("remotes", type = "Imports")
# usethis::use_package("httr", type = "Imports")
# usethis::use_package("jsonlite", type = "Imports")
# usethis::use_package("rapportools", type = "Imports")

# Suggests
usethis::use_package("testthat", type = "Suggests")
usethis::use_package("lintr", type = "Suggests")


## buildignore
usethis::use_build_ignore("LICENSE.md")
usethis::use_build_ignore(".gitlab-ci.yml")
usethis::use_build_ignore("data-raw")
usethis::use_build_ignore(".vscode")
usethis::use_build_ignore(".lintr")
usethis::use_build_ignore(".spelling")
usethis::use_build_ignore("tic.R")
usethis::use_build_ignore(".github")
usethis::use_build_ignore("cran-comments.md")
usethis::use_build_ignore("logfile.log")
# usethis::use_build_ignore("NEWS.md")

# gitignore
usethis::use_git_ignore("/*")
usethis::use_git_ignore("/*/")
usethis::use_git_ignore("*.log")
usethis::use_git_ignore("!/.gitignore")
usethis::use_git_ignore("!/.Rbuildignore")
usethis::use_git_ignore("!/.gitlab-ci.yml")
usethis::use_git_ignore("!/data-raw/")
usethis::use_git_ignore("!/DESCRIPTION")
usethis::use_git_ignore("!/inst/")
usethis::use_git_ignore("!/LICENSE.md")
usethis::use_git_ignore("!/man/")
usethis::use_git_ignore("!NAMESPACE")
usethis::use_git_ignore("!/R/")
usethis::use_git_ignore("!/README.md")
usethis::use_git_ignore("!/tests/")
usethis::use_git_ignore("/.Rhistory")
usethis::use_git_ignore("!/*.Rproj")
usethis::use_git_ignore("/.Rproj*")
usethis::use_git_ignore("/.RData")
usethis::use_git_ignore("/.vscode")
usethis::use_git_ignore("!/.lintr")
usethis::use_git_ignore("!/tic.R")
usethis::use_git_ignore("!/.github/")
usethis::use_git_ignore("!/NEWS.md")
usethis::use_git_ignore("!/cran-comments.md")

# code coverage
# covr::package_coverage()

# lint package
# lintr::lint_package()

# test package
# devtools::test()

# R CMD check package
# rcmdcheck::rcmdcheck()
# rcmdcheck::rcmdcheck(args = "--no-vignettes", build_args = "--no-build-vignettes")

# tidy description
usethis::use_tidy_description()
