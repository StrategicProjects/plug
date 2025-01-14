## R CMD check results

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

* This is a new release.

## Konstanze Lauseker Comments

1.	Title Length

We have shortened the package title to fewer than 65 characters. The new title 
is:
	Secure and Intuitive Access to ‘Plug’ Interface

2.	Quotation Marks for Names

We have placed package names, software names, and ‘API’ references in single 
quotes throughout the title and description as requested.

3.	Examples Wrapped in \donttest{}

	•	We removed \donttest{} and \dontrun{} for the function plug_store_credentials(), 
	  since it does not require actual credentials and can be executed in under 
	  five seconds.
	•	For the other functions, because they depend on valid credentials and/or 
	  external services, we kept their examples in \donttest{} or \dontrun{} to 
	  avoid potential runtime or dependency issues on CRAN's test systems.

Thank you for reviewing our submission.
