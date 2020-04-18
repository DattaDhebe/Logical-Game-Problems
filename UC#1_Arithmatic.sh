#!/bin/bash -x

read -p "Enter first number : " a
read -p "Enter second number : " b
read -p "Enter Third Number : " c

UseCase2=$(($a + $b * $c))

UseCase3=$(($a * $b + $c))

UseCase4=$(($c * $a / $b))

UseCase5=$(($a % $b + $c))

compute[uc1]=$UseCase2
compute[uc2]=$UseCase3
compute[uc3]=$UseCase4
compute[uc4]=$UseCase5

echo "${compute[@]}"
