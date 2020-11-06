import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:kabarnagari/SharedPreference/SessionManager.dart';
import 'package:kabarnagari/services/DatabaServices.dart';
import 'package:toast/toast.dart';

class Validasi{
  Services service=new Services();
  valdasi_register(BuildContext context,String nama,String phone,String email,String password ){


    if (nama.isEmpty){
      Toast.show("Nama tidak boleh kosong", context,
          duration: 5, gravity: Toast.BOTTOM);
    }else if (phone.isEmpty){
      Toast.show("No telp tidak boleh kosong", context,
          duration: 5, gravity: Toast.BOTTOM);
    }else if (email.isEmpty){
      Toast.show("email belum diisi,Silahkan diisi", context,
          duration: 5, gravity: Toast.BOTTOM);
    }else if (!email.contains("@")){
      Toast.show("email tidak valid", context,
          duration: 5, gravity: Toast.BOTTOM);

    } else if(password.isEmpty){
      Toast.show("password belum diisi", context,
          duration: 5, gravity: Toast.BOTTOM);
    }else{
      service.register(context, nama, phone, email, password);

    }

  }

  valdasi_login(BuildContext context,String email,String password ){
    //DatabaseServices services = new DatabaseServices();
    if (email.isEmpty){
      Toast.show("Email tidak boleh kosong", context,
          duration: 5, gravity: Toast.BOTTOM);
    }else if (password.isEmpty){
      Toast.show("Password tidak boleh kosong", context,
          duration: 5, gravity: Toast.BOTTOM);
    }else{
      service.login(context, email, password);


    }

  }


  valdasi_post_berita(BuildContext context,String judul,String kategori,String isi,String photo,String filename,String id ){


    if (judul.isEmpty){
      Toast.show("Judul berita belum diisi", context,
          duration: 5, gravity: Toast.BOTTOM);
    }else if (kategori.isEmpty){
      Toast.show("Pilih kategori berita!", context,
          duration: 5, gravity: Toast.BOTTOM);
    }else if (isi.isEmpty){
      Toast.show("Content berita belum diisi", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else{
//      service.register(context, nama, phone, email, password);
    service.input_berita(context, judul, kategori, isi, photo,filename, id);

    }

  }


  valdasi_update_berita(BuildContext context,String judul,String kategori,String isi,String photo,String filename,String id ){


    if (judul.isEmpty){
      Toast.show("Judul berita belum diisi", context,
          duration: 5, gravity: Toast.BOTTOM);
    }else if (kategori.isEmpty){
      Toast.show("Pilih kategori berita!", context,
          duration: 5, gravity: Toast.BOTTOM);
    }else if (isi.isEmpty){
      Toast.show("Content berita belum diisi", context,
          duration: 5, gravity: Toast.BOTTOM);
    }else if (photo.isEmpty){
      Toast.show("Photo belum dipilih", context,
          duration: 5, gravity: Toast.BOTTOM);

    } else{
//      service.register(context, nama, phone, email, password);

      service.update_berita(context, judul, kategori, isi, photo,filename, id);
    }

  }
}