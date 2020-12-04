#!/bin/sh

filename=$1
target="$(dirname "$filename")/pdf"
outputFile="$(basename "$filename" .md).pdf"

mkdir -p $target

pandoc \
				--pdf-engine=xelatex \
				-o "$target/$outputFile" $filename &
