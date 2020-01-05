import 'package:online_coaching/pages/base_page.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ثبت نام'),
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: Colors.blue,
      body: new ListView(
      children: <Widget>[
        new Container(
            height: MediaQuery.of(context).size.height * .2,
        ),
        new Container(
        color: Colors.blue,
        margin: EdgeInsets.only(left: 40, right: 40),
        height: MediaQuery.of(context).size.height * .1,
        child: new FlatButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(50.0),
          side: BorderSide(color: Colors.blue)
        ),
      child: new Text(
      'ثبت نام با شناسه کاربری',
      style: new TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 20
      ),
      ),
      onPressed: (){},
      )
      ),

      new Container(
      height: MediaQuery.of(context).size.height * .09,
      ),
      new Container(
      color: Colors.blue,
      margin: EdgeInsets.only(left: 40, right: 40),
      height: MediaQuery.of(context).size.height * .1,
      child: new FlatButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(50.0),
      side: BorderSide(color: Colors.blue)
      ),
      child: new Text(
      'ثبت نام با شماره موبایل',
      style: new TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 20
      ),
      ),
      onPressed: (){},
      )
      ),

      new Container(
      height: MediaQuery.of(context).size.height * .15,
      ),
      new Container(
      child: new Text(
      'آیا قبلا ثبت نام کرده اید؟',
      style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      alignment: Alignment.center,
      ),
      new Container(
      color: Colors.blue,
      margin: EdgeInsets.only(left: 40, right: 40),
      height: MediaQuery.of(context).size.height * .1,
      child: new FlatButton(
      color: Colors.green,
      shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(50.0),
      side: BorderSide(color: Colors.blue)
      ),
      child: new Text(
      'ورود',
      style: new TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20
      ),
      ),
      onPressed: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new Directionality(textDirection: TextDirection.rtl, child: BasePage())));
      },
      )
      ),
      ],
      ),
    );
  }
}