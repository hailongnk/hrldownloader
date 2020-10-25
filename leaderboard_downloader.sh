#!/bin/sh

# echo "num arguments $#"
if [ "$#" -ne 2 ]; then
  echo "  usage: leaderboard_downloader.sh url filename"
  echo "    url:      url to leaderboard, e.g: https://www.hackerrank.com/challenges/training-the-army/leaderboard"
  echo "    filename: output filename to store the results"
  echo "  e.g: leaderboard_downloader.sh https://www.hackerrank.com/challenges/training-the-army/leaderboard q3_usernames.log"
  exit 0
fi

# get url
# e.g https://www.hackerrank.com/challenges/training-the-army/leaderboard
#     https://www.hackerrank.com/challenges/training-the-army/leaderboard?page=38
challenge_url=$1

# get the filename
fn=$2

echo "Fetching leaderboard from $challenge_url"
fnfirstpage=$fn.page1.log
curl --request GET --url $challenge_url > $fnfirstpage

# get the total page of leaderboard
totalpage=$(awk -F 'page=' '{for(i=2;i<=NF;i++){print $i}}' $fnfirstpage | awk -F '"' '{print $1}' | sort -nr | head -n1)

# GET usernames
# dont downloaded firstpage again
usernames=$(awk -F 'username=' '{for(i=2;i<=NF;i++){print $i}}' $fnfirstpage | awk -F '"' '{print $2}')

# repeat for rest of the pages
for ((page=2; page<=totalpage; page++))
do
  nextpag=$challenge_url?page=$page
  fnnextpag=$fn.page$page.log
  echo "Preparing for page $nextpag"
  curl --request GET --url $nextpag > $fnnextpag
  usernames+=$(awk -F 'username=' '{for(i=2;i<=NF;i++){print $i}}' $fnnextpag | awk -F '"' '{print $2}')
  sleep 1
done

# echo "leaderboard: $usernames"
declare -i countuser=0
for n in $usernames
do
  countuser+=1
done

# writing the results
echo $usernames > $fn
echo "collected $countuser user(s) from $totalpage page(s)"
exit $totalpage
