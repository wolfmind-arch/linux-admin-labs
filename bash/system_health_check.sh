#!/bin/bash
echo "=============================="
echo "     SYSTEM HEALTH CHECK      "
echo "=============================="

show_user(){
    echo "User: $(whoami)"
}

show_hostname(){
    echo "Hostname: $(hostname)"
}

show_ipaddres(){
    echo "Hostname: -I: $(hostname -I)"
}

show_uptime(){
    echo "Uptime:"
    uptime
}

show_ram_usage(){
    echo "Ram usage:"
    free -h
}

show_disc_usage(){
    echo "Disc usage:"
    df -h
}

show_ssh_status() {
    echo "SSH Status:"
    if [ "$(systemctl is-active ssh)" = "active" ]; then
        echo "[OK] SSH is running"
    else
        echo "[Error] SSH is not running"
    fi
}

show_top_5_processes(){
    echo "Top 5 Processes:"
    ps aux --sort=-%cpu | head -6

}


show_user
show_hostname
show_ipaddres
show_uptime
show_ram_usage
show_disc_usage
show_ssh_status
show_top_5_processes