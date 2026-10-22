## Submission

This is an update of the package 'plug', from version 0.1.0 to 0.2.0.

* Fixes the NOTE shown in the CRAN check results of version 0.1.0 ("Missing
  dependency on R >= 4.1.0 because package code uses the pipe |>").
* Fixes the replacement of placeholders in SQL templates and the handling of
  failures in the communication with the 'API'.
* The examples no longer write to the keyring of the user: they now use the
  in-memory backend of the 'keyring' package.
* Adds unit tests. They do not access the internet nor the system keyring.

See NEWS.md for the complete list of changes.

## R CMD check results

0 errors | 0 warnings | 0 notes

## Examples in \dontrun{}

The examples that are not executed require valid credentials, provided by the
administrators of the 'API', and access to the 'API'.

## Reverse dependencies

There are no reverse dependencies.
