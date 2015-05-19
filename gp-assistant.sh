#!/bin/bash
# Bash script for helping with GpuPlotGenerator linux parameters by Kartojal

hello(){
    email="burstcoin.es@gmail.com"
    plotter="GpuPlotGenerator 4.0.1 by Cryo"

    echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "Welcome to the GpuPlotter Assistant 1.0 by Kartojal"
    echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
    echo -e "This script will help you with GPU plotting in direct mode with ${plotter}, so you don't need to optimize it later. If you find some bugs, please, send me a email to \"${email}\".\n"
    sleep 1
    echo -e "Now will start a few questions, needed for plotting:\n" 
    sleep 1

}
plotting() {
    for (( x = 1 ; $x <= $nplot ; x+=1 ));
    do
        echo "Generating plot number ${x}."
        sleep 1
        ./gpuPlotGenerator generate direct "$dir"/"$burstid"_"$startnonce"_"$nonces"_"$stagger"
        if [ $? -eq 0 ] ;
        then
            echo "Plot "$startnonce" has been generated."
            startnonce=$(( $startnonce + 1 + $nonces ))
        else
            echo "Error generating plot "$starnonce", exiting..."
            exit 1
            # Se sale con exit 1 para salir diréctamente del script, con código de error 1, no solo de la función.
        fi
    done
    echo "All plots are genererated succesfully in the directory \"${dir}\". Happy BURST mining by Kartojal."
    return
}
questions(){
    while [[ -z "$nplot" ]]
    do
        read -p "Enter the number of plots you will generate: " nplot
    done 

    while [[ -z "$plotsize" ]]
    do
        read -p "Enter plot size number in GBytes, less than 200 GB recommended: " plotsize
    done 

    totalplotsize=$(( $plotsize * $nplot ))

    nonces=$(( $plotsize * 1024 * 1024 / 256 ))

    read -p "Enter the start nonce, if is your first time, just press [ENTER]: " startnonce
    startnonce="${startnonce:=0}"

    while [[ -z "$burstid" ]]
    do
        read -p "Enter your numerical BURST ID: " burstid
    done 

    while [[ -z "$stagger" ]]
    do
        read -p  "Enter stagger size (8192 if your card is good, if not, try the half): " stagger
    done 

    read -p "Enter your plot directory path (Press [ENTER] for plotting HERE): " dir
    dir="${dir:=.}"
    
}
diskspace(){
    echo -e "Checking free disk space... \n"
    sleep 1
    freedisk=$(df ${dir} -k -BG  --output=avail | tail -1 | tr -d 'G' | tr -d ' ')
    if [ $freedisk -gt $totalplotsize ];
    then
        echo "You have sufficient disk space for plotting in ${dir}, ${freedisk} GB of free space."
        return
    else
        echo "ERROR, you don't have sufficient space left in your system. "
        exit 2
    fi

}
info(){
    echo "Will start in the nonce number "${startnonce}
    echo "Every plot will have "$nonces" nonces."
    echo "The total space that do you need in disk is: ${totalplotsize} GB " 
    diskspace
    return
}
# MAIN
hello
questions
info

while [[ -z "$yesno" ]]
do
    read -p  "Are you sure to start plotting?(yes/no):" yesno
done 
if [ $yesno == "yes" ] ; 
then
    plotting
    exit 0
else
    echo "Exiting..."
    exit 0
fi

