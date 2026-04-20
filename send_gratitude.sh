#!/data/data/com.termux/files/usr/bin/bash

MSG_FILE="$HOME/storage/shared/doc/aa/gratitude.txt"
NUMBER_FILE="$HOME/storage/shared/doc/aa/recipients.txt"
LOG="/data/data/com.termux/files/home/sms_debug.log"

{
  echo "--- $(date) ---"
  echo "MSG: $MSG_FILE"

  if [ ! -f "$MSG_FILE" ]; then
    echo "Message file does not exist."
    exit 1
  fi

  if [ ! -f "$NUMBER_FILE" ]; then
    echo "Recipient list does not exist."
    exit 1
  fi

  MESSAGE=$(cat "$MSG_FILE")

  echo "Message contents:"
  echo "$MESSAGE"
  COUNT=0
  sort -u "$NUMBER_FILE" | shuf | while IFS= read -r NUMBER; do
   if [[ -n "$NUMBER" ]]; then
     EXTRA_LINES=(
     "Hope you had a great day!"
     "Stay salty and lit!"
     "Let's let God run it!"
     "Easy does it, but do it!"
     "Shoot for the bullseye!"
     "Faith without works is dead."
     "The greatest gift is the gift of sobriety."
     "We will not regret the past nor wish to shut the door on it."
     "Though we cannot control the world, we can control our response to it."
     )

     RANDOM_LINE=${EXTRA_LINES[$RANDOM % ${#EXTRA_LINES[@]}]}
     FINAL_MESSAGE="${MESSAGE}"$'\n\n'"${RANDOM_LINE}"
     echo "Sending to: $NUMBER"
     termux-toast "Sending to $NUMBER"
     
     termux-sms-send -n "$NUMBER" "$FINAL_MESSAGE"
     STATUS=$?
     echo "termux-sms-send exit $STATUS"
     
     DELAY=$((30 + RANDOM % 31))
     echo "Sleeping for $DELAY seconds"
     termux-toast "Sleeping for $DELAY seconds..."
     sleep "$DELAY"
     
     COUNT=$((COUNT++))
     if (( COUNT % 10 == 0)); then
       echo "Cooling off for 2 minutes..."
       termux-toast "Cooling off for 2 minutes..."
       sleep 120
     fi 
   fi
done

echo "All messages sent."

} >> "$LOG" 2>&1
