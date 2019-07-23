FROM httpd:2.4

COPY httpd.conf /usr/local/apache2/conf/
COPY httpd-ssl.conf /usr/local/apache2/conf/extra/

ENV VERIFY_DEPTH 2
ENV ALLOWED_CLIENT_S_DN 'dunder-mifflin.com'

EXPOSE 443
