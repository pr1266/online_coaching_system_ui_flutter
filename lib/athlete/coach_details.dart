import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class CoachDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blue,
      child: new ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
              color: Colors.white,
            ),
            child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(right: 100),
          child: new Text(
            'روح الله میرحسینی',
            style: new TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        new Container(
          padding: new EdgeInsets.only(left: 20),
          child: new GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: new Icon(Icons.arrow_forward),
          ),
        )
      ],
        )
          ),
          new Container(
            height: MediaQuery.of(context).size.height * .02,
          ),
          new Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 12, left: 12),
                height: MediaQuery.of(context).size.height * .8,
                decoration: new BoxDecoration(
                  color: Colors.blue,
                ),
                child: new ListView(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * .4,
                      color: Colors.blue
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .3,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white,
                      ),
                      child: new ListView(
                        children: <Widget>[
                          new Container(
                            height: MediaQuery.of(context).size.height * .06,
                          ),
                          new Container(
                            alignment: Alignment.center,
                            child: new Text('افتخارات', style: TextStyle(fontSize: 30),),
                          ),
                          new Container(
                            child: new Text('ششسیشنیشکسینکشسینشکینشکسینشکسیمنشکسینشکمسینشکمسینشکمسینشکسمینشکسمینشکمسینشکسمینکشسمنیشسمکنیشسکیمنشسکیمنشکسمینشکسمینکشمسینکمشسنsdfsdfsdfsdfsdfsdfsdfskdfjd;hkf;lhkd;flgks;lfgkd;lkg;slkfd;kیکشمنسیکمشسنیکمشسنیکمشنسیکمشنسیکمشنسیکشمنسی',
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                            margin: EdgeInsets.only(right: 10, left: 10),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              new Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2
                  ),
                ),
                height: MediaQuery.of(context).size.height * .45,
                child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    new Container(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    new Center(
                      child: new Container(

                        height: MediaQuery.of(context).size.height * .1,
                        child: CircularProfileAvatar(
                          '',
                          backgroundColor: Colors.red,
                          radius: 100,
                        ),
                      ),
                    ),

                    new Container(
                      padding: EdgeInsets.only(right: 10),
                      height: MediaQuery.of(context).size.height * .05,
                      color: Colors.white,
                      child: new Text('نام : ', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    new Container(
                      padding: EdgeInsets.only(right: 10),
                      height: MediaQuery.of(context).size.height * .05,
                      color: Colors.white,
                      child: new Text('هادی چوپان', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    ),

                    new Container(
                      padding: EdgeInsets.only(right: 10),
                      height: MediaQuery.of(context).size.height * .05,
                      color: Colors.white,
                      child: new Text('مدرک : ', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    new Container(
                      padding: EdgeInsets.only(right: 10),
                      height: MediaQuery.of(context).size.height * .05,
                      color: Colors.white,
                      child: new Text('لیسانس تربیت بدنی', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    ),

                    new Container(
                      padding: EdgeInsets.only(right: 10),
                      height: MediaQuery.of(context).size.height * .05,
                      color: Colors.white,
                      child: new Text('استان : ', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    new Container(
                      padding: EdgeInsets.only(right: 10),
                      height: MediaQuery.of(context).size.height * .05,
                      color: Colors.white,
                      child: new Text('شیراز', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    new Container(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    new Container(
                      height: MediaQuery.of(context).size.height * .1,
                      color: Colors.yellow,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}