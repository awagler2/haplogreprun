# haplogreprun

### Install
git clone https://github.com/beckbw/haplogreprun.git

### Build
docker build -t beckbw/haplogreprun .

### Run
docker run --rm -it -v ${PWD}:/tmp/work beckbw/haplogreprun /tmp/scripts/run_haplogrep.sh genome_file_from_23andMe.txt

### Output
root owned "haplogrep" directory
