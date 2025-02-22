#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Не вказано шлях до тестувальника"
  exit 1
fi

MAVKA=$(realpath $1)

TESTS=(
  "тести/тест_0" \
  "тести/тест_1" \
)

SUCCESS_COUNT=0
FAILED_COUNT=0

for test in ${TESTS[@]}; do
  echo -en "$test"
  result=$($MAVKA "$test")
  if [ $? -ne 0 ]; then
    echo -en ":\n\e[31m$result\e[0m\n"
    FAILED_COUNT=$((FAILED_COUNT+1))
  elif [ "$result" == "" ]; then
    echo -en ": \e[32mпройдено\e[0m\n"
    SUCCESS_COUNT=$((SUCCESS_COUNT+1))
  else
    echo -en ":\n\e[31m$result\e[0m\n"
    FAILED_COUNT=$((FAILED_COUNT+1))
  fi
done

echo -e "---"
if [ $SUCCESS_COUNT -eq 0 ]; then
  echo -e "Пройдено: $SUCCESS_COUNT"
else
  echo -e "Пройдено: \e[32m$SUCCESS_COUNT\e[0m"
fi
if [ $FAILED_COUNT -eq 0 ]; then
  echo -e "Провалено: \e[32m$FAILED_COUNT\e[0m"
else
  echo -e "Провалено: \e[31m$FAILED_COUNT\e[0m"
fi