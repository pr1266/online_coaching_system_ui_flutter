import 'package:flutter/material.dart';

class SearchPage_ extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPage();
  }
}
class SearchPage extends State<SearchPage_>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool searched = false;
  String _search_val;
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
            child: new Text('جستجو', style: new TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
            alignment: Alignment.center,
          ),
          new Container(
            height: MediaQuery.of(context).size.height * .1,
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
              child : new Form(
                key: _formKey,
                child : new TextFormField(
                  onSaved: (String value) {
                    _search_val = value;
                  },
                  decoration: new InputDecoration(
                    hintText: 'جستجو...',
                    contentPadding: EdgeInsets.only(right: 20),
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
              margin: EdgeInsets.all(20),
            )
          ),
          searched == 0 ? null :
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    color: Colors.black,
                  )
                ],
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
  }
}