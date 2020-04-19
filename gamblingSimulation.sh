#!/bin/bash -x

stake=100;
gamble=$(( RANDOM % 2 ))

if [ $gamble = 1 ]
then
	echo win
else
	echo loss
fi
