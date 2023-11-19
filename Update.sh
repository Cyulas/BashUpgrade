#!/bin/bash

#A SIMPLE UPDATE UTILITY FOR LINUX USING BASH

GREEN="\e[32m"
ENDCOLOR="\e[0m"

#UPDATE FUNCTION
sys_update(){
    echo -e "${GREEN}Starting Updates${ENDCOLOR}"
    sudo apt update
    echo -e "${GREEN}Updates Complete${ENDCOLOR}"
}

#UPGRADE FUNCTION WITH AUTO APPROVAL
sys_upgrade(){
    echo -e "${GREEN}Starting Upgrades${ENDCOLOR}"
    sudo apt upgrade -y
    echo -e "${GREEN}Upgrades Complete${ENDCOLOR}"
}

#AUTOREMOVE FUNCTION
sys_autoremove(){
    echo -e "${GREEN}Starting Clean Up${ENDCOLOR}"
    sudo apt autoremove -y
    echo -e "${GREEN}Clean Up Complete${ENDCOLOR}"
}

#UPGRADE DISTRIBUTION
sys_distribution(){
    echo -e "${GREEN}Starting Clean Up${ENDCOLOR}"
    sudo apt dist-upgrade
    echo -e "${GREEN}Clean Up Complete${ENDCOLOR}"
}

#FULL UPGRADE
sys_full_update_and_upgrade(){
    sys_update
    sys_upgrade
    sys_autoremove
}

#EXIT FUNCTION
utility_exit(){
    exit()
}

#OUTPUT WELCOME AND SELECTION SCREEN AND PROMPT USER TO SELECT OPTION
menu(){
    
    echo "\n${GREEN}Welcome to the Bash Update Utility."
    echo "Please select one of the following options.\n"

    echo "1. Update Repositories."
    echo "2. Upgrade Installed Packages."
    echo "3. Upgrade Distribution."
    echo "4. Full Update and Upgrade."
    echo "5. Exit.${ENDCOLOR}\n"
}

menu

read -p "Enter the number for the command you wish to run: " choice

case $choice in
    1) 
        sys_update
        ;;
    2)
        sys_upgrade
        ;;
    3)
        sys_distribution
        ;;
    4)
        sys_full_update_and_upgrade
        ;;
    5)
        utility_exit
        ;;
    *)
        echo "Invalid Choice"
        ;;
esac



