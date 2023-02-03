FROM nginx:stable-alpine
WORKDIR /opt/hello-2048
COPY ./public_html/ /usr/share/nginx/html

