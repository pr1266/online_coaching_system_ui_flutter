import 'package:flutter/material.dart';
import 'package:online_coaching/pages/register.dart';
import 'package:online_coaching/pages/mobile_login.dart';
import 'package:online_coaching/pages/username_login.dart';

class BasePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: new ListView(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height * .2,
          ),
          new Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: new ListView(
              shrinkWrap: true,
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                new Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    height: MediaQuery.of(context).size.height * .1,
                    child: new FlatButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.white)
                      ),
                      child: new Text(
                        'ورود با شناسه کاربری',
                        style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new Directionality(textDirection: TextDirection.rtl, child: UserNameLogin())));
                      },
                    )
                ),
                new Container(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                new Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    height: MediaQuery.of(context).size.height * .1,
                    child: new FlatButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.white)
                      ),
                      child: new Text(
                        'ورود با شماره موبایل',
                        style: new TextStyle(
                            color: Colors.white,
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
                  height: MediaQuery.of(context).size.height * .1,
                ),
                new Container(
                  child: new Text(
                    'آیا هنوز ثبت نام نکرده اید؟',
                    style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  alignment: Alignment.center,
                ),
                new Container(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                new Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 50, right: 50),
                    height: MediaQuery.of(context).size.height * .07,
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
                new Container(
                  height: MediaQuery.of(context).size.height * .05,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}