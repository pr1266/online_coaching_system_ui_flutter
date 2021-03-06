import 'package:flutter/material.dart';
import 'package:online_coaching/pages/moblie_code.dart';
import 'package:validators/validators.dart' as validator;
import 'package:online_coaching/services/auth.dart';
import 'package:online_coaching/athlete/base_page.dart' as athlete;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:online_coaching/coach/base_page.dart' as coach;
import 'package:online_coaching/pages/base_page.dart';

class RegisterFormUserName extends StatefulWidget {
  const RegisterFormUserName({Key key}) : super(key: key);

  @override
  RegisterFormUserName_ createState() => RegisterFormUserName_();
}

class RegisterFormUserName_ extends State<RegisterFormUserName> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;
  String _username;
  String _password;
  String _password_;
  String _first_name;
  String _last_name;
  String _nat_code;

  ROLE _character = ROLE.athlete;
  final myController = TextEditingController();
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
              height: MediaQuery.of(context).size.height * .02,
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
                  } else if(value.length < 8){
                    return 'طول نام کاربری نباید کمتر از 8 کاراکتر باشد';
                  }
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                obscureText: true,
                controller: myController,
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
                  } else if(value.length < 8){
                    return 'طول گذرواژه نباید کمتر از 8 کاراکتر باشد';
                  }
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                obscureText: true,
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
                  labelText: 'تکرار گذرواژه',
                ),
                onSaved: (String value){
                  _password_ = value;
                },
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'پر کردن این قسمت الزامی است';
                  } else if(value.length < 8){
                    return 'طول گذرواژه نباید کمتر از 8 کاراکتر باشد';
                  } else if(myController.text != value){
                    return 'گذرواژه ها با هم مطابق نیستند';
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
                  labelText: 'نام',
                ),
                onSaved: (String value){
                  _first_name = value;
                },
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'پر کردن این قسمت الزامی است';
                  } else if(validator.isNumeric(value)){
                    return 'لطفا نام خود را به فرمت مناسب وارد کنید';
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
                  labelText: 'نام خانوادگی',
                ),
                onSaved: (String value){
                  _last_name = value;
                },
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'پر کردن این قسمت الزامی است';
                  } else if(validator.isNumeric(value)){
                    return 'لطفا نام خانوادگی خود را به فرمت مناسب وارد کنید';
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
                  labelText: 'کدملی',
                ),
                onSaved: (String value){
                  _nat_code = value;
                },
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'پر کردن این قسمت الزامی است';
                  } else if(!validator.isNumeric(value)){
                    return 'لطفا کدملی خود را به فرمت مناسب وارد کنید';
                  } else if(value.length != 10){
                    return 'کد ملی باید دقیقا ده رقم باشد';
                  }
                },
              ),
            ),
            new Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              height: MediaQuery.of(context).size.height * .1,
              color: Colors.white,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Radio(
                      value: ROLE.athlete,
                      groupValue: _character,
                      onChanged: (value){
                        setState(() {
                          _character = value;
                          print(value.runtimeType);
                        });
                      }),
                  new Text(
                    'ورزشکار', style: new TextStyle(
                      color: Colors.black,
                      fontFamily: 'Vazir',
                      fontSize: 20
                  ),
                  ),
                  Radio(
                      value: ROLE.coach,
                      groupValue: _character,
                      onChanged: (value){
                        setState(() {
                          _character = value;
                          print(value);
                        });
                      }),
                  new Text(
                    'مربی', style: new TextStyle(
                      color: Colors.black,
                      fontFamily: 'Vazir',
                      fontSize: 20
                  ),
                  ),
                ],
              ),
            ),
            //TODO ta inja
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            //new Container(height: MediaQuery.of(context).size.height * .06),
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
                    'ثبت نام',
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
                      _do_sign_up();
                    }
                  },
                )
            ),
            Container(
              height: MediaQuery.of(context).size.height * .05,
            )
          ],
        ),
      ),
    );
  }

  _do_sign_up() async{



    //token ba admin:
    var token_response = await Auth().getToken('admin', 'admin');
    var token = token_response['token'];
    var header = {
      'Authorization': 'JWT ${token}'
    };

    //create user:
    var user_body = {
      'username': _username,
      'password': _password,
      'role': _character == ROLE.coach ? 'coach' : 'athlete'
    };

    var user_response_ = await Auth().createUser(user_body, header);

    // aval body:
    var body = {
      'nat_code': _nat_code,
      'first_name': _first_name,
      'last_name': _last_name,
      'user': user_response_['username'].toString(),
      'city': 1.toString(),
    };
    if(this._character == ROLE.coach){
      // morabi
      var create_response = await Auth().SignUp(body, header, false);
    }
    else{
      // varzeshkar
      var create_response = await Auth().SignUp(body, header, true);
    }

    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new Directionality(textDirection: TextDirection.rtl, child: BasePage())));

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

enum ROLE { coach, athlete}