ARG BASE_IMAGE=ghcr.io/karakosystems/karako-cdn:1
FROM ${BASE_IMAGE}

ENV BASE_FQDN=openfsp.org

# The submodule stores sources by format, logo/ and png/. The CDN serves them by
# asset instead, so a URL names what the file is and not how it was produced.
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
