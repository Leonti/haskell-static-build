# Builds standalone binaries which can be used inside of docker containers  
Based on https://github.com/dkubb/haskell-builder  

To use:  
Navigate to a folder with your stack project and run  

    docker run -v "$(pwd):/src" --rm leonti/haskell-static-build
