import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:online_coaching/models/models.dart';
import 'package:online_coaching/services/coach.dart';

class RequestsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RequestPage_();
  }
}

class RequestPage_ extends State<RequestsPage>{

  List<Contract> reqs = [];
  var header;
  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nat_code = prefs.getString('coach_nat_code');
    print('coach nat_code');
    print(nat_code);
    String token = prefs.getString('token');

    header = {
      'Authorization' : 'JWT ${token}'
    };
    print(header);
    var response = await Services().myRequests(nat_code, header);
    setState(() {
      reqs.addAll(response['contract']);
      print('final');
      print(reqs);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      type: MaterialType.transparency,
      child: new Container(
        color: Colors.blue,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: new Text(
                'درخواست ها',
                style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            reqs.length == 0 ? new Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              height: MediaQuery.of(context).size.height * .1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: new Text(
                'شما هیچ درخواستی ندارید',
                style: new TextStyle(
                    fontSize: 20
                ),
              ),
            ): new Container(
              child: new ListView.builder(
                shrinkWrap: true,
                itemCount: reqs.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    height: MediaQuery.of(context).size.height * .12,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          padding: EdgeInsets.only(right: 10),
                          height: 80,
                          width: 90,
                          child: new CircleAvatar(
                            backgroundImage: NetworkImage(reqs[index].picture, headers: header),
                          ),
                        ),
                        new Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(right: 20),
                          alignment: Alignment.center,
                          child: new Text(
                            reqs[index].first_name + reqs[index].last_name,
                            style: new TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                          ),
                        ),
                        new Container(
                          color: Colors.white,
                          width: 160,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                padding: EdgeInsets.only(right: 15),
                                child: new ButtonTheme(
                                    minWidth: 70,
                                    buttonColor: Colors.green,
                                    child: new RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.white, width: 2,),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      onPressed: (){
                                      },
                                      child: new Text(
                                        'قبول',
                                        style: new TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    )
                                ),
                              ),
                              new Container(
                                child: new ButtonTheme(
                                    minWidth: 70,
                                    buttonColor: Colors.red,
                                    child: new RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.white, width: 2,),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      onPressed: () async{
                                        var response = await Services().DeclinContract(reqs[index].ID.toString(), header);
                                        print('response');
                                      },
                                      child: new Text(
                                        'رد',
                                        style: new TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}