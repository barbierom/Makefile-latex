## Makefile-latex project

I. File list
---------------
* ```main.tex```: In this file the documentclass and the inclued libraries are defined. In this file you have also to insert the report.tex file
* ```report.tex```: In this file you write the contents of the report using the latex languages. In this file you dont care abount the page template. The file has  to be included in the main.tex file. If you are writing a book, the best solution is to create differents directory with chapeter_x.tex inside. Inside the directoryyou can put also the figure in order to maintein the proper organizaion of the file list.
* ```bibliograpy.bib```: This is the bibliograpy. The inclusion is not already implemented
* ```Figures```: here you are going to put the Figures.
* ```Output```: In this directory the pdf and dvi result is stored

II. Usage
--------------
1. to get info type

	```
	$ make
	```

2. for start the pdf compiling type

	```
	$ make pdf
	```

3. In order to have a look of the output type:

	```
	$ make pdfshow
	```



