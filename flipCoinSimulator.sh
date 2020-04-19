#!/bin/bash -x

read -p "How many Time you Want to flip coin :"  count

declare -A dictionary

#declaration of head and tail
head=0;
tail=0;

function singletCombination() {
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
	
	echo ${dictionary[@]}
}

singletCombination $count

#varibale declaration for doublet
HH=0;
HT=0;
TT=0;
TH=0;

function doubletCombination() {
	for ((i=1; i<=count; i++))
	do
		flip=$(( RANDOM % 4 ))
		if [ $flip -eq 0 ]
		then
			HH=$(($HH + 1));
		elif [ $flip -eq 1 ]
		then 
			HT=$(($HT + 1));
		elif [ $flip -eq 2 ]
		then
			TH=$(($TH + 1));
		else
			TT=$(($TT + 1));
		fi
	done

	HH_percentage=$(( $HH * 100 / $count ))
	HT_percentage=$(( $HT * 100 / $count ))
	TH_percentage=$(( $TH * 100 / $count ))
	TT_percentage=$(( $TT * 100 / $count ))
}

doubletCombination $count
