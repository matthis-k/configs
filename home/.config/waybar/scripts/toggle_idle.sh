#/bin/bash

if [[ -z $(ps -a | rg swayidle) ]]; then
    swayidle &
else
    pkill swayidle
fi
