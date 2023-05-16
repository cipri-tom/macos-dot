declare -a apps=(
    Firefox
    "Visual Studio Code"
    "Sublime Text"
    "iTerm"
    "Microsoft Teams"
    "Spotify"
    "/System/Applications/Utilities/Activity Monitor.app"
)
dockutil --remove all --no-restart

for i in "${!apps[@]}"; do
    app_name="${apps[$i]}"
    if [[ $app_name == /* ]]; then
        app_path=$app_name
    else
        app_path="/Applications/$app_name.app"
    fi
    echo $app_path
    dockutil --add "$app_path" --position "$((i+1))" --no-restart
done

killall Dock