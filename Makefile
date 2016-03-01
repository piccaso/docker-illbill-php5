build:
	docker build -t docker-php52 .

go:
	docker run -ti --rm -v $$PWD:/var/www -p 8083:80 docker-php52
