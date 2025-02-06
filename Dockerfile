# Use the Rocker RStudio image
FROM rocker/rstudio:4.4.2

# Set the working directory inside the container
WORKDIR /home/rstudio

# Install a specific version of the {cowsay} package using renv
RUN R -e "install.packages('remotes', repos='http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('cowsay', version='0.8.0', repos='http://cran.rstudio.com/')"

# Copy your R script to the container
COPY container.R /home/rstudio/container.R

# Set the default command to run the R script
CMD ["Rscript", "/home/rstudio/container.R"]