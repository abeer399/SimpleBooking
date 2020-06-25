import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simplybook/web_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 7),
        () => navigate(
            context,
            WebViewPage(
                title: '',
                selectedUrl: 'https://thesunemporium.simplybook.me/v2/#book')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getScreenSize(context).height,
        width: getScreenSize(context).width,
        child: Image.asset("images/splash.png",height: getScreenSize(context).height,width: getScreenSize(context).width,fit: BoxFit.cover,),
      ),
    );
  }

  navigate(BuildContext context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }

  Size getScreenSize(BuildContext context) => MediaQuery.of(context).size;

}
