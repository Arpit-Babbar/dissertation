#!/bin/bash

for filename in .;
do
	pdftoppm -r 600 -singlefile -png $file $file
done
