import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'file:///D:/Aplikasi_Android/Flutter/kabarnagari/lib/ui/DetailScreen.dart';
import 'package:kabarnagari/services/APIClient.dart';
import 'package:kabarnagari/services/DatabaServices.dart';


class WorldSection extends StatefulWidget {
  @override
  _WorldSectionState createState() => _WorldSectionState();
}

class _WorldSectionState extends State<WorldSection> {
  Map data;
  List dataNews = [];
  var loading = false;
  Map datadetail;
  dynamic producDataDetail;
  Services ser=new Services();
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(

        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                //menampilkan top news
                Text("Top News",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
                Container(
                  height: MediaQuery.of(context).size.height * 0.24,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataNews.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => DetailsScreen(
                              judul: dataNews[i]['judul'],
                              isi: dataNews[i]['isi'],
                              kategori: dataNews[i]['kategori'],
                              id_berita: dataNews[i]['id'],
                              id_user: dataNews[i]['id_user'],
                              waktu: dataNews[i]['waktu'],
                              photo: dataNews[i]['photo_url'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.36,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(dataNews[i]['photo_url']),
                            fit: BoxFit.cover,

                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.9)
                              ],
                              begin: Alignment.topCenter,
                              stops: [0.5, 1],
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),
                              Text(
                                dataNews[i]['judul'],
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${dataNews[i]['waktu']} ",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),


                //All nes
                Text("ALL News",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataNews.length,

                    itemBuilder: (ctx, i) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => DetailsScreen(
                              judul: dataNews[i]['judul'],
                              isi: dataNews[i]['isi'],
                              kategori: dataNews[i]['kategori'],
                              id_berita: dataNews[i]['id'],
                              id_user: dataNews[i]['id_user'],
                              waktu: dataNews[i]['waktu'],
                              photo: dataNews[i]['photo_url']
                             // photo:  dataNews[i]['photo_url'],

                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 400,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(dataNews[i]['photo_url']),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.9)
                              ],
                              begin: Alignment.topCenter,
                              stops: [0.5, 1],
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),
                              Text(
                                dataNews[i]['judul'],
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${dataNews[i]['waktu']} ",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Future getDataTopNews() async {
    setState(() {
      loading = true;
    });
    final response = await http.get("$base_url/RestFullAPi/tampil__all_berita");

    data = jsonDecode(response.body);
    print(data);

    dataNews = data["berita"];
    //untuk menampilkan di concole
    print(dataNews);
    setState(() {
      loading = false;
    });
  }
  Future getDataAllNews() async {
    setState(() {
      loading = true;
    });
    final response = await http.get("$base_url/RestFullAPi/tampil__all_berita");

    data = jsonDecode(response.body);
    print(data);

    dataNews = data["berita"];
    //untuk menampilkan di concole
    print(dataNews);
    setState(() {
      loading = false;
    });
  }


  @override
  void initState() {
    getDataAllNews();
    print("sss");


    // TODO: implement initState
    super.initState();
  }
}
