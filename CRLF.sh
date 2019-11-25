#!/bin/bash

#newline character causes an error, manually copy to a new file to execute
echo "Correcting script file formats"
for file in *.sh
do
    echo $file
    sed -i 's/\r//' $file
    chmod +x $file
done
