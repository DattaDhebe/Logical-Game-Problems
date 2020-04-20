#!/bin/bash -x

stake=100;
count=1;
function gamblingSimulation() {
   lowestLost=50;
	highestWin=150;
	
	while [[ $stake -gt $lowestLost && $stake -lt $highestWin ]]
   do
		((count++))
      gamble=$(( RANDOM % 2 ))
      if [ $gamble = 1 ]
      then
       	stake=$(($stake + 1));
			winDay=$(($winDay + 1));
      else
        	stake=$(($stake - 1));
			lossDay=$(($lossDay + 1))
      fi 
		
	done
	winDayResult[$count]=$winDay;
	lossDayResult[$count]=$lossDay;
}

#use case for for 20 days

numberOfDays=30;
numberOfMonth=12;

function checkForDays() {
	for ((month=1; month<=$numberOfMonth; month++))
	do
		for ((days=1; days<=$numberOfDays; days++))
		do
			amountPerDay=$(("gamblingSimulation $stake"))
			echo ${winResult[$days]}
			echo ${lossResult[$days]}
		#	if [ $totalWinNLossPerDay -gt 100 ]
		#	then
		#		winDay=$(($totalWinNlossDay - 100))
		#		echo $WinDay
		#	else
		#		lossDay=$((100 - $totalWinNlossDay ))
		#		echo $lossDay
		#	fi
		done
	done
}

checkForDays $numberOfDays

