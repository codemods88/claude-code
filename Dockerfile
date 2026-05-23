FROM python:3.12-slim-bookworm
WORKDIR /app
RUN pip install --no-cache-dir uv
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
COPY . .
RUN uv sync --frozen --no-dev
EXPOSE 8082
ENTRYPOINT ["uv", "run", "uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8082", "--timeout-graceful-shutdown", "5"]
