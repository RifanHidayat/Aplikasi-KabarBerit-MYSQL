
import 'package:flutter/material.dart';
import 'package:kabarnagari/ui/circular_image.dart';
import 'package:kabarnagari/ui/zoom_scaffold.dart';
import 'package:provider/provider.dart';


class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  final List<MenuItem> options = [
    MenuItem(Icons.add, 'Add News'),
    MenuItem(Icons.home, 'Home'),
    MenuItem(Icons.supervised_user_circle_rounded, 'Profile'),

  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 62,
            left: 32,
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2.9),
        color: Color(0xff454dff),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircularImage(
                    NetworkImage(imageUrl),
                  ),
                ),
                Text(
                  'Tatiana',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )

              ],
            ),

            SizedBox(height: 50,),
            Column(
              children: options.map((item) {
                return ListTile(
                  onTap: (){


                  },
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                );
              }).toList(),
            ),
            Spacer(),

            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.logout,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Logout',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
