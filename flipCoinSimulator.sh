#!/bin/bash -x

read -p "How many Time you Want to flip coin :"  count

declare -A dictionary

#declaration of head and tail
head=0;
tail=0;

for ((i=1; i<=count; i++))
do
	flip=$(( RANDOM % 2 ))
	if [ $flip -eq 1 ]
	then
		head=$(($head + 1));
	else
		tail=$(($tail + 1));
	fi
	
	dictionary[$i]=$flip;

done

head_percentage=$(( $head * 100 / $count ))
tail_percentage=$(( $tail * 100 / $count ))


