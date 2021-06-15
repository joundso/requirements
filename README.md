# requiRements

<!-- badges: start -->

[![codecov](https://codecov.io/gh/joundso/requirements/branch/master/graph/badge.svg)](https://codecov.io/gh/joundso/requirements)
[![CRAN Status Badge](https://www.r-pkg.org/badges/version-ago/requiRements)](https://cran.r-project.org/package=requiRements)
[![Cran Checks](https://cranchecks.info/badges/worst/requiRements)](https://cran.r-project.org/web/checks/check_results_requiRements.html)

<!-- badges: end -->

The R package `requiRements` provides utility functions used to access a running Mainzelliste-Instance.

## Installation

<!---
You can install `requiRements` directly from CRAN:

```r
install.packages("requiRements")
```
-->

The development version can be installed using

```r
install.packages("devtools")
devtools::install_github("joundso/requirements", ref = "development")
```

## Basic functions

### Install packages providing a single string

```r
## Test it with a string:
demo_string <- "
DIZutils
data.table
joundso/mainzelliste-connector
miracum/misc-dizutils@development
# this_one_will_be_ignored
"
requiRements::install(packages = demo_string)
```

### Install packages providing a string vector

```r
## Test it with a vector:
demo_vec <-
  c(
    "",
    "DIZutils",
    "data.table",
    "joundso/mainzelliste-connector",
    "miracum/misc-dizutils@development",
    "# this_one_will_be_ignored"
  )
requiRements::install(packages = demo_vec)
```

### Install packages providing a file containing the packagenames

```r
## Test it with a file:
demo_path <- "./data-raw/requirements.txt"
requiRements::install(path_to_requirements = demo_path)
```

### Install packages with a string AND a file

:bulb: Using the above defined variables `demo_string`, `demo_vec` and `demo_path`:

```r
## Test it with a string AND a file:
requiRements::install(packages = demo_string,
                      path_to_requirements = demo_path)

## Test it with a vector AND a file:
requiRements::install(packages = demo_vec,
                      path_to_requirements = demo_path)
```

### Supported syntax

|           Platform           |        Syntax        |                                 Example                                 |
| :--------------------------: | :------------------: | :---------------------------------------------------------------------: |
|             CRAN             |    `packagename`     |            `requiRements::install(packages = "data.table")`             |
|            GitHub            |   `user/repo-name`   |  `requiRements::install(packages = "joundso/mainzelliste-connector")`   |
| GitHub with Branch/Reference | `user/repo-name@ref` | `requiRements::install(packages = "miracum/misc-dizutils@development")` |

## More Infos

- About MIRACUM: <https://www.miracum.org/>
- About the Medical Informatics Initiative: <https://www.medizininformatik-initiative.de/index.php/de>