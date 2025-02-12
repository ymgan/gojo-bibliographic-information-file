# Gojo's Bibliographic Information File 
<img src="/logo.png" width="150"/> 

Simple repo to use GBIF literature API to append "relevance" to the list of literature citing GBIF. 

## Repository structure

```         
.
├── LICENSE     License for this repo
├── README.md   This file
├── files       Directory containing file(s) generated by the script
├── gojo-bibliographic-information-file.Rproj   Organizes the R workspaces, settings, config
├── logo.png    Logo sketched by me
├── renv.lock   Snapshot of the project's R package environment
└── src         Directory of script(s)
```

## Getting started

To begin your Unlimited Void training, please follow the steps below.

1.  Clone the Repository: Clone the GitHub repository to your local machine

2.  Set Up the R Environment: Navigate to the cloned repository directory and restore the `renv` environment:

``` bash
cd gojo-bibliographic-information-file
Rscript -e 'renv::restore()'
```

This command installs the R packages specified in the `renv.lock` file, ensuring that you have the same environment as the original project.

3.  Open the R Project: Open the R project by double-clicking the `.Rproj` file in the repository. This will open the project in RStudio with all the necessary configurations.

4.  Run the Script: Navigate to the "src" directory within the project and open the R script you want to run. Execute the script in RStudio. Any output files generated by the script will be saved in the `files/` directory.
