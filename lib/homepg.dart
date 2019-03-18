import 'package:flutter/material.dart';
import 'settings.dart';


class homepg extends StatefulWidget {
  @override
  _homepgState createState() => _homepgState();
}

class _homepgState extends State<homepg> {
 

  

  final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('HOME'),
      ),
      BottomNavigationBarItem(icon: Icon(Icons.inbox), title: Text('Page')),
      BottomNavigationBarItem(icon: Icon(Icons.input), title: Text('test'))
    ],
  );

  List mycards = new List.generate(2, (i) => MyCards()).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: FlutterLogo(
            colors: Colors.blue,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.linear_scale,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              })
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: Container(
        child: Center(
          child: ListView(children: mycards),
        ),
      ),
    );
  }
}

class MyCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.insert_photo),
                Icon(Icons.insert_photo)
              ],
            ),
            Text("THIS IS SAMPLE TEXT"),
          ],
        ),
      ),
    );
  }
}
