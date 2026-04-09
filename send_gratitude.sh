#!/data/data/com.termux/files/usr/bin/bash

MSG_FILE="$HOME/storage/shared/doc/gratitude.txt"
NUMBER_FILE="$HOME/storage/shared/doc/recipients.txt"

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

  sort -u "$NUMBER_FILE" | shuf | while IFS= read -r NUMBER; do
   if [[ -n "$NUMBER" ]]; then
     COUNT=0
     echo "Sending to: $NUMBER"
     termux-toast "Sending to $NUMBER"
     termux-sms-send -n "$NUMBER" "$MESSAGE"
     STAUTS=$?
     echo "termux-sms-send exit $STAUS"
     DELAY=$((30 + RANDOM % 31))
     echo "Sleeping for $DELAY seconds"
     termux-toast "Sleeping for $DELAY seconds..."
     sleep "$DELAY"
     COUNT=$((COUNT + 1 ))
     if (( COUNT % 10 == 0)); then
       echo "Cooling off for 2 minutes..."
       termux-toast "Cooling off for 2 minutes..."
     fi
   fi
done

echo "All messages sent."

} >> "$LOG" 2>&1
