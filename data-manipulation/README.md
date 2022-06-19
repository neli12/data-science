### R and python scripts for data manipulation


- `joins.R`: This script was used to join several csv files with soil spectral measurement (mid-IR range). An example is given here to join two csv files, whose format is depicted in the figure `example_input.PNG`. The csv files from the sensor measurements came in a long format, with each measurement and wavenumber in separate files. Our objective was to join all the csv files by their wavenumber, transpose to set the wavenumber as columns and then rename. See the `resulting_table.PNG` to have an idea of the desired result. 
