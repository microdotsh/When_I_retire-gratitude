This project started when trying to distribute content via SMS to so many recipients that it was becoming cumbersome.  (Device software doesn't support RCS)

I created a BASH script to read a number file stored on my Android device and send the content of a seperate text file with some extra steps to avoid carrier filtering of automated distribution.

Scripts reads a message file for content to distribute 
Reads a recipient file in the following format:
  +1234567890
  +2345678901
  +3456789012

Number file gets shuffled to randomize order.

DELAY is randomized between sends.

EXTRA_LINE is added and randomized to help avoid duplicate content.

REQUSITES:
  Android
  Termux 
  Termux-API

OPTIONAL:
Tewrmux-widget

SET UP ENVIRONMENT:

Install requisites and download script
Run "termux-setup-storage" in Termux
Edit script to accommodate your directory structure and naming conventions
  If your message and recipients files are stored in the default "Documents" folder on internal storage, then adjust the following lines:
  MSG_FILE="$HOME/storage/shared/doc/gratitude.txt" --> MSG_FILE=$HOME/storage/shared/documents/content.txt
  NUMBER_FILE="$HOME/storage/shared/doc/recipients.txt" --> NUMBER_FILE="$HOME/storage/documents/numberss.txt"

Assuming script is in Downloads of internal storage, make script executable if not already.
  ~ $ chmod +x ~/storage/downloads/send_gratitude.sh
Copy script to ~/.shortcuts (assuming script is in "Downloads" folder on internal storage "sdcard":
  ~ $ cp ~/storage/download/send_gratitude.sh ~/.shortcuts
Use Termux-Widget to launch script from home screen.


Ultimately, because the content was so much, I decided to use the index.html here for the content, add pages and distribute the link instead.

Daily content can be found at https://microdotsh.github.io/On_awakening/
