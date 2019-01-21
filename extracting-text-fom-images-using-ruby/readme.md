## Extracting Text From Images Using Ruby

1. Read all the images in source folder and convert it to grayscale image

2. Cleaning the image: Negates the image to black and white to remove all the noise. ( This improve the ability of Tessertact to read the text in the image )

3. Regconizing the text

## Requisite

brew install tesseract

brew install tesseract --all-languages

## What to know

Tesseract is an open source text recognizer (OCR) Engine

It can be used directly, or (for programmers) using an API to extract printed text from images. It supports a wide variety of language

https://github.com/tesseract-ocr/tesseract/blob/master/doc/tesseract.1.asc

Open3.capture3 captures the standard output and the standard error of a command.
https://www.rubydoc.info/stdlib/open3/Open3.capture3

## Reference

https://aonemd.github.io/blog/extracting-text-from-images-using-ruby

https://github.com/dannnylo/rtesseract

https://www.rubydoc.info/stdlib/open3/Open3.capture3