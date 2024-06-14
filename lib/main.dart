import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Infos.dart';
import 'package:flutter_application_1/Search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectIndex=0;

  void _onTapItem(int index){
    //_selectIndex=index;
    setState(() {
      _selectIndex=index;
    });
    //print(_selectIndex);
  }

  static final List<Widget> _noption=<Widget>[
    //Text("Home"),
    //Text("Search"),
    //Text("Info"),
    Home(),
    Search(),
    Infos(),
  ];
    
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Bottom Navigation Bar"),
        ),
        /*************************************/
        drawer:Drawer(
          child: Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius:BorderRadius.circular(60),
                        child: Image.asset('assets/images/profileTwo.jpg'),
                        ),
                    )
                  ],
                ),
                Divider(
                  thickness: 7,
                ),
                ListTile(
                  onTap: (){
                    print("Home");
                  },
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
                Divider(
                  thickness: 7,
                ),
                ListTile(
                  onTap: (){
                    print("About us");
                  },
                  leading: Icon(Icons.help),
                  title: Text("About us"),
                ),
                Divider(
                  thickness: 7,
                ),
                ListTile(
                  onTap: (){
                    print("Contact us");
                  },
                  leading: Icon(Icons.phone),
                  title: Text("Contact us"),
                ),
                Divider(
                  thickness: 7,
                ),
                ListTile(
                  onTap: (){
                    print("Log out");
                  },
                  leading: Icon(Icons.logout_rounded),
                  title: Text("Log out"),
                ),
              ],
            ),
          ),
        ) ,
        /*************************************/
        body: _noption[_selectIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onTapItem,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.info),label: "Infos"),
          ],
        ),
      ),
    );
  }
}