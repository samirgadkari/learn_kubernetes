1. Create two files: fileone.txt and filetwo.txt with the contents
"file one" and "file two" respectively.
2. Create configmap using:
   kubectl -n configmap-test create configmap map-from-folder --from-file=./
   kubectl -n configmap-test describe configmap map-from-folder
