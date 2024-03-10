import 'package:abybaby_assignment/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_icon/animated_icon.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  var controller = Get.find<HomeController>();
  var resData;
  int i = 1;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      controller.i(2);
      getCatagoryData();
    });
    // TODO: implement initState

    super.initState();
  }

  getCatagoryData() async {
    resData = await controller.getData();
    print("********");
    print(resData.toString());
    print("********");
  }

  listWidget(imgsrc, title, {subTitle}) {
    return ListTile(
      leading: Image.network(
        imgsrc,
        height: 40,
        width: 40,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey),
      ),
      subtitle: subTitle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          actions: [
            Obx(
              () => AnimateIcon(
                key: UniqueKey(),
                onTap: () {},
                iconType: controller.i == 2
                    ? IconType.animatedOnTap
                    : IconType.continueAnimation,
                height: 70,
                width: 70,
                color: Colors.red,
                animateIcon: AnimateIcons.bell,
              ),
            )
          ],
          title: Text("Home"),
        ),
        body: Center(
            child: FutureBuilder(
                future: controller.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return controller.languageValue == "English"
                              ? listWidget(snapshot.data[index].icon,
                                  snapshot.data[index].category.toString())
                              : controller.languageValue == "Bengali"
                                  ? listWidget(snapshot.data[index].icon,
                                      snapshot.data[index].lnBn.toString())
                                  : listWidget(snapshot.data[index].icon,
                                      snapshot.data[index].lnHn.toString());
                        });
                  }
                })));
  }
}
