import 'dart:async';

import 'package:abybaby_assignment/choose_language.dart';
import 'package:abybaby_assignment/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalPhone;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getData().whenComplete(() async {
      Timer(
          Duration(seconds: 3),
          () => Get.to(() =>
              finalPhone == '' ? const LoginScreen() : const LanguageScreen()));
    });
    super.initState();
  }

  Future getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var getPhone = sharedPreferences.get('phone');
    setState(() {
      finalPhone = getPhone.toString();
    });
    print(finalPhone);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
