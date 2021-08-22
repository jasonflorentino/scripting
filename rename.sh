#! /bin/bash

# Script I made for helping merge the separate downloads
# of my facebook data. There were hundreds of directories
# that needed to be merged especially in `photos_and_videos`
# and `messages`. Funnily, while some files were present in 
# one download but not the other, other files were duplicated
# across both. Also, during one execution I accidently created 
# duplicate directories at the destination, hence the function
# for handling those...
#
# —Jason, 2021-08-22

SRC=~/Desktop/facebook-jasonflorentino-src/photos_and_videos
DES=~/Desktop/facebook-jasonflorentino-dest/photos_and_videos

function safelyMoveFile()
{
	local __src=$1
	local __des=$2
	mv -vn $__src $__des	
}

function recursivelyMove()
{
	local __src=$1
	local __des=$2
	for DIR in $(ls $__src)
		do
			for FILE in $(ls $__src/$DIR)
				do
					local __src2=$__src/$DIR/$FILE
					local __des2=$__des/$DIR/$FILE
					safelyMoveFile $__src2 $__des2
			done
	done
}

function deleteDoubleDirs()
{
	local __src=$1
	for DIR in $(ls $__src)
		do
			local __p1=$__src/$DIR
			for _DIR in $(ls $__p1)
				do
					local __p2a=$__p1/$_DIR/$_DIR
					local __p2b=$__p1/$_DIR
					if [ -e $__p2a ]
					then
						echo "Deleting $__p2a"
						rm -r $__p2a
					fi
			done
	done
}

recursivelyMove $SRC $DES
