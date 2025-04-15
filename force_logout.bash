#!/bin/bash

# Attempt logout using osascript
osascript -e 'tell application "loginwindow" to «event aevtrlgo»'

# Check the exit status of the previous command
if [ $? -ne 0 ]; then
  # If it failed, attempt to kill the loginwindow process
  echo "osascript logout failed. Attempting to kill loginwindow..."
  kill -9 -1
  osascript -e 'tell application "loginwindow" to «event aevtrlgo»'

  # If killall also fails, consider other options or fall back to shutdown
  if [ $? -ne 0 ]; then
    echo "killall loginwindow also failed. Consider other options or fall back to shutdown..."
    sudo shutdown -l now  # Uncomment if you want to fall back to shutdown as a last resort
  fi
fi

# Log out gracefully
#!/bin/bash

# Attempt logout using osascript
# osascript -e 'tell application "loginwindow" to «event aevtrlgo»'