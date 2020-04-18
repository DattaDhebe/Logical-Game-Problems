#!/bin/bash -x

read -p "Enter first number : " a
read -p "Enter second number : " b
read -p "Enter Third Number : " c

UseCase2=$(($a + $b * $c))

UseCase3=$(($a * $b + $c))

UseCase4=$(($c * $a / $b))

UseCase5=$(($a % $b + $c))

declare -A Compute

compute[computation1]=$UseCase2
compute[computation2]=$UseCase3
compute[computation3]=$UseCase4
compute[computation4]=$UseCase5
echo ${compute[@]}

UseCase[((counter++))]=$UseCase2
UseCase[((counter++))]=$UseCase3
UseCase[((counter++))]=$UseCase4
UseCase[((counter++))]=$UseCase5

echo ${UseCase[@]}


