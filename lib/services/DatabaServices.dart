import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kabarnagari/Loading/Loading.dart';
import 'package:kabarnagari/SharedPreference/SessionManager.dart';

import 'package:kabarnagari/services/APIClient.dart';
import 'package:kabarnagari/ui/HomeScreen.dart';
import 'package:kabarnagari/ui/LoginScreen.dart';
import 'package:toast/toast.dart';
class Services{
  SharedPreference session=new SharedPreference();
  Loading loading=new Loading();

Future<void> register(BuildContext context, String nama, String telp,String email, String password) async {
  loading.loading1(context);

  final responseData = await http.post("$base_url/RestFullAPi/register", body: {
    "nama": nama,
    "email": email,
    "telp": telp,
    "pass": password
  });

  final data = jsonDecode(responseData.body);
  int value = data['value'];
  String pesan = data['message'];
//cek value 1 atau 0
  if (value == 1) {
    Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
    Navigator.pop(context);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>LoginScreen()
    ));

  } else if (value == 2) {
    Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
    Navigator.pop(context);
  } else {
    Toast.show("Tidak terkoneksi ke server", context,
        duration: 5, gravity: Toast.BOTTOM);
    Navigator.pop(context);
  }
}

  Future<void> delete(BuildContext context, String  id) async {
    loading.loading1(context);

    final responseData = await http.post("$base_url/RestFullAPi/hapus_berita", body: {
      "id": id
    });

    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
//cek value 1 atau 0
    if (value == 1) {
      Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>HomeScreen()
      ));
      sendNotification("Data News di hapus", "news");
    } else if (value == 0) {
      Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
      Navigator.pop(context);
    } else {
      Toast.show("Tidak terkoneksi ke server", context,
          duration: 5, gravity: Toast.BOTTOM);
      Navigator.pop(context);
    }
  }

void login(BuildContext context, String email, String password) async {
  loading.loading1(context);
  final responseData = await http.post("$base_url/RestFullAPi/login", body: {
    "email": email,
    "pass": password,
  });

  final data = jsonDecode(responseData.body);

  int value = data['value'];
  String pesan = data['message'];

// get data respon


// cek value 1 atau 0
  if (value == 1) {
    Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
    String nama = data['detail']['nama'];
    String email = data['detail']['email'];
    String phone = data['detail']['phone'];
    String id = data['detail']['id'];
    session.saveData(value, nama, email, phone,id);
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
      ModalRoute.withName('/LoginScreen'),
    );

  } else if (value == 0) {
    Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
    Navigator.pop(context);

  }
}

  Future<void> input_berita(BuildContext context, String judul, String kategori,String isi, String photo,String filename,String id) async {
    loading.loading1(context);

    final responseData = await http.post("$base_url/RestFullAPi/tambah_berita", body: {
      "judul": judul,
      "kategori": kategori,
      "isi": isi,
      "photo": photo,
      "id_user": id,
      "filename": filename,
    });


    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
//cek value 1 atau 0
    if (value == 1) {
      Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
      Navigator.pop(context);
      sendNotification("Data news berhasil ditambahkan", "news");
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>LoginScreen()
              
      ));

    } else if (value == 2) {
      Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
      Navigator.pop(context);
    } else {
      Toast.show("Tidak terkoneksi ke server", context,
          duration: 5, gravity: Toast.BOTTOM);
      Navigator.pop(context);
    }
  }
  Future<void> update_berita(BuildContext context, String judul, String kategori,String isi, String photo,String filename,String id) async {
    loading.loading1(context);

    final responseData = await http.post(
        "$base_url/RestFullAPi/update_berita", body: {
      "judul": judul,
      "kategori": kategori,
      "isi": isi,
      "photo": photo,
      "id_berita": id,
      "filename": filename,
    });


    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
//cek value 1 atau 0
    if (value == 1) {
      Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
      Navigator.pop(context);
      sendNotification("Data news berhasil di update", "news");
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginScreen()

      ));
    } else if (value == 2) {
      Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
      Navigator.pop(context);
    } else {
      Toast.show("Tidak terkoneksi ke server", context,
          duration: 5, gravity: Toast.BOTTOM);
      Navigator.pop(context);
    }
  }


  @override
  Future<void> sendNotification(String body, String title) async{
    String to = await  FirebaseMessaging().getToken();
    String serverToken='AAAAjbJE_Dc:APA91bEfBOeAFzbarsjSUuAp30n1i9b6KWxciMgKBHrAbExg-5c_GKePJGs4iZURT5579H_T2VGVJd9CgKb4Z5Wt6qIah1XhlVQz6S8f3jst-Aa18CP5sH_I6Rmh2_SdmCvUru92ni6T';
    await http.post('https://fcm.googleapis.com/fcm/send',
        headers: {
          'Content-Type':'application/json',
          'Authorization':'key=$serverToken'
        },
        body:jsonEncode({
          'notification':{
            'title':title,
            'body':body
          },
          'priority':'high',
          'data':{
            'click_action':'FLUTTER_NOTIFICATION_CLICK'
          },
          'to':'$to'
        })
    );
  }
}
