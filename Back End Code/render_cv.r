# This script builds both the HTML and PDF versions of your CV

# If you wanted to speed up rendering for googlesheets driven CVs you could use
# this script to cache a version of the CV_Printer class with data already
# loaded and load the cached version in the .Rmd instead of re-fetching it twice
# for the HTML and PDF rendering. This exercise is left to the reader.

# Knit the HTML version
rmarkdown::render("C:/Users/aargeros/Documents/GitHub/andrewargeros.github.io/Back End Code/cv.rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "C:/Users/aargeros/Documents/GitHub/andrewargeros.github.io/index.html")

# Knit the PDF version to temporary html location
# tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("C:/Users/aargeros/Documents/GitHub/andrewargeros.github.io/Back End Code/cv.rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = 'C:/Users/aargeros/Documents/GitHub/andrewargeros.github.io/Back End Code/temp.html')

# Convert to PDF using Pagedown
pagedown::chrome_print(input = "C:/Users/aargeros/Documents/GitHub/andrewargeros.github.io/Back End Code/temp.html",
                       output = "C:/Users/aargeros/Documents/GitHub/andrewargeros.github.io/argeros_cv.pdf")
