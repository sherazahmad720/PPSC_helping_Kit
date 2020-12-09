import 'package:flutter/material.dart';
import 'package:ppsc_helping_kit/src/widgets/doc_card.dart';
import '../controller/home_controller.dart';
import 'package:get/get.dart';

class DocPage extends StatelessWidget {
  final String year, department;
  DocPage({this.department, this.year});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    homeController.getDocument(department: department, year: year);
    return Scaffold(
        appBar: AppBar(
          title: Text("Documents"),
        ),
        body: GetBuilder<HomeController>(builder: (_) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView.builder(
                  itemCount: _.docList.length,
                  itemBuilder: ((ctx, index) {
                    return DocCard(
                      text: _.docList[index].docName,
                    );
                  })),
            ),
          );
        }));
  }
}
