ARG ALPINE_VERSION=latest
FROM alpine:${ALPINE_VERSION}

ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

# Labels
LABEL maintainer "Michael Nival <docker@mn-home.fr>"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=${BUILD_DATE}
LABEL org.label-schema.vcs-ref=${VCS_REF}
LABEL org.label-schema.version=${BUILD_VERSION}

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
