#!/bin/sh
# get Safari Bookmarks
#bm="$HOME/Library/Safari/Bookmarks.plist"
bm="$HOME/Bookmarks_test.plist"
grep -A1 -E '(>URLString<|>title<)' $bm |
grep -v -E '(>URLString|>title|^--)' |
cut -d\> -f2 | cut -d\< -f1 |
while read theTitle
do
read theUrl
echo "<!-- $theTitle --><a href=\"$theUrl\">$theTitle</a><br />"
done |
sort -f |
uniq
exit 0
