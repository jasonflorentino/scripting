#! /bin/bash

# Watching Travery Media's video https://www.youtube.com/watch?v=v-F3YLd6oMw

# ---------------------------------------------
# ECHO COMMAND
# ---------------------------------------------

echo Hello World!

# ---------------------------------------------
# VARIABLES
# ---------------------------------------------

# Uppercase by convention
# Letters, numbers, underscores
NAME="Jason"

# Reference with $
echo "My name is $NAME"
# Can also reference with curly brance syntax
echo "My name is ${NAME}"

# ---------------------------------------------
# USER INPUT
# ---------------------------------------------

# -p flag means "prompt"
read -p "Enter your name: " USER_NAME
echo "Hello $USER_NAME, nice to meet you!"

# ---------------------------------------------
# IF STATEMENT
# ---------------------------------------------

# Close block with "if" backwards
if [ "$USER_NAME" == "Jason" ]
then
	echo "That's my name!"
elif [ "$USER_NAME" == "Jack" ]
then
	echo "Your name is Jack"
else
	echo "Your name isn't the same as mine"
fi

# ---------------------------------------------
# COMPARISON
# ---------------------------------------------

# # # # # #
# A -eq B # Returns true if A and B are equal
# A -ne B # Returns true if A and B are not equal
# A -gt B # Returns true if A is greater than B 
# A -ge B # Returns true if A is greater than or equal to B 
# A -lt B # Returns true if A is less than B 
# A -le B # Returns true if A is less than or equal to B 
# # # # # #

NUM_A=31
NUM_B=5
if [ "$NUM_A" -gt "$NUM_B" ]
then
	echo "$NUM_A is greater than $NUM_B"
else
	echo "$NUM_A is less than $NUM_B"
fi

# ---------------------------------------------
# FILE CONDITIONS
# ---------------------------------------------

# # # # # #
# -d file	# True if the file is a directory
# -e file	# True if the file/dir exists (Not portable, use -f)
# -f file	# True if the provided string is a file
# -g file	# True if the group id is set on a file
# -r file	# True if the file is readable
# -s file	# True if the file has a non-sero size
# -u		  # True if the user is is set on a file
# -w		  # True if the file is writable
# -x		  # True if the file is an executable
# # # # # #

FILE="test.txt"
if [ -e "$FILE" ]
then
	echo "$FILE exists"
else
	echo "$FILE does NOT exist"
fi

# ---------------------------------------------
# CASE STATEMENT 
# ---------------------------------------------

# (Switch statement)
# Close with "case" backwards
read -p "Are you 21 or over? Y/N " ANSWER
case "$ANSWER" in
	[yY] | [yY][eE][sS])
		echo "You can have a beer :)"
		;;
	[nN] | [nN][oO])
		echo "Sorry, no drinking"
		;;
	*)
		echo "Please enter y/yes or n/no"
		;;
esac

# ---------------------------------------------
# FOR LOOP
# ---------------------------------------------

NAMES="JASON MARK ALICE KEVIN"
for NAME in $NAMES
	do
		echo "Hello $NAME"
done

# ---------------------------------------------
# FOR LOOP - RENAME FILES
# ---------------------------------------------

FILES=$(ls *.txt)
NEW="new"
for FILE in $FILES
	do
		echo "Renaming $FILE to new-$FILE"
		mv $FILE $NEW-$FILE
done

# ---------------------------------------------
# WHILE LOOP - READ THROUGH A FILE LINE BY LINE
# ---------------------------------------------

# -r flag - Do not treat a Backslash as an escape character.
LINE=1
while read -r CURRENT_LINE
	do
		echo "$LINE: $CURRENT_LINE"
		((LINE++))
done < "./test.txt"

# ---------------------------------------------
# FUNCTION
# ---------------------------------------------

function sayHello() {
	echo "Hello World!"
}

sayHello

# ---------------------------------------------
# FUNCTION WITH PARAMS
# ---------------------------------------------

function greet() {
	echo "Hello, I am $1 and I am $2"
}

greet "Jason" "30"

# ---------------------------------------------
# CREATE FOLDER AND WRITE TO A FILE
# ---------------------------------------------

read -p "Enter a directory name: " DIR_NAME
read -p "Enter a file name: " FILE_NAME
read -p "Enter some content: " CONTENT
FULL_PATH="$DIR_NAME/$FILE_NAME"
mkdir $DIR_NAME
touch $FULL_PATH
echo "$CONTENT" >> $FULL_PATH
echo "Created $FULL_PATH"
