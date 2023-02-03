FROM httpd:alpine
WORKDIR /opt/hello-2048
COPY ./public_html/ /usr/local/apache2/htdocs

