#!/bin/ash

# Configuration Postfix
postconf -e 'relayhost = [smtp.gmail.com]:587'
postconf -e 'smtp_sasl_auth_enable = yes'
postconf -e 'smtp_sasl_password_maps = lmdb:/etc/postfix/sasl_passwd'
postconf -e 'smtp_sasl_security_options = noanonymous'
postconf -e 'smtp_tls_security_level = secure'
postconf -e 'smtp_tls_mandatory_protocols = TLSv1'
postconf -e 'smtp_tls_mandatory_ciphers = high'
postconf -e 'smtp_tls_secure_cert_match = nexthop'
