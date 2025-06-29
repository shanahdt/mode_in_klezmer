#!/bin/bash

### Gmajor key extraction for thruxed corpus
for file in *.krn         
do
./key_extractor.pl $file -k "G:" > ../extracts/g-major/`basename $file`
done


### G-Freygish key extraction for thruxed corpus

for file in *.krn         
do
./key_extractor.pl $file -k "G:frey" > ../extracts/g-freygish/`basename $file`
done

### G-minor key extraction for thruxed corpus

for file in *.krn         
do
./key_extractor.pl $file -k "g:" > ../extracts/g-minor/`basename $file`
done

### G-dorian key extraction for thruxed corpus

for file in *.krn         
do
./key_extractor.pl $file -k "g:dor" > ../extracts/g-raised-fourth/`basename $file`
done
