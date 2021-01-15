#!/bin/bash

option=$(whiptail --title "Menü" --menu "Yapmak istediğiniz işlemi seçiniz" 15 >
"1" "Kullanıcı Adı Ekle" \
"2" "Kullanıcı Adı Ara" \
"3" "Kullanıcıları Listele" \
"4" "Kullanıcı Adı Sil" \
"5" "Çıkış Yap"  3>&1 1>&2 2>&3)

if [ $option = "1" ]
then
    AddUser=$(whiptail --inputbox --title "Kullanıcı Adı Ekle" "Kullanıcı adı g>
        echo $AddUser >> users.txt
elif [ $option = "2" ]
then
    SearchUser=$(whiptail --inputbox --title "Kullanıcı Adı Ekle"  "Aranacak ku>
        file="users.txt"
        if [ -s $file ]
        then

fi
Exit () {
    if (whiptail --fb --title"EXIT" --yesno "Are you sure you wana exit?" --yes>
            exit
    fi
}
