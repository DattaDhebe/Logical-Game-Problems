#!/bin/bash -x

stake=100;
days=0;

function gamblingSimulation() {
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
	echo "$stake"
}

function useCase4() {
	while [ true ]
	do
		((days++))
		if [ $days -lt 20 ]
		then	
			perDayStake="$( gamblingSimulation $stake )"
			total_amount=$(($total_amount + $perDayStake))
		else
			break;
		fi
	done
}

useCase4
echo $total_amount

