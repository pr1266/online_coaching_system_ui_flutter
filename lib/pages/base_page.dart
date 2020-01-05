import 'package:flutter/material.dart';
import 'package:online_coaching/pages/register.dart';
import 'package:online_coaching/pages/mobile_login.dart';

class BasePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.blue,

      body: new ListView(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height * .25,
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
                'ورود با شناسه کاربری',
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
                  'ورود با شماره موبایل',
                  style: new TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                onPressed: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new Directionality(textDirection: TextDirection.rtl, child: MobileLogin())));
                },
              )
          ),

          new Container(
            height: MediaQuery.of(context).size.height * .15,
          ),
          new Container(
            child: new Text(
              'آیا هنوز ثبت نام نکرده اید؟',
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
                  'ثبت نام',
                  style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                onPressed: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new Directionality(textDirection: TextDirection.rtl, child: RegisterPage())));
                },
              )
          ),
        ],
      ),
    );
  }
}