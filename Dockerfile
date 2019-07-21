FROM httpd:2.4

COPY server.crt server.key /usr/local/apache2/conf/
COPY httpd.conf /usr/local/apache2/conf/
COPY httpd-ssl.conf /usr/local/apache2/conf/extra/

EXPOSE 443
