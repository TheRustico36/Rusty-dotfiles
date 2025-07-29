#!/bin/sh

echo "Hello $USER, welcome to the dotfiles installer."
echo
echo "Choose an option:"
echo "1. Setup all"
echo "2. Go through each step"
printf "Selection: "
read option

if [ "$option" = "1" ]; then
    echo
    echo "This will setup everything and override your current settings for some programs."
    echo "Check README.md or look at the script to see exactly what it touches."
    printf "Proceed? (y/N): "
    read confirm
    if [ "$confirm" = "y" ]; then
        find . -mindepth 1 -maxdepth 1 ! -name '.git' ! -name 'README.md' | while read file; do
  cp -r "$file" "$HOME"
done
        mkdir -p "$HOME/Pictures"
        cp -r Wallpapers "$HOME/Pictures"
        echo "Done!"
    else
        echo "Setup aborted."
    fi
elif [ "$option" = "2" ]; then
    mkdir -p "$HOME/Pictures"

    echo
    ls .themes
    printf "Copy .themes? (Y,n): "
    read confirm
    if [ "$confirm" = "n" ]; then
        echo "Skipped!"
    else
        cp -r .themes "$HOME"
        echo "Copied!"
    fi

    echo
    ls .config
    printf "Copy .config? (Y,n): "
    read confirm
    if [ "$confirm" = "n" ]; then
        echo "Skipped!"
    else
        cp -r .config "$HOME"
        echo "Copied!"
    fi

    echo
    less .kshrc
    printf "Copy .kshrc and .profile? (Y,n): "
    read confirm
    if [ "$confirm" = "n" ]; then
        echo "Skipped!"
    else
        cp .kshrc "$HOME" && cp .profile "$HOME"
        echo "Copied!"
    fi

    echo
    ls Wallpapers
    printf "Copy Wallpapers? (Y,n): "
    read confirm
    if [ "$confirm" = "n" ]; then
        echo "Skipped!"
    else
        cp -r Wallpapers "$HOME/Pictures"
        echo "Copied!"
    fi

    echo
    echo "All done!"
else
    echo "Invalid option."
fi

