#!/bin/bash -x

read -p "Enter number of Day to Play :" count

stake=100;

for ((i=1; i<=count; i++))
do
	gamble=$(( RANDOM % 2 ))
	if [ $gamble = 1 ]
	then
		echo win
		stake=$(($stake + 1))
	else
		echo loss
		stake=$(($stake - 1))
	fi
done
