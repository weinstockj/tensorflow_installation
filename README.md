This directory includes a bash script for building tensorflow and tensorflow probability from source. I had to do this because the default pip wheels are compiled for CPUs that include
features that are not available on some of the CPUs in a local cluster where I work. This necessitating building tensorflow locally without enabling AVX instructions. 
