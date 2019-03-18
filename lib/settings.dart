import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  final _formstate = GlobalKey<FormState>();
  final snackbar=SnackBar(content:Text("Enter Name"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 100.0, right: 100.0, top: 100.0),
                child: InkWell(
                  //this is the placeholder icon for adding profile pictures
                  child: Image.asset("assets/ellipse_DPHolder.png"),
                ),
              ),
              Form(
                key: _formstate,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    //Textfield for taking Name input
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        labelText: "NAME"),validator: (value){
                        if(value.isEmpty)
                         Scaffold.of(context).showSnackBar(snackbar);
                        },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
