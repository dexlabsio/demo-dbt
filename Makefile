.PHONY: build
build:
	docker build . 

up:
	docker compose up -d

down:
	docker compose down


.PHONY: requirements-dev
## install development requirements
requirements-dev:
	@python -m pip install -U -r requirements.dev.txt

.PHONY: requirements-minimum
## install prod requirements
requirements-minimum:
	@python -m pip install -U -r requirements.txt

.PHONY: requirements
## install requirements
requirements: requirements-dev requirements-minimum

.PHONY: style-check
## run code style checks with black
style-check:
	@echo ""
	@echo "Code Style"
	@echo "=========="
	@echo ""
	@python -m black --check --exclude="build/|buck-out/|dist/|_build/|pip/|\.pip/|\.git/|\.hg/|\.mypy_cache/|\.tox/|\.venv/" . && echo "\n\nSuccess" || (echo "\n\nFailure\n\nRun \"make black\" to apply style formatting to your code"; exit 1)

.PHONY: quality-check
## run code quality checks with flake8
quality-check:
	@echo ""
	@echo "Flake 8"
	@echo "======="
	@echo ""
	@python -m flake8 && echo "Success"
	@echo ""

.PHONY: checks
## run all code checks
checks: style-check quality-check 

.PHONY: apply-style
## fix stylistic errors with black and isort
apply-style:
	@python -m black --exclude="build/|buck-out/|dist/|_build/|pip/|\\.pip/|\.git/|\.hg/|\.mypy_cache/|\.tox/|\.venv/" .