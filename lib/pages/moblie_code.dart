import 'package:flutter/material.dart';
import 'package:online_coaching/components/mobile_login_form.dart';

class MobileLoginCode extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor: Colors.blue,
        body: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.lightBlueAccent,
                  Colors.blue
                ],
              )
          ),
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              new Container(
                  height: MediaQuery.of(context).size.height * .08,
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )
                  ),
                  alignment: Alignment.center,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        padding: new EdgeInsets.only(right: 140),
                        child: new Text(
                          'تایید شماره',
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
                height: MediaQuery.of(context).size.height * .1,
              ),
              new Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: new BoxDecoration(
                    color: Colors. white,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                height: MediaQuery.of(context).size.height * .6,
                child: new ListView(
                  children: <Widget>[
                    new Container(
                      height: MediaQuery.of(context).size.height * .1,
                      decoration:  new BoxDecoration(
                        color: Colors. white,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(8),
                      child: new Form(
                        child: new Container(
                          color: Colors.white,
                          height: 70,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Container(
                                color: Colors.white,
                                height: 50,
                                width: 50,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(8.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    hintText: "4",
                                  ),
                                ),
                              ),
                              new Container(
                                color: Colors.white,
                                height: 50,
                                width: 50,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(8.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    hintText: "3",
                                  ),
                                ),
                              ),
                              new Container(
                                color: Colors.white,
                                height: 50,
                                width: 50,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(8.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    hintText: "2",
                                  ),
                                ),
                              ),
                              new Container(
                                color: Colors.white,
                                height: 50,
                                width: 50,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(8.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    hintText: "1",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      color: Colors.white,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      margin: EdgeInsets.only(left: 50, right: 50),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: new Text('تایید', style: new TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30
                      ),),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}

