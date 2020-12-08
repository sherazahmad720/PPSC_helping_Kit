import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppsc_helping_kit/src/controller/home_controller.dart';

import 'package:ppsc_helping_kit/src/widgets/main_heading.dart';
import 'package:ppsc_helping_kit/src/widgets/year_card.dart';

class YearPage extends StatelessWidget {
  final String deptName;
  YearPage({this.deptName});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    // homeController.getYearList(deptName);
    homeController.getYearList(deptName);
    return Scaffold(
        appBar: AppBar(
          title: Text(deptName.toString()),
        ),
        body: GetBuilder<HomeController>(builder: (_) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  MainHeading(
                    text: "Years",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (2 / 1),
                      ),
                      itemCount: _.yearList.length,
                      itemBuilder: ((ctx, index) {
                        return YearCard(
                          text: _.yearList[index].yearName,
                          color: Colors.red,
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
