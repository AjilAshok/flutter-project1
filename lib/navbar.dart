import 'package:flutter/material.dart';
import 'package:sample2/home.dart';
import 'package:sample2/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class navBar extends StatelessWidget {
  const navBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.red[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Ajil'),
              accountEmail: Text('ajil123'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.pixelstalk.net/wp-content/uploads/2016/07/Pictures-3D-Amazing-Download.jpg'),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              title: Text(
                'About US',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => null,
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.all_out_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Help',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => null,
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.login_sharp,
                color: Colors.white,
              ),
              title: Text(
                'LogOut',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Are you want to leave"),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove('email');
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return Login();
                            }));
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'No',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
