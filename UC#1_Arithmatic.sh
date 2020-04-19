#!/bin/bash -x

read -p "Enter first number : " a
read -p "Enter second number : " b
read -p "Enter Third Number : " c

UseCase2=$(($a + $b * $c));
UseCase3=$(($a * $b + $c));
UseCase4=$(($c * $a / $b));
UseCase5=$(($a % $b + $c));

declare -A compute

compute[1]=$UseCase2;
compute[2]=$UseCase3;
compute[3]=$UseCase4;
compute[4]=$UseCase5;


dictionary=${compute[@]};
echo $dictionary

for ((count=1; count<=4; count++))
do
	arr[$count]=${compute[$count]};
	echo ${arr[$count]};
done

for ((count=1; count<=4; count++))
do
	for ((inner_count=$count; inner_count<=4; inner_count++))
	do
		if [ ${arr[count]} -gt ${arr[inner_count]} ]
		then
			temp=${arr[count]};
			arr[$count]=${arr[$inner_count]};
			arr[$inner_count]=$temp;
		fi
	done
done

echo "Decsending order Result : "
for((count=1; count<=4; count++))
do
	echo ${arr[$count]}
done


