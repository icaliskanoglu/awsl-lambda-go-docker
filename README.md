# Sample Python Lambda Function with Docker and Datadog agent

## Build
```
docker buildx build --platform linux/x86-64 -t <docker-image-uri> --push .
```

## Run Localy
### Run docker compose
```
docker-compose up
```

### Invoke
```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```

### Note

* `public.ecr.aws/datadog/lambda-extension` supports only linux/x86 arch