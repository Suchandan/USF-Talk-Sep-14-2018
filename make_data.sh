#!/usr/bin/env bash

ORIGINAL_LC_ALL_VALUE=$LC_ALL
echo "Original value of variable LC_ALL=$LC_ALL"
export LC_ALL=C

# Delete file if it exists
echo "Deleting old tmp file"
rm -f /tmp/data

# Add a header
echo "Adding header"
echo "username,total_purchase" > /tmp/data

function make_line ()
{

    # Note, tr -dc 'a-z' will delete characters that aren't a-z (lowercase)
    # Note, fold -w 8 will wordwrap what it's given into 8 character chunks
    USERNAME=$(cat /dev/urandom | tr -dc [:alpha:] | fold -w 8 | head -n 1)

    # $RANDOM is a special variable gives ranom number 0 - 32767
    echo "$USERNAME,$RANDOM"
}

echo "Making data ... "
for i in $(seq 1 100)
do
    make_line >> /tmp/data
done

echo "done!"
echo "Resetting variable LC_ALL to original value $ORIGINAL_LC_ALL_VALUE"
export LC_ALL=$ORIGINAL_LC_ALL_VALUE

echo -e "\nSample of /tmp/data:"
cat /tmp/data | head
