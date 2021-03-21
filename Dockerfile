FROM alpine:3.13
LABEL maintainer "Michael Nival <docker@mn-home.fr>"

RUN set -ex; \
	apk upgrade --no-cache --update; \
	apk add --no-cache postfix postfix-pcre cyrus-sasl-login ca-certificates; \
	sed -i '/^.readme_directory/d' /etc/postfix/postfix-files; \
	postconf -e "maillog_file = /dev/stdout"; \
	postconf -e "smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt"
	
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod u+x /docker-entrypoint.sh

EXPOSE 25

VOLUME /var/spool/postfix/

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/postfix", "start-fg"]
