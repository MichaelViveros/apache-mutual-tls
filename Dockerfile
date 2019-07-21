FROM httpd:2.4

COPY server.crt server.key /usr/local/apache2/conf/
COPY ca.crt /usr/local/apache2/conf/ssl.crt/ca-bundle.crt
COPY httpd.conf /usr/local/apache2/conf/
COPY httpd-ssl.conf /usr/local/apache2/conf/extra/

ENV VERIFY_DEPTH 2
ENV ALLOWED_CLIENT_S_DN 'dunder-mifflin.com'

EXPOSE 443
