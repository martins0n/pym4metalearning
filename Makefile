TAG = pym4metalearning


build:
	docker build -t $(TAG) .

run_test: build
	docker run $(TAG) pytest -s