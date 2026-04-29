#!/bin/bash

CACHE_FILE="/tmp/tmux-status-cache"

prev_cpu_idle=0
prev_cpu_total=0
prev_rx=0
prev_tx=0
prev_time=0
disk_pct=
disk_time=0

[ -f "$CACHE_FILE" ] && source "$CACHE_FILE"

now=$(date +%s)

if [ $((now - disk_time)) -ge 60 ] || [ -z "$disk_pct" ]; then
    disk_pct=$(df / | awk 'NR==2{print $5}' | tr -d '%')
    disk_time=$now
fi

cpu_line=$(awk '/^cpu / {print $2,$3,$4,$5}' /proc/stat)
read cpu_user cpu_nice cpu_system cpu_idle <<< "$cpu_line"
cpu_total=$((cpu_user + cpu_nice + cpu_system + cpu_idle))

if [ "$prev_cpu_total" -gt 0 ]; then
    total_delta=$((cpu_total - prev_cpu_total))
    idle_delta=$((cpu_idle - prev_cpu_idle))
    if [ "$total_delta" -gt 0 ]; then
        cpu_used=$(( (total_delta - idle_delta) * 100 / total_delta ))
    else
        cpu_used=0
    fi
else
    cpu_used=0
fi

prev_cpu_idle=$cpu_idle
prev_cpu_total=$cpu_total

eval "$(free -m | awk 'NR==2{printf "mem_used=%d; mem_total=%d", $3, $2}')"
mem_pct=$((mem_used * 100 / mem_total))

net_rx_tx=$(awk 'NR>2 && $1!~/(lo|docker)/ {rx+=$2; tx+=$10} END{print int(rx), int(tx)}' /proc/net/dev)
read rx tx <<< "$net_rx_tx"

rx_rate=0
tx_rate=0
if [ "$prev_rx" -gt 0 ] && [ "$prev_tx" -gt 0 ] && [ "$prev_time" -gt 0 ]; then
    elapsed=$((now - prev_time))
    [ "$elapsed" -le 0 ] && elapsed=1
    rx_rate=$(( (rx - prev_rx) / elapsed / 1024 ))
    tx_rate=$(( (tx - prev_tx) / elapsed / 1024 ))
fi
[ "$rx_rate" -lt 0 ] && rx_rate=0
[ "$tx_rate" -lt 0 ] && tx_rate=0

prev_rx=$rx
prev_tx=$tx
prev_time=$now

cat > "$CACHE_FILE" <<EOF
prev_cpu_idle=$prev_cpu_idle
prev_cpu_total=$prev_cpu_total
prev_rx=$prev_rx
prev_tx=$prev_tx
prev_time=$prev_time
disk_pct=$disk_pct
disk_time=$disk_time
EOF

colorize() {
    local val=$1
    if [ "$val" -ge 80 ]; then
        printf "#[fg=red,bold]%d#[fg=colour75]" "$val"
    elif [ "$val" -ge 60 ]; then
        printf "#[fg=yellow]%d#[fg=colour75]" "$val"
    else
        printf "%d" "$val"
    fi
}

printf "#[fg=colour208,bold]#[fg=colour75]  C:%s%%  M:%s%%  D:%s%%  #[fg=colour34]↓%dK #[fg=colour208]↑%dK#[fg=colour75]" \
    "$(colorize "$cpu_used")" "$(colorize "$mem_pct")" "$(colorize "$disk_pct")" "$rx_rate" "$tx_rate"
