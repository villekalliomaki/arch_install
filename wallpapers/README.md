Metadata should be stripped before committing images to the repository. On Arch `perl-image-exiftool` has to be installed before running.

Remove metadata by overwriting all image files here:

```sh
exiftool -overwrite_original -recurse -all= ./wallpapers
```
