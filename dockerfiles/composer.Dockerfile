FROM composer:latest

WORKDIR ${SITE_PATH}

USER user
ENTRYPOINT ["composer", "--ignore-platform-reqs"]