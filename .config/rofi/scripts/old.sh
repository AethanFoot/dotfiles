#!/bin/bash
MY_PATH=/home/aethan/.config/rofi/scripts
for i in $(seq 1 10); do
    # fd -H "${1}" "${HOME}" 2>/dev/null | sed "s/\/home\/$USER/\~/" | awk -v MY_PATH="${MY_PATH}" '{print $0"\0icon\x1f"MY_PATH"/icons/result.svg"}'
    fd -H "${1}" "${HOME}" 2>/dev/null | awk -v MY_PATH="${MY_PATH}" -v HOME="${HOME}" '{sub(HOME,"~")} {print $0"\0icon\x1f"MY_PATH"/icons/result.svg"}'
    # fd -H "${1}" "${HOME}" 2>/dev/null | sed "s|\(\/home\/$USER\)\(.*\)|\~\2\x0icon\x1f$MY_PATH\/icons\/result.svg|"
done
