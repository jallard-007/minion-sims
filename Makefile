.PHONY: files api start-files start-api

all: files api

files:
	cd frontend && npm run build
	go build ./cmd/ms-files

api:
	go build ./cmd/ms-api

start-files:
	pkill -fx "./ms-files --port 8063" || true
	nohup ./ms-files --port 8063 &> files.log &

start-api:
	pkill -fx "./ms-api serve --http 127.0.0.1:8064" || true
	nohup ./ms-api serve --http 127.0.0.1:8064 &> api.log &
