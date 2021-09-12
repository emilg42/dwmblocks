#!/bin/sh

adapter="enp4s0"
log="$HOME/.wm/dwmblocks/stat/traffic"

# initial values
rx_1=$(cat /sys/class/net/$adapter/statistics/rx_bytes)
tx_1=$(cat /sys/class/net/$adapter/statistics/tx_bytes)

while sleep 1; do

    # re-read values
    rx_2=$(cat /sys/class/net/$adapter/statistics/rx_bytes)
    tx_2=$(cat /sys/class/net/$adapter/statistics/tx_bytes)
    
    # calculate/print deltas
    printf "%s %s" $(((rx_2-rx_1)/1024)) \
                   $(((tx_2-tx_1)/1024)) > $log

    # reset
    rx_1=$rx_2
    tx_1=$tx_2

done

