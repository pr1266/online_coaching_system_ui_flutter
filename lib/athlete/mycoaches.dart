import 'package:flutter/material.dart';

class CoachPages extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CoachPages_();
  }
}
class CoachPages_ extends State<CoachPages>{

  var coach_list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData()async{}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blue,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height * .08,
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                )
            ),
            child: new Text('مربی های من', style: new TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),),
            alignment: Alignment.center,
          ),
          new Container(
            height: MediaQuery.of(context).size.height * .1,
          ),
          coach_list.length != 0 ?
              new ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return new Container(
                    height: MediaQuery.of(context).size.height * .4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          child: Image.network('sss'),
                        ),
                        new Container(
                          child: new Text('sss' , style: new TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                  );
                  // TODO inja bayad besazish:
                }
              )
              : null,
        ],
      ),
    );
  }
}