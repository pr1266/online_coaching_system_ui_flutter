import 'package:flutter/material.dart';
import 'package:online_coaching/services/athlete.dart';
import 'package:online_coaching/services/auth.dart';
import 'package:online_coaching/models/models.dart';
import 'package:online_coaching/athlete/coach_details.dart' as coach;
import 'dart:async';

class SearchPage_ extends StatefulWidget{
  final header;
  SearchPage_({this.header});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPage();
  }
}
class SearchPage extends State<SearchPage_>{

  List<Coachs> coaches = [];
  var header;

  getToken() async{
      var response = await Auth().getToken('admin', 'admin');
      var token = response['token'];
      header = {
        'Authorization': 'JWT ${token}'
      };
      print('header');
      print(header);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
    dropdown_val = 'انتخاب شهر';
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool searched = false;
  bool filter = false;
  String _search_val;
  String dropdown_val = 'انتخاب شهر';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blue,
      child: Column(
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
            child: new Text('جستجو', style: new TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),),
            alignment: Alignment.center,
          ),
          new Container(
            height: MediaQuery.of(context).size.height * .03,
          ),
          new Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: MediaQuery.of(context).size.height * .1,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              child: new Container(
                child: new Row(
                  children: <Widget>[
                    new Flexible(
                      child: new Form(
                        key: _formKey,
                        child : new TextFormField(
                          onSaved: (String value) {
                            _search_val = value;
                          },
                          decoration: new InputDecoration(
                            hintText: 'جستجو...',
                            //contentPadding: EdgeInsets.only(right: 20),
                            icon: IconButton(
                              icon : Icon(Icons.search),
                              onPressed: (){
                                _formKey.currentState.save();
                                do_search();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: (){
                        setState(() {
                          filter = !filter;
                          print(filter);
                        });
                      },
                      child: Container(
                        width: 50,
                        child: new Icon(Icons.add_box),
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(20),
              )
          ),
          filter == false ? new Expanded(
            child: new SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: coaches.length,
                itemBuilder: (BuildContext context, int index){
                  return new GestureDetector(
                    onTap: (){
                      print('salam');
                      Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new Directionality(textDirection: TextDirection.rtl, child: new coach.CoachProfile(nat_code: coaches[index].nat_code, header: header,))));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * .1,
                      margin: EdgeInsets.only(right: 15 , left: 15, top: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white,
                      ),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            height: 60,
                            width: 70,
                            child: new CircleAvatar(
                              backgroundImage: NetworkImage(coaches[index].picture, headers: header),
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.only(right: 15),
                            color: Colors.white,
                            child: new Text(
                              coaches[index].first_name + ' ' + coaches[index].last_name,
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 30
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
              }),
            ),
          ): Container(
            margin: EdgeInsets.all(30),
            height: MediaQuery.of(context).size.height * .55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: new Column(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 140),
                      child : new Text(
                        'فیلتر',
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: new Icon(
                        Icons.close
                      ),
                    ),
                  ],
                ),
                new Container(
                  height: MediaQuery.of(context).size.height * .07,
                  color: Colors.white,
                ),
                new Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      width: 2,
                      color: Colors.black
                    ),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: new ButtonTheme(
                    minWidth: 100,
                    buttonColor: Colors.white,
                    child: new DropdownButton<String>(
                      style: new TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                      value: dropdown_val,
                      hint: new Text('انتخاب شهر'),
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: <String>['انتخاب شهر','شیراز', 'اصفهان'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          print(value);
                          dropdown_val = value;
                        });
                      },
                    )
                  )
                ),
                new Container(
                    width: 120,
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * .1,
                    child: new ButtonTheme(
                      minWidth: 100,
                      buttonColor: Colors.white,
                      child: new RaisedButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 2,),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          onPressed: (){},
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                child: new Text('مدرک' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ),
                              new Container(
                                width: 30,
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(Icons.keyboard_arrow_down),
                              )
                            ],
                          )
                      ),
                    )
                ),
                new Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * .12,
                  color: Colors.white,
                ),
                new GestureDetector(
                  onTap: (){
                    do_search_();
                  },
                  child: new Container(
                    width: 450,
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * .07,
                    color: Colors.white,
                    child: new Container(
                      alignment: Alignment.center,
                      width: 450,
                      height: MediaQuery.of(context).size.height * .07,
                      child: new Text(
                          'تایید',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white
                          )
                      ),
                      margin: EdgeInsets.only(left: 60, right: 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Colors.green
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  do_search() async{
    coaches.clear();
    //TODO DO SEARCH
    searched = true;
    //_formKey.currentState.save();
    print(_search_val);
    var response = await Services().search(_search_val, header);
    print(response['coaches']);
    coaches.add(response['coaches']);
    setState(() {
      searched = true;
      print(searched);
      print(coaches);
    });
  }

  var city_list =
    {
      'اصفهان': 1,
      '': '',
      'شیراز': 3
    };

  do_search_() async{
    coaches.clear();
    //TODO DO SEARCH
    searched = true;
    filter = false;
    //_formKey.currentState.save();
    print(city_list[dropdown_val].toString());
    var response = await Services().search_city(3.toString(), header);
    print(response['coaches']);
    coaches.addAll(response['coaches']);
    setState(() {
      searched = true;
      print(searched);
      print(coaches);
    });
  }
}