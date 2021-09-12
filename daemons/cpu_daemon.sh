while :; do

    # cpu utilization
    printf "$(top -bn2 | grep "Cpu(s)"| tail -n 1 | awk '{ printf "%.1f", $2+$4}')"  > /home/emil/.wm/dwmblocks/stat/cpu


done