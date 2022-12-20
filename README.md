# fgallery-docker
Alpine-based container for [fgallery](https://www.thregr.org/~wavexx/software/fgallery/).


## build
```sh
docker build -t shulima/fgallery .
```

## example usage
```
export PHOTO_DIR=/path/to/your/photos
export OUTPUT_DIR=/path/to/desired/output

docker run -it shulima/fgallery --help

docker run -it -v $PHOTO_DIR:/photos -v $OUTPUT_DIR:/output shulima/fgallery [...desired flags...] /photos /output/gallery
```

Note: fgallery will create a directory under `$OUTPUT_DIR` instead of writing to it directly,
because it doesn't like existing output directories.
