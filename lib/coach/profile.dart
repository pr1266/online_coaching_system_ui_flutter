import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height * .7,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(15)
        ),
      ),
      child: ListView(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height * .2,
            child: new Row(
              children: <Widget>[

              ],
            ),
          )
        ],
      ),
    );
  }
}