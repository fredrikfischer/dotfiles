#!/usr/bin/env sh

WP_FOLDER=~/Pictures/wallpapers
WAIT_TIME=10

while true; do
    # Hitta en slumpmässig bild
    FILE=$(find "$WP_FOLDER" -type f \( -name "*.png" -o -name "*.jpg" \) | shuf -n1)
    
    # Spara ID för den gamla processen innan vi startar en ny
    PID=$(pgrep swaybg)
    # Starta nya bakgrunden
    swaybg -i "$FILE" -m fill &
    
    # Vänta kort så den nya hinner ritas upp, döda sedan de gamla (om de finns)
    sleep 2
    if [ -n "$PID" ]; then
        kill $PID
    fi

    sleep "$WAIT_TIME"
done
