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

numberOfDays=30;
numberOfMonth=12;

function checkForDays() {
	for ((month=1; month<=$numberOfMonth; month++))
	do
		for ((days=1; days<=$numbeOfDays; days++))
		do
			gamblingSimulation $stake
			totalWinNLossPerDay=$(($winResult[$days] + $lossResult[$days]))
			if [ $totalWinNLossPerDay -gt 100 ]
			then
				winDay=$(($totalWinNlossDay - 100))
				echo $WinDay
			else
				lossDay=$((100 - $totalWinNlossDay ))
				echo $lossDay
			fi
		done
	done
}

checkForDays $numberOfDays

