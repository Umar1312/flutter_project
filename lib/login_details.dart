import 'package:flutter/material.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepg.dart';



class SecondPage extends StatefulWidget {
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
   
  final myController = new TextEditingController();
  final myController2 = new TextEditingController();
  final DocumentReference abc =
      Firestore.instance.collection('User IDs').document('Umar');
  String string;
  Text mytext = new Text("HELLO");
  

  fetch() {
    //function to get data
    abc.get().then((DocumentSnapshot datasnapshot) {
      string = datasnapshot.data['User id'];
      setState(() {
        mytext = Text(string);
      });
    });
  }
   add() //function to add data
  {
    Map<String, String> stringMap = <String, String>{
      "Name": myController.text.toString(),
      "College Name": myController2.text.toString()
      
    
    };

    abc.setData(stringMap);
     Navigator.push(context, MaterialPageRoute(builder: (context) => homepg()));
    
  }

  @override
  void dispose() {
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('LOGIN DETAILS'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25.0),
              width: 200.0,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Enter your name'),
                controller: myController2,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25.0),
              width: 200.0,
              child: TextFormField(
                controller: myController,
                decoration:
                    InputDecoration(labelText: 'Enter Your College Name'),
              ),
            ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  elevation: 20.0,
                  child: Text("SUBMIT"),
                  color: Colors.blue,
                  onPressed: add,
                
                  
                  
                ),
            ),
          )
          ],
        ));
  }
}
