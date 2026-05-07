# Stage 1: build both language sites
FROM python:3.11-slim AS builder

WORKDIR /app
COPY . .

RUN pip install mkdocs-material --quiet && bash build.sh

# Stage 2: serve with nginx
FROM nginx:alpine
COPY --from=builder /app/public /usr/share/nginx/html
