# Goal

The goal is to quickly make some sample tabular data. We'll introduce redirects, for loops, functions, and random numbers. See `make_data.sh` for a working example.

### First Attempt

We'll use bash redirects to make data to play with.

Making a few rows of data is easy with echo, note the flag `-e` is used to parse `\n` into the newline character.
```bash
echo -e "username,total_purchase\nfoo,500\nbar,50"

username,total_purchase
foo,500
bar,50
```

### Redirects

Write the data to a file.
```bash
echo -e "username,total_purchase\nfoo,500\nbar,50" > /tmp/data
```

*Note:*
1. The `>` operator will overwrite it if it exists.
2. Use the `>>` operator if you'd like to append instead of overwrite.
3. Both operators (`>` and `>>`) will create the file if it doesn't exist.

Here is the `>>` operator in action.

```bash
# Delete the file if it exists
rm -f /tmp/data

# Create sample data
echo -e "username,total_purchase\nfoo,500\nbar,50" >> /tmp/data
echo -e "alice,100\ntom,60" >> /tmp/data

cat /tmp/data

# Output
username,total_purchase
foo,500
bar,50
alice,100
tom,60
```

### For Loops

Here's a simple for loop:

```bash
STUFF="1 2 3"
for i in $STUFF
do
    echo "Hi, for the ${i}th time"
done

# Output
Hi, for the 1th time
Hi, for the 2th time
Hi, for the 3th time
```

There's a lot of stuff we introduced here, let's analyze what we did
*Note:*
1. Variables: To define a variable, just use `VAR=foo`. It's important there is no space between the equal sign and foo or VAR.
2. For loops basically iterate over words in a string.
3. We used two different ways to access variables!
- The first example is `$STUFF`, which simply identifies the value of stuff
- Equivalently, `${i}` identifies the variable named i.

*Try:*
1. Remove the curly braces around `i` in the loop. What happens?
2. There's a linux command to print a sequence of numbers; Try seq 1 100. What happens?
3. Replace STUFF="1 2 3" with STUFF=$(seq 1 100)
4. Replace STUFF="1 2 3" with STUFF=$(ls *)

### Make a bunch of data

```bash
rm -f /tmp/data

echo "username,total_purchase" > /tmp/data
for i in $(seq 1 100)
do
    echo "foo,2223" >> /tmp/data
done

```

How many lines did we make?

```bash
wc -l /tmp/data
101
```

### Cleaner code

```bash
# Workaround so tr works with binary input on mac.
export LC_ALL=C

# Delete file if it exists
rm -f /tmp/data

# Add a header
echo "username,total_purchase" > /tmp/data

function make_line ()
{

    # Note, tr -dc 'a-z' will delete characters that aren't a-z (lowercase)
    # Note, fold -w 8 will wordwrap what it's given into 8 character chunks
    USERNAME=$(cat /dev/urandom | tr -dc [:alpha:] | fold -w 8 | head -n 1)

    # $RANDOM is a special variable gives ranom number 0 - 32767
    echo "$USERNAME,$RANDOM"
}

for i in $(seq 1 100)
do
    make_line >> /tmp/data
done

cat /tmp/data | head


# Output

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

### We made sample data!
