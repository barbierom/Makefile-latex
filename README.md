# Makefile-latex project  


I. File list
---------------
* ```template_xxx.tex```: In this file the documentclass and the inclued libraries are defined.This file is going to define the page template. 
* ```main.tex```: This file is goid to include the template_xxx.tex and the reports files written in the Contents/ directory. Inside the Contents theare is also the bibliography.bib.

II. Directory list
---------------
* ```Contents```:  In this directory you write the report using the latex languages. In this file you dont care abount the page template. The file isndie the Contents/ have  to be included in the main.tex file. If you are writing a book, the best solution is to create differents directory with chapeter_x.tex inside. Inside the directoryyou can put also the figure in order to maintein the proper organizaion of the file list.
* ```Figures```: here you are going to put the Figures.
* ```Output```: In this directory, the latex ganerated files are stored.

III. Usage
--------------
1. to get info type

	```
	$ make help
	```

2. for start the pdf compiling type

	```
	$ make pdf
	```

3. In order to have a look of the output type:

	```
	$ make pdfshow
	```



