up:
	docker-compose up

ci:
	bin/brakeman
	bin/rubocop
	bin/erblint app/views
	bin/rspec
