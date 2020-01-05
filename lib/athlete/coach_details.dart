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