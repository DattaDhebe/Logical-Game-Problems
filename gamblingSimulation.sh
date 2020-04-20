#!/bin/bash -x

stake=100;

function gamblingSimulation() {
   lowestLost=50;
	highestWin=150;
	while [[ $stake -gt $lowestLost && $stake -lt $highestWin ]]
   do
      gamble=$(( RANDOM % 2 ))
      if [ $gamble = 1 ]
      then
       	stake=$(($stake + 1));
      else
        	stake=$(($stake - 1));
      fi 
		
	done

	echo $stake
}

#use case for for 20 days
days=0;
numberOfDays=20;

function checkForDays() {
	while [ $days -lt $numberOfDays ]
	do
		((days++))
		perDayStake="$( gamblingSimulation $stake )"
		total_amount=$(($total_amount + $perDayStake))
	done
}

checkForDays $numberOfDays

