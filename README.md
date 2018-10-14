# fgallery-docker
Alpine-based container for [fgallery](https://www.thregr.org/~wavexx/software/fgallery/).


## usage
```sh
docker build -t shulima/fgallery .
docker run -it -v $PHOTO_DIR:/opt/fgallery/photos -t shulima/fgallery
```
