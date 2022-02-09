up:
	docker-compose up

ci:
	bin/brakeman
	bin/rubocop
	bin/rspec
