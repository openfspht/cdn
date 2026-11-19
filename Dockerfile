FROM ghcr.io/karakosystems/karako-cdn:1.0.2@sha256:ab47c918a35870e171f01a3038162208a38b40001fd77029dcc07e74b175e2e8

ENV BASE_FQDN=openfsp.org

COPY --chown=65534:65534 art/logo/openfsp-logo*.svg     /public/logo/
COPY --chown=65534:65534 art/logo/openfsp-mark*.svg     /public/mark/
COPY --chown=65534:65534 art/logo/openfsp-wordmark*.svg /public/wordmark/
COPY --chown=65534:65534 art/logo/openfsp-avatar*.svg   /public/avatar/
COPY --chown=65534:65534 art/logo/favicon.svg           /public/favicon/

COPY --chown=65534:65534 art/png/logo/     /public/logo/
COPY --chown=65534:65534 art/png/mark/     /public/mark/
COPY --chown=65534:65534 art/png/wordmark/ /public/wordmark/
COPY --chown=65534:65534 art/png/avatar/   /public/avatar/
COPY --chown=65534:65534 art/png/favicon/  /public/favicon/

COPY --chown=65534:65534 public/ /public/
