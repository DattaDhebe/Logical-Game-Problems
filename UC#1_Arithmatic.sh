#!/bin/bash -x

read -p "Enter first number : " a
read -p "Enter second number : " b
read -p "Enter Third Number : " c

echo $(($c * $a / $b))
