import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabarnagari/services/APIClient.dart';
import 'package:kabarnagari/style/constants.dart';
import 'package:kabarnagari/validator/validasi.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';




class EditDataScreen extends StatefulWidget {
  String judul,kategori,isi,photo,id;
  EditDataScreen({this.judul,this.isi,this.photo,this.id,this.kategori});
  @override
  _EditDataScreenState createState() => _EditDataScreenState();
}
class _EditDataScreenState extends State<EditDataScreen > {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime backButtonPressTime;
  var datalat, datalong;

  String imageUrl;

  File image;
  String id;
  String filename;
  String value;
  String kategori;

  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String error = 'Error';

  BuildContext context;
  var judul = new TextEditingController();
  var isi = new TextEditingController();
  int _value;
  Validasi validasi=new Validasi();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: FlatButton(
          onPressed: () {
          },
          child: Container(
            child: Image.asset("assets/images/menu.png"),
          ),
        ),
        title: Center(
          child: Text(
            "Update News",
            style: TextStyle(
              fontFamily: "Sigmar",
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 12,
            ),

          )
        ],
      ),
      key: scaffoldKey,
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 30),
              child: Column(
                children: <Widget>[
                  _buildJudul(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildKategori(),
                  _buildIsi(),
                  SizedBox(
                    height: 40,
                  ),
                  _photo(),

                  SizedBox(
                    height: 20.0,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //btn simpan
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () {
                        if (_value == 0) {
                          kategori = "";
                        }
                        if (_value == 1) {
                          kategori = "Bussiness";
                        }
                        if (_value == 2) {
                          kategori = "Poitics";
                        }
                        if (_value == 3) {
                          kategori = "Science";
                        }
                        if (_value == 4) {
                          kategori = "Tech";
                        }else{
                          kategori = "";
                        }
                        validasi.valdasi_update_berita(context,judul.text, kategori, isi.text,base64Image,filename,id);
                      },
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      child: Text(
                        'Update Data',
                        style: TextStyle(
                          color: Color(0xFF527DAA),
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _photo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: new BorderRadius.circular(5.0),
      ),
      width: double.infinity,
      height: 200,
      child: Stack(
        children: <Widget>[
          //Image.file(image, width:double.infinity),
          Container(
              child: image != null
                  ? Image.file(
                image,
                width: double.maxFinite,
                height: 200,
                fit: BoxFit.fill,
              )
                  : Image.network(imageUrl,
                width: double.maxFinite,
                height: 200,
                fit: BoxFit.fill,),


          ),

          InkWell(
            onTap: () {
              getImage();
            },
            child: Center(
              child: Icon(
                Icons.camera_alt,
                size: 50,
                color: Colors.black45,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildJudul() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            controller: judul,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.drive_file_rename_outline,
                  color: Colors.black45,
                ),
                hintText: "Masukan Judul Berita",
                hintStyle: kHintTextStyleLabel,
                labelText: "Judu berita",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: new BorderRadius.circular(5.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: new BorderRadius.circular(5.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildIsi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 120.0,
          child: TextFormField(
            maxLines: 25,
            controller: isi,
            keyboardType: TextInputType.multiline,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.description,
                  color: Colors.black45,
                ),
                hintText: "Masukan Content berita",
                hintStyle: kHintTextStyleLabel,
                labelText: "Content",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: new BorderRadius.circular(5.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: new BorderRadius.circular(5.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildKategori() {
    return Container(

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,

            border: Border.all()),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text(
                        "--pilih Kategori-- "),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Text("Business"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Politics"),
                    value: 2,
                  ),
                  DropdownMenuItem(child: Text("Science"), value: 3),
                  DropdownMenuItem(child: Text("Tech"), value: 4),

                ],
                onChanged: (value) {

                  setState(() {
                    _value = value;
                  });
                })),
      ),

    );
  }

  void proses_Pengiriman(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Loading...."),
                    SizedBox(
                      height: 30,
                    ),
                    CircularProgressIndicator(
                      backgroundColor: Colors.blue[250],
                    ),
                  ],
                ),
              ));
        });
  }



  Future getImage() async {
    await Permission.photos.request();

    var PermissionStatus = await Permission.photos.status;
    if (PermissionStatus.isGranted) {
      var selectedImage =
      await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        image = File(selectedImage.path);

        filename = "$base_url/";
        base64Image = base64Encode(image.readAsBytesSync());
        //filename = image.path.split('/').last;
        print("nama file $filename");

      });
      // Toast.show(filename, context, duration: 5, gravity: Toast.BOTTOM);
    } else {
      print('Grant Permissions and try again');
    }
  }


  getDataPref() async {



  }
  @override
  void initState() {
    judul.text=widget.judul;
    isi.text=widget.isi;
    imageUrl=widget.photo;
    id=widget.id;
    if (widget.kategori=="Bussness"){
      _value=1;

    }else if (widget.kategori=="Politics"){
      _value=2;


    }else if(widget.kategori=="Science"){
      _value=3;

    }else if(widget.kategori=="Texh"){
      _value=4;

    }

    getDataPref();
    // TODO: implement initState
    super.initState();
  }

}

