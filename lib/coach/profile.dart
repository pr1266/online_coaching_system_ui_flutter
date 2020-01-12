import 'package:flutter/material.dart';
import 'package:online_coaching/coach/request.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //height: MediaQuery.of(context).size.height * .7,
      decoration: new BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
            Radius.circular(15)
        ),
      ),
      child: ListView(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height * .1,
            alignment: Alignment.center,
            child: new Text(
              'پروفایل مربی',
              style: new TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(15))
            ),
          ),
          new Container(
            height: MediaQuery.of(context).size.height * .7,
            margin: EdgeInsets.only(top: 25, left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: new Column(
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height * .2,
                  //width: MediaQuery.of(context).size.width * .5,
                  margin: EdgeInsets.only(top: 10),
                  child: new Row(
                    children: <Widget>[
                      new Column(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.only(right: 20),
                            width: MediaQuery.of(context).size.width * .5,
                            child: new Row(
                              children: <Widget>[
                                new Container(
                                  width: 100,
                                  child: new Text(
                                    'هادی چوپان',
                                    style: new TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  height: MediaQuery.of(context).size.height * .2,
                                  alignment: Alignment.center,
                                ),
                                new Container(
                                  width: 50,
                                  child: Image.asset('assets/coach_profile/verify.png'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      new Container(
                        width: 150,
                        height: 150,
                        child: new CircleAvatar(
                          backgroundImage: AssetImage('assets/1.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  height: 100,
                  color: Colors.white,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                          padding: EdgeInsets.only(right: 10),
                          height: 50,
                          width: 150,
                          child: new ButtonTheme(
                            minWidth: 100,
                            buttonColor: Colors.white,
                            child: new RaisedButton(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.red, width: 2,),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              onPressed: (){
                              },
                              child: new Row(
                                children: <Widget>[
                                  new Icon(Icons.close, color: Colors.red,),
                                  new Container(
                                    padding: EdgeInsets.only(right: 15),
                                    child: new Text('خروج' , style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),),
                                  )
                                ],
                              )
                            ),
                          )
                      ),
                      new Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 50,
                          width: 150,
                          child: new ButtonTheme(
                            minWidth: 100,
                            buttonColor: Colors.white,
                            child: new RaisedButton(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 2,),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              onPressed: () async{
                                //var response = await Services().createContract(athlete_nat_code, coach_nat_code, widget.header);
                              },
                              child: new Text('ویرایش اطلاعات' , style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * .15,
                  decoration: new BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        height: MediaQuery.of(context).size.height * .1,
                        child: Image.asset('assets/coach_profile/students_icon.png'),
                      ),
                      new Container(
                        height: MediaQuery.of(context).size.height * .05,
                        alignment: Alignment.center,
                        child: new Text(
                          'شاگردان شما',
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * .85,
                      ),
                    ],
                  ),
                ),
                new Container(
                  child: new GestureDetector(
                    onTap: (){
                      print('salam');
                      Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new Directionality(textDirection: TextDirection.rtl, child: RequestsPage())));
                    },
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          height: MediaQuery.of(context).size.height * .1,
                          child: Image.asset('assets/coach_profile/requests_icon.png'),
                        ),
                        new Container(
                          height: MediaQuery.of(context).size.height * .05,
                          child: new Text(
                            'درخواست ها',
                            style: new TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: new BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.width * .85,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}