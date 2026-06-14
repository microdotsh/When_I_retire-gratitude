This project started when trying to distribute content via SMS to so many recipients that it was becoming cumbersome.  (Device software doesn't support RCS)

I created a BASH script to read a number file stored on my Android device and send the content of a seperate text file with some extra steps to avoid carrier filtering of automated distribution.

Scripts reads a message file for content to distribute

Reads a recipient file in the following format:  
  ```text
  +1234567890
  +2345678901
  +3456789012
  ```

Number file gets shuffled to randomize order.  
DELAY is randomized between sends and has a cool off period for every 10 recipients.  
EXTRA_LINE is added and randomized to help avoid duplicate content.

REQUSITES:
    Android  
    Termux  
    Termux-API  
    
OPTIONAL:  
    Termux-widget

SET UP ENVIRONMENT:

Install requisites and configure:  

  Termux:  
  Run termux-setup-storage - This will expose internal storage and allow acces via ~/storage/shared ($HOME/storage/shared)  
    
   ```
   ~ $ termux-setup-storage     
   ```  
    
  Run pkg install termux-api AFTER the termux-API app in installed on Android  
  
   ```
   ~ $ pkg install termux-api     
   ```  
    
  Termux-API:  
    Open and grant permissions - GrapheneOS required to allow restricted permissions to enable draw over other apps (required for termux-toast, which is optional)  
    
download script  

Edit script to accommodate your directory structure and naming conventions (This could be done more easily with a text editor on PC or mobile device rather than with something like nano inside termux)  

If your message and recipients files are stored in the default "Documents" folder on internal storage, then adjust the following lines:  

  MSG_FILE="$HOME/storage/shared/doc/aa/gratitude.txt" --> "MSG_FILE=$HOME/storage/shared/path/to/content_to_send.ext"  
  NUMBER_FILE="$HOME/storage/shared/doc/aa/recipients.txt" --> NUMBER_FILE="$HOME/storage/path/to/numbers_to_send_to_file.ext"  

Assuming script is in Download of internal storage, make script executable & copy script to ~/.shortcuts - assuming script is in "Download" folder (internal storage | sdcard | storage/emulated/0)  

In termux: 

```
  ~ $ chmod +x ~/storage/shared/Download/send_gratitude.sh && cp ~/storage/shared/Download/send_gratitude.sh ~/.shortcuts
```

Use Termux-Widget to launch script from home screen.

Ultimately, because the content was so much, I decided to use the index.html here for the content, add pages and distribute the link instead.

Daily content can be found at https://microdotsh.github.io/When_I_retire-gratitude/
