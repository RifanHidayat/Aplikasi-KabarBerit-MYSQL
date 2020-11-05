import 'package:flutter/material.dart';
import 'package:kabarnagari/services/DatabaServices.dart';
import 'package:kabarnagari/ui/EditDataScreen.dart';


class DetailsScreen  extends StatefulWidget {
  final String judul,isi,kategori,waktu,id_user,id_berita,photo;
  DetailsScreen({this.judul,this.isi,this.kategori,this.waktu,this.id_user,this.id_berita,this.photo});

  @override
  DetailsScreen_State createState() => DetailsScreen_State();
}

class DetailsScreen_State extends State<DetailsScreen> {
  Services services=new Services();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.kategori,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                background: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: double.infinity,
                      child: Image.network(
                       widget.photo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                          begin: Alignment.topCenter,
                          stops: [0.6, 1],
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "News",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: "Sigmar"),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 45,
                                  decoration:
                                  BoxDecoration(shape: BoxShape.circle),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),

                                  ),
                                ),
                                Text(
                                  widget.waktu,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                widget.judul,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.isi,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Action",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditDataScreen(
                              isi: widget.isi,
                              judul: widget.judul,
                              id: widget.id_berita,
                              photo: widget.photo,
                              kategori: widget.kategori,
                            )
                        ));

                      },
                      child: Expanded(

                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:Colors.blue,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.edit,
                                color: Colors.white,
                              ),

                              Text(
                                "Update",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        confirm(widget.judul, widget.id_berita);
                      },
                      child: Expanded(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: 40,left: 60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.redAccent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.restore_from_trash,
                                  color: Colors.white,
                                ),

                                Text(
                                  "Delete",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }

  void confirm(String judul,String id) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: new Text(
                "Are You Sure Want to Delete $judul" ), actions: <Widget>[
            new RaisedButton(
                child: new Text(
                  'OK DELETE!',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () {
                  services.delete(context, id);
                  // deleteData();

                }),
            FlatButton(
                child: new Text(
                  'CANCEL',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context);

                }
            ),
          ],
          );

        }
    );


  }

}

