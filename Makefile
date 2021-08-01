SHELL:=/usr/bin/env bash

.PHONY: lint
lint:
	poetry run flake8 .

.PHONY: package
package:
	poetry run poetry check
	poetry run pip check
	poetry run safety check --full-report

.PHONY: test
test: lint package
