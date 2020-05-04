#!/bin/bash -x

stake=100;
winDay=0;
lossDay=0;


declare -A perDayStakeAmount

function gamblingSimulation() {
	
	

	for ((days=1; days<=20; days++))
	do
   	lowestLost=$(($stake / 2));
		highestWin=$(($stake + $lowestLost));
		
		while [[ $stake -gt $lowestLost && $stake -lt $highestWin ]]
   	do
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
	
		winDayResult[$days]=$winDay;
		lossDayResult[$days]=$lossDay;
		totalAmount=$(($totalAmount + $stake))
		perDayStakeAmount["stake"]=$totalAmount
	
		
	done
	

	echo "\nNumber of Days won : $winDay"
	echo "\nNumber of Days lost: $lossDay"

	if [ $winDayResult -gt $lossDayResult ] 
	then
		echo "you can play next month\n"
	else
		echo "you should not play next month\n"
	fi
}

#use case 6 luckey
maxWin=0;
maxLoss=0

function luckeyAndUnluckey() {

	for ((day=1;day<=20;day++))
	do
		if [ $winDayResult[$day] -gt $luckeyDay ]
		then
			maxWin=$winDayResult[$day];
		elif [ $maxWin -eq $winDayResult[$day] ]
   	then
      	echo "Luckey Day : $day";
   	fi
   
   	if [ $lossDayResult[$day] -gt $unLuckeyDay ]
		then
			maxLoss=$lossDayResult[$day];
		elif [ $maxLoss -eq $lossDayResult[$day] ]
   	then
      	echo "UnLuckey Day : $day";
		fi
	done
	
}

gamblingSimulation
luckeyAndUnluckey
