#!/bin/bash -x

stake=100;

while [ true ]
do
	gamble=$(( RANDOM % 2 ))
	if [[ $stake > 50 || $stake < 150 ]]
	then	
		if [ $gamble = 1 ]
		then
			stake=$(($stake + 1));
		else
			stake=$(($stake - 1));
		fi
	else
		break;
	fi
done

echo $stake
