FROM python:3.12-rc-alpine
MAINTAINER vasquez@meaningless.name

ENV FGALLERY_VERSION LATEST
ENV LANG C.UTF-8

WORKDIR /opt

RUN apk add --no-cache \
  bash \
  ca-certificates \
  curl \
  exiftool \
  imagemagick \
  fbida-exiftran \
  icu \
  jpegoptim \
  lcms2-utils \
  perl \
  perl-image-exiftool \
  perl-cpanel-json-xs \
  p7zip \
  pngcrush

# fgallery
RUN curl -fsSL https://www.thregr.org/~wavexx/software/fgallery/releases/fgallery-${FGALLERY_VERSION}.zip -o fgallery.zip && \
  unzip fgallery.zip && \
  mv fgallery-* fgallery && \
  rm fgallery.zip

VOLUME ["/opt/fgallery/photos"]
WORKDIR /opt/fgallery

CMD ["/bin/bash"]
