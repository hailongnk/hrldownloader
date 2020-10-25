#!/bin/sh

# Week 1
mkdir -p week_1
bash leaderboard_downloader.sh \
  https://www.hackerrank.com/challenges/kindergarten-adventures/leaderboard   week_1/q1
bash leaderboard_downloader.sh \
  https://www.hackerrank.com/challenges/find-the-running-median/leaderboard   week_1/q2
bash leaderboard_downloader.sh \
  https://www.hackerrank.com/challenges/coin-change/leaderboard               week_1/q3

# Week 2
mkdir -p week_2
bash leaderboard_downloader.sh \
  https://www.hackerrank.com/challenges/halloween-party/leaderboard      week_2/q1
bash leaderboard_downloader.sh \
  https://www.hackerrank.com/challenges/lovely-triplets/leaderboard      week_2/q2
bash leaderboard_downloader.sh \
  https://www.hackerrank.com/challenges/training-the-army/leaderboard    week_2/q3

