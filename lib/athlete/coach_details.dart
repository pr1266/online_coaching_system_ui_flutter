import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class CoachDetails extends StatelessWidget{

  final String fullname = 'هادی چوپان';
  final String degree = 'لیسانس تربیت بدنی';
  final String city = 'اصفهان';
  final records = 'سبیسیمبنسکبلنتلنابکلانبالمنیکمبلنکسمینبسکیمنبسیکمنلکیمانبکمانکمنیبمسیگبکمسگکمرزذورذدو.ئانمیبکلمنیبکلمنسکبلمنیکملنیکلمانلمنابمکانبکانیکبلنیکبملن';

  Widget _buildProfileImage(){
    return Center(
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/1.jpg'),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.all(Radius.circular(80)),
          border: Border.all(
            color: Colors.white,
            width: 10,
          )
        ),
      ),
    );
  }

  Widget _buildStatus(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(4.0))
      ),
      child: Text(
        degree,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300
        ),
      ),
    );
  }
  
  Widget _buildCoverImage(Size screensize){
    return Container(
      height: screensize.height/2.6,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage('assets/1.jpg'),
          fit: BoxFit.cover
        )
      ),
    );
  }

  Widget _buildFullName(){
    TextStyle _nameStyle = TextStyle(
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.bold
    );

    return Text(
      fullname,
      style: _nameStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screensize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: screensize.height/6.4,
                  ),
                  _buildProfileImage(),
                  _buildFullName(),
                  _buildStatus(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}