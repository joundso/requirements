# Cleanup the backend in RStudio:
cat("\014") # Clears the console (imitates CTR + L)
rm(list = ls(all.names = TRUE)) # Clears the Global Environment/variables/data
invisible(gc()) # Garbage collector/Clear unused RAM

## -- Start to code here
## Test it with a string:
demo_string <- "
DIZtools
data.table
joundso/mainzelliste-connector
miracum/misc-diztools@dev
# this_one_will_be_ignored
"
requiRements::install(packages = demo_string)

## Test it with a vector:
demo_vec <-
  c(
    "",
    "DIZtools",
    "data.table",
    "joundso/mainzelliste-connector",
    "miracum/misc-diztools@dev",
    "# this_one_will_be_ignored"
  )
requiRements::install(packages = demo_vec)

## Test it with a file:
demo_path <- "./data-raw/requirements.txt"
requiRements::install(path_to_requirements = demo_path)

## Test it with a string AND a file:
requiRements::install(packages = demo_string,
                      path_to_requirements = demo_path)

## Test it with a vector AND a file:
requiRements::install(packages = demo_vec,
                      path_to_requirements = demo_path)
