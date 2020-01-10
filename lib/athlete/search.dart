import 'package:flutter/material.dart';
import 'package:online_coaching/services/athlete.dart';
import 'package:online_coaching/services/auth.dart';
import 'package:online_coaching/models/models.dart';

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
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool searched = false;
  bool filter = false;
  String _search_val;
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
          new Expanded(
            child: new SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: coaches.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
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
                              backgroundImage: AssetImage('assets/1.jpg'),
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
                  );
              }),
            ),
          )
        ],
      ),
    );
  }

  do_search() async{
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
}