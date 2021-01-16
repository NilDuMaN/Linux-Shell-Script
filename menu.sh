#!/bin/bash
DATABASE='veri.txt'

kullanici_girme() {
  veri=$(whiptail --inputbox "Lütfen kaydedilecek kullanıcı adını giriniz giriniz" 15 50 3>&1 1>&2 2>&3)
  if [ -z "$veri" ]
  then
    whiptail --msgbox "Bu kullanıcı adı bulunamadı." 10 50
  else
    echo $veri >>$DATABASE
    whiptail --msgbox "Kullanıcı kaydı yapılmıştır." 10 50
  fi

  return 0
}
kullanici_arama() {
  veri=$(whiptail --inputbox "Lütfen aranacak kullanıcı adını giriniz" 15 60 3>&1 1>&2 2>&3)
  veriler=$(cat $DATABASE | grep -n $veri)
  if [ -z "$veri" ]
  then
    whiptail --msgbox "Üzgünüm, arama yapılacak bir veri bulunamadı." 10 50
  else
    whiptail --msgbox "İçerisinde '$veri:\n----------\nSatır Numarası:Kayıt\n----------\n${veriler[@]}" 30 100
  fi

  return 0
}

listele() {
  if [ -e $DATABASE ]
  then
    if [ -s $DATABASE ]
    then
      whiptail --textbox $DATABASE 20 100 --scrolltext
    else
      whiptail --msgbox "Üzgünüm, bu kullanıcı dosyasında veri bulunmuyor." 10 50
    fi
  else
    whiptail --msgbox "Üzgünüm, bir kayıt dosyası bulunamadı." 10 50
  fi

  return 0
}

kayit_silme() {
  veri=$(whiptail --inputbox "Hangi kullnıcıyı silmek istersiniz?" 10 50 3>&1 1>&2 2>&3)

  if [ -z "$veri" ]
  then
    whiptail --msgbox "Üzgünüm, silmek için bir anahtar kelime verilmedi." 10 50
  else
    veriler="$(grep -v $veri $DATABASE)"
    echo "${veriler[@]}" >$DATABASE
  fi

  return 0
}

cikis() {
  if (whiptail --title "Çıkış" --yesno "Çıkmak istediğinize emin misiniz ?" 10 20) 
  then
    exit 0
  fi
}

while :; do
  secim=$(whiptail --title "Menü" --menu "Yapmak istediğiniz işlemi seçiniz" 15 60 7 \
    "1" "Kullanıcı Adı Ekle" \
    "2" "Kullanıcı Adı Ara" \
    "3" "Kullanıcıları Listele" \
    "4" "Kullanıcı Adı Sil" \
    "5" "Çıkış Yap" 3>&1 1>&2 2>&3)

  case $secim in
  1) kullanici_girme ;;
  2) kullanici_arama ;;
  3) listele ;;
  4) kayit_silme ;;
  5) cikis ;;
  *) exit 0 ;;
  esac
done
