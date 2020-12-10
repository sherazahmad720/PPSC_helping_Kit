import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppsc_helping_kit/src/controller/home_controller.dart';

import 'package:ppsc_helping_kit/src/widgets/department_card.dart';
import 'package:ppsc_helping_kit/src/widgets/drawer.dart';
import 'package:ppsc_helping_kit/src/widgets/main_heading.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    homeController.getDepartmentList();
    return Scaffold(
      appBar: AppBar(
        title: Text("PPSC Helping Kit"),
        actions: [
          IconButton(
              icon: Icon(Icons.upload_file),
              onPressed: () {
                homeController.uploadData();
              })
        ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: Drawer(
          child: DrawerList(
            selected: "Home",
          ),
        ),
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          elevation: 5,
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          content: Text('Tap back again to leave the appplication'),
        ),
        child: GetBuilder<HomeController>(builder: (_) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "FriendShip .",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: "Horizon",
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: RotateAnimatedTextKit(
                              repeatForever: true,
                              text: ["Sheraz", "Afshan", "Faizan"],
                              textStyle: TextStyle(
                                  fontSize: 22.0, fontFamily: "Horizon"),
                              textAlign: TextAlign.start),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MainHeading(
                    text: "Departments",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: _.deptList.length,
                      // crossAxisCount: 2,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: ((ctx, index) {
                        return DepartMentCard(
                          text: _.deptList[index].departmentName,
                          imagePath: _.deptList[index].picUrl,
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
