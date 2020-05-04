#!/bin/bash -x

read -p "How many Time you Want to flip coin :"  count

declare -A dictionary

#declaration of head and tail
head=0;
tail=0;

declare -A winingCombination
declare -A singlet

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

	
	#store percentage in dictionary
	winingCombination[H]=$head_percentage;
	winingCombination[T]=$tail_percentage;
	
}

#varibale declaration for doublet
HH=0;
HT=0;
TT=0;
TH=0;

declare -A doublet

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


	#store percentage result in dictionary
   winingCombination[HH]=$HH_percentage;
   winingCombination[HT]=$HT_percentage;
	winingCombination[TH]=$TH_percentage;
   winingCombination[TT]=$TT_percentage;

}


#declare varible for triplet combination
HHH=0;
HHT=0;
HTT=0;
TTT=0;
TTH=0;
THH=0;
HTH=0;
THT=0;

declare -A triplet

function tripleCombination() {
	for ((i=1; i<=count; i++))
	do
		flip=$(( RANDOM % 8 ))
		if [ $flip = 0 ]
		then
			HHH=$(($HHH + 1))
		elif [ $flip = 1 ]
		then
			HHT=$(($HHT + 1))
		elif [ $flip = 2 ]
      then
         HTT=$(($HTT + 1))
		elif [ $flip = 3 ]
      then
         TTT=$(($TTT + 1))
		elif [ $flip = 4 ]
      then
         TTH=$(($TTH + 1))
		elif [ $flip = 5 ]
      then
         THH=$(($THH + 1))
		elif [ $flip = 6 ]
      then
         HTH=$(($HTH + 1))
		else
			THT=$(($THT + 1))
		fi
	done
	
	
	#store percentage result in dictionary
   winingCombination[HHH]=$HHH_percentage;
   winingCombination[HHT]=$HHT_percentage;
   winingCombination[HTT]=$HTT_percentage;
   winingCombination[TTT]=$TTT_percentage;
	winingCombination[TTH]=$TTH_percentage;
	winingCombination[THH]=$THH_percentage;
   winingCombination[HTH]=$HTH_percentage;
   winingCombination[THT]=$THT_percentage;
   
}



#to sort result so that we can get wining Combination
#diplaying wining combination

function displayResult() {

	echo ${winingCombination[@]}
	for item in "${!winingCombination[@]}"
	do
   	 echo $item ' - ' ${winingCombination["$item"]}
	done | sort -rn -k3
}


function flipCoinSimulation() {
	singletCombination $count
	doubletCombination $count
	tripleCombination $count
	displayResult
}
