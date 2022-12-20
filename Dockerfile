FROM python:3.12-rc-alpine
MAINTAINER m@meaningless.name

ARG FGALLERY_VERSION=LATEST
ARG FGALLERY_UID=1001
ARG FGALLERY_GID=1001
ENV LANG C.UTF-8
ENV PATH /opt/fgallery:$PATH

RUN apk add --no-cache \
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

RUN addgroup -g ${FGALLERY_GID} fgallery \
  && adduser -D -H -u ${FGALLERY_UID} -G fgallery fgallery

WORKDIR /opt

# fgallery
RUN curl -fsSL https://www.thregr.org/~wavexx/software/fgallery/releases/fgallery-${FGALLERY_VERSION}.zip -o fgallery.zip \
  && unzip fgallery.zip \
  && mv fgallery-* fgallery \
  && chown -R fgallery:fgallery /opt/fgallery \
  && rm fgallery.zip

WORKDIR /opt/fgallery
USER fgallery

VOLUME ["/photos"]
VOLUME ["/output"]

ENTRYPOINT ["/opt/fgallery/fgallery"]
