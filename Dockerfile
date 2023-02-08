FROM nginx:alpine-slim
WORKDIR /opt/hello-2048
COPY ./public_html/ /usr/share/nginx/html
LABEL org.opencontainers.image.source https://github.com/vozsiberiana/hello-2048
