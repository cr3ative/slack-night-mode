all: clean build

build: default

clean:
	rm -rf css
	mkdir -p css

default:
	sassc -t compact scss/main.scss css/black.css
