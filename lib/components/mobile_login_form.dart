import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;

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
        height: MediaQuery.of(context).size.height * 0.6,
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
                  labelText: 'ورود با شماره موبایل',
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'پر کردن این قسمت الزامی است';
                  }
                  else if(!isNumeric(value)){
                    return 'شماره تلفن را به فرمت مناسب وارد کنید';
                  }
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .27),
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
                    'دریافت کد',
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                  ),
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      print('ok');
                      //Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new Directionality(textDirection: TextDirection.rtl, child: MobileLogin())));
                    }
                  },
                )
            ),
          ],
        ),
      ),
    );
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