import 'package:abybaby_assignment/controller/home_controller.dart';
import 'package:abybaby_assignment/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var controller = Get.put(HomeController());
  var languageValue = "English";
  var lang = ["English", "Bengali", "Hindi"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Select Language"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                  value: languageValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: lang.map((String item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.blueGrey),
                        ));
                  }).toList(),
                  onChanged: (String? newVal) {
                    controller.languageValue(newVal);

                    setState(() {
                      languageValue = newVal!;
                    });
                  }),
              MaterialButton(
                onPressed: () async {
                  Get.to(() => HomeView());
                },
                color: Colors.blueGrey,
                child: Text("save"),
              )
            ],
          ),
        ));
  }
}
