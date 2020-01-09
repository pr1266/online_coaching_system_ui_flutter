import 'package:flutter/material.dart';
import 'package:online_coaching/pages/moblie_code.dart';
import 'package:validators/validators.dart';
import 'package:online_coaching/services/auth.dart';
import 'package:online_coaching/athlete/base_page.dart' as athlete;

class LoginFormUserName extends StatefulWidget {
  const LoginFormUserName({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginFormUserName> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;
  String _username;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new Container(
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        margin: EdgeInsets.only(left: 15, right: 15),
        height: MediaQuery.of(context).size.height * 0.7,
        child: ListView(
          shrinkWrap: true,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .12,
            ),
            Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                cursorColor: Colors.deepPurple,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'نام کاربری',
                ),
                onSaved: (String value){
                  _username = value;
                },
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'پر کردن این قسمت الزامی است';
                  }
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                cursorColor: Colors.deepPurple,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'گذرواژه',
                ),
                onSaved: (String value){
                  _password = value;
                },
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'پر کردن این قسمت الزامی است';
                  }
                },
              ),
            ),
            new Container(height: MediaQuery.of(context).size.height * .16),
            // button
            new Container(
                color: Colors.white,
                margin: EdgeInsets.only(left: 20, right: 20),
                height: MediaQuery.of(context).size.height * .07,
                child: new FlatButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.white)
                  ),
                  child: new Text(
                    'ورود',
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                  ),
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      print('ok');
                      _formKey.currentState.save();
                      _do_login();
                    }
                  },
                )
            ),
            new Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * .1,
              child: new GestureDetector(
                child: new Text(
                    'فراموشی رمز',
                  style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _do_login() async{

    print('in login');
    var token = await Auth().getToken(_username.toString(), _password.toString());
    var TOKEN = token['token'];
    Map <String, String>header = {
      'Authorization': 'JWT ${TOKEN}'
    };
    var response = await Auth().getRole(_username.toString(), header);
    if(response['role'] == 'athlete'){
      //TODO inja page e athlete ro push mikonim
      print('athlete');
      var inf_response = await Auth().getInfo(_username, header, true);
      // TODO az function bala biroon nmiad
      var athlete_username = inf_response['user'];
      var athlete_nat_code = inf_response['nat_code'];
      Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new Directionality(textDirection: TextDirection.rtl, child: athlete.myHomePageState(header: header, username: athlete_username, nat_code: athlete_nat_code,))));
    } else if(response['role'] == 'coach'){
      //TODO inja page e coach ro push mikonim
      print('coach');
    }
  }

  bool _submittable() {
    return _agreedToTOS;
  }

  void _submit() {
    _formKey.currentState.validate();
    print('Form submitted');
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }
}