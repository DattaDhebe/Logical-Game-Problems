#!/bin/bash -x

playGame=1;
readRules=2;
exitGame=3;
position=0;

function gamePlaying() {
	printf "~ Your Snake and Ladder Game Board ~\n"
   printf " (Home-100) 99 98 97 96 95 94 93 92 91\n"
	printf "        81 82 83 84 85 86 87 88 89 90\n"
	printf "        80 79 78 77 76 75 74 73 72 71\n"
	printf "        61 62 63 64 65 66 67 68 69 70\n"
	printf "        60 59 58 57 56 55 54 53 52 51\n"
	printf "        41 42 43 44 45 46 47 48 49 50\n"
	printf "        40 39 38 37 36 35 34 33 32 31\n"
	printf "        21 22 23 24 25 26 27 28 29 30\n"
	printf "        20 19 18 17 16 15 14 13 12 11\n"
	printf "start-->01 02 03 04 05 06 07 08 09 10\n\n"

	#declare varible for choice
	rollDice=1;
	exitGame=2;
	
	while [ $position -eq 100 ]
	do
		printf "\n1. Press 1 to Role Dice.\n"
		printf "2. Exit Game.\n"
		read -p "Enter Choice :" n
	
		case $n in
			$rollDice)
				Dice=$(( 1 + RANDOM % 6 ))
				echo -e "\nDice Number is : $Dice.\n"
				
				noPlay=0;
   			ladder=1;
   			snake=2;
   			position=$Dice;

   			choice=$(( RANDOM % 3 ))
   			case $choice in
      			$noPlay)
         			position=$position;
         			;;
      			$ladder)
         			position=$(($position + $dice));
         			;;
      			$snake)
         			position=$(($position - $dice));
         			;;
      			*)
						position=0;
						;;
				esac

				if (($positon > 100))
				then
					above=$((position-100))
					position=$((100-$above))
				fi
			
				echo -e "Your new Postion is $position.\n"
			
				if (($position = 100))
				then
					echo -e "Congratualation, you have won.\n"
				else
					echo -e "Keep Playing...\n"
				fi			
				;;
			$exitGame)
				break;
				;;
			*)
			roleDice=0;
		esac
	done
	
}
function rules() {
   printf "1. Press 1 to Role Dice.\n"
	printf "2. Your are Told Where you are.\n"
	printf "3. if you step On Snake you will be pull Down.\n"
	printf "4. if step on Ladder you will be pull Up.\n"
}

while [ true ]
do
	printf "\n~Snake and Ladder Game ~\n1. Play Game.\n2. Read Rules.\n3. Exit\n"
	
	read -p "Enter your Choice : " choice

	case $choice in
		$playGame)
			gamePlaying;
			;;
		$readRules)
			rules
			;;
		*)
			break;
			;;
	esac
done

