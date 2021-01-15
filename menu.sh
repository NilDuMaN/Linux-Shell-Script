#!/bin/bash
DATABASE_ADI='veri.txt'

kullanici_girme() {
  veri=$(whiptail --inputbox "Lütfen kaydedilecek kullanıcı adını giriniz giriniz" 15 50 3>&1 1>&2 2>&3)
  exitStatus=$?
  if [ $exitStatus = 0 ]; then
    if [ -z "$veri" ]; then
      whiptail --msgbox "Bu kullanıcı adı bulunamadı." 10 50
    else
      row_count="$(echo $data | xargs)"
      if [ -z "$row_count" ]; then
        whiptail --msgbox "Üzgünüm, boş veri kaydedilemez. Err-code: insert-1" 10 50
        return 0
      fi
      exitStatus=$?

      if [ $exitStatus -ne 0 ]; then
        whiptail --msgbox "Bir hata oluştu. Sonra tekrardan deneyiniz" 10 50
        return 0
      fi
      echo $veri >>$DATABASE_ADI
      whiptail --msgbox "Kullanıcı kaydı yapılmıştır." 10 50
    fi
  fi

  return 0
}
option=$(whiptail --title "Menü" --menu "Yapmak istediğiniz işlemi seçiniz" 15 60 7 \
"1" "Kullanıcı Adı Ekle" \
"2" "Kullanıcı Adı Ara" \
"3" "Kullanıcıları Listele" \
"4" "Kullanıcı Adı Sil" \
"5" "Çıkış Yap"  3>&1 1>&2 2>&3)


if [ $option = "1" ]
then
    kullanici_girme() 
elif [ $option = "2" ]
then
    SearchUser=$(whiptail --inputbox --title "Kullanıcı Adı Ekle"  "Aranacak kullanıcı adını giriniz" 15 30 --cancel-button "Cancel" 3>&1 1>&2 2>&3)
        file="users.txt"
        if [ -s $file ]
        then

fi

Exit () {
    if (whiptail --fb --title"EXIT" --yesno "Are you sure you wana exit?" --yes-button "YES" --no-buton "NO" 20 80); then
            exit
    fi
}
