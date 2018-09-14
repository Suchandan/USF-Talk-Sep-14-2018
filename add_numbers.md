# Goal

Do basic arithmetic on a column of data. We'll introduce the following:

1. cut
2. paste
3. tail
4. bc

Note: Run the script make_data.sh first. This creates a file /tmp/data that we'll use. Aternatively, you can copy/paste the following into /tmp/data:

```
username,total_purchase
CwMrUlEZ,6495
asFzHYam,3505
yFIovuBr,10577
nRQwLhnp,345
OkdDgGok,12348
fsgDWWfz,27823
SvEnJrEV,8116
kELzlQcy,31176
puSJeoMY,20106
```

# Extract one column

```bash
cat /tmp/data | cut -d "," -f 2
```

Explaination of cut:

1. -d is the delimiter, we set it to "," because files are "," delimited.
2. -f the fields we want. Note that cut starts counting from 1. Hence we get the total_purchase column.
3. If you want both columns 1 and 2, you can do `cat /tmp/data | cut -d "," -f 1,2`.

# Add numbers

The utility bc will add results
```bash
echo "2 + 2" | bc

# Output
4
```

# Add + signs

```bash
cat /tmp/data | cut -d "," -f 2 | paste -sd+ -
```

```
# Sample Output

total_purchase+3152+30983+16926+22934+18057+9926+29282+17343+5995+30597+30043+24678+27550+8003+15422+22882+28264+12048+3814+29026+30764+12281+16716+13430+29498+2317+2337+32388+12670+27781+13108+15693+25081+24224+11141+31123+29553+18804+9087+6982+26657+962+24354+31468+20215+25374+1529+31847+2828+5984+22650+2175+551+4345+1466+7267+25167+31923+10212+6903+8263+27629+18867+10248+875+5449+10273+13955+8123+32118+1076+10653+9724+608+5090+1458+2746+32020+18765+11640+32248+30547+12014+17819+1238+8653+18494+31780+19566+8095+22643+13661+18075+3409+3679+8541+14502+30427+21547+8478
```

Explanation of paste:

1. -sd+ Read the entire file, and place + character between lines.
2. /tmp/data was generated randomly, your output will vary.

# Note, need to skip header!

```bash
cat /tmp/data | cut -d "," -f 2 | tail -n +2  | paste -sd+ -
 ```

*Note:*
1. The tail command above starts printing at the line 2 (the second line, counting the header as 1st line).

# Finally, add the result:

```bash
cat /tmp/data | cut -d "," -f 2 | tail -n +2  | paste -sd+ | bc

# Sample output
1590776
```
