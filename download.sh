#!/bin/sh

Help() {
  echo "Leaderboard data downloader"
  echo
  echo "USAGE: bash download.sh [OPTION]"
  echo "options:"
  echo "-w    Download leaderboard for specific week."
  echo "        e.g: bash download.sh -w 3"
  echo "-h    Print this Help"
}

while getopts hw: option
do
  case "${option}"
  in
    w) week_num=${OPTARG}; echo "Processing week $week_num";;
    h) Help; exit;;
    *) Help; exit;;
  esac
done

# downloading the data
if [[ $week_num -eq 1 ]]
then
  # Week 1
  mkdir -p week_1
  bash leaderboard_downloader.sh \
    https://www.hackerrank.com/challenges/kindergarten-adventures/leaderboard   week_1/q1
  bash leaderboard_downloader.sh \
    https://www.hackerrank.com/challenges/find-the-running-median/leaderboard   week_1/q2
  bash leaderboard_downloader.sh \
    https://www.hackerrank.com/challenges/coin-change/leaderboard               week_1/q3

elif [[ $week_num -eq 2 ]]
then
  # Week 2
  mkdir -p week_2
  bash leaderboard_downloader.sh \
    https://www.hackerrank.com/challenges/halloween-party/leaderboard      week_2/q1
  bash leaderboard_downloader.sh \
    https://www.hackerrank.com/challenges/lovely-triplets/leaderboard      week_2/q2
  bash leaderboard_downloader.sh \
    https://www.hackerrank.com/challenges/training-the-army/leaderboard    week_2/q3

elif [[ $week_num -eq 3 ]]
then
  # Week 3
  mkdir -p week_3
  bash leaderboard_downloader.sh \
    https://www.hackerrank.com/challenges/unfair-game/leaderboard               week_3/q1
  bash leaderboard_downloader.sh \
    https://www.hackerrank.com/challenges/cloudy-day/leaderboard                week_3/q2
  bash leaderboard_downloader.sh \
    https://www.hackerrank.com/challenges/winning-lottery-ticket/leaderboard    week_3/q3

else
  echo "Unsupported week $week_num"
  echo "Please re-run with -h for Help"
  exit
fi
