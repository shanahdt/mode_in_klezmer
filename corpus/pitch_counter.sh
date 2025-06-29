#!/bin/bash

# This script extracts pitches and durations from .krn files in the specified directory.
# It uses the 'pitch' and 'dur' commands, filters the output, and formats it for further processing.
# Ensure the 'pitch' and 'dur' commands are available in your environment.

rm -f /tmp/pitches.tmp
rm -f /tmp/durations.tmp

echo '"pitches","durations"' > $2
for file in $1/*.krn    
do 
    echo "Processing $file"
    pitch -x $file | rid -GLId | 
    grep -v '=' | grep -v 'r' | 
    awk '{print $1}' | sed 's/^/"/g' | 
    sed 's/$/"/g' >> /tmp/pitches.tmp

    dur $file | rid -GLId | grep -v 'r' |
        grep -v '=' | awk '{print $1}' | 
        sed 's/[^0-9.]*//g' >> /tmp/durations.tmp     

done 

paste -d ',' /tmp/pitches.tmp /tmp/durations.tmp >> $2


