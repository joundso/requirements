# requiRements

<!-- badges: start -->

[![codecov](https://codecov.io/gh/joundso/requirements/branch/master/graph/badge.svg)](https://app.codecov.io/gh/joundso/requirements)
[![CRAN Status Badge](https://www.r-pkg.org/badges/version-ago/requiRements)](https://cran.r-project.org/package=requiRements)
[![CRAN Checks](https://badges.cranchecks.info/worst/requiRements.svg)](https://cran.r-project.org/web/checks/check_results_requiRements.html)

<!-- badges: end -->

The R package `requiRements` provides the ability to install all packages provided in a text or given a raw string.
This is meant to simply keep all e.g project dependent packages in one file (like the demo `requirements.txt` within `./data-raw/requirements.txt`) and install them all in a rush by using `requiRements::install("./requirements.txt")`.

This is well known from python and now available within R.

## Installation

You can install `requiRements` directly from CRAN:

```r
install.packages("requiRements")
```

The development version can be installed using

```r
install.packages("devtools")
devtools::install_github("joundso/requirements", ref = "development")
```

## Basic functions

### Install some packages providing a single string

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

### Install some packages providing a string vector

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

### Install some packages providing a file containing the packagenames

```r
## Test it with a file:
demo_path <- "./data-raw/requirements.txt"
requiRements::install(path_to_requirements = demo_path)
```

### Install some packages with a string AND a file

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

## :bulb: You can improve this package

- Missing some functionalities?
- Found a Bug?

--> Feel free to create an [issue](https://github.com/joundso/requirements/issues) or (even better) a [pull request](https://github.com/joundso/requirements/pulls). :pray: Thanks in advance!

## More Infos

- About MIRACUM: <https://www.miracum.org/>
- About the Medical Informatics Initiative: <https://www.medizininformatik-initiative.de/index.php/de>
- Alternative solution: Package [`Require`](https://github.com/PredictiveEcology/Require)
