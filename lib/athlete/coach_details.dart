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
      ),
    );
  }

  Widget _buildCoverImage(Size screensize){
    return Container(
      height: screensize.height/2.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/1.jpg'),
          fit: BoxFit.cover
        )
      ),
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
        ],
      ),
    );
  }
}