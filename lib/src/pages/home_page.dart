import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppsc_helping_kit/src/pages/year_page.dart';
import 'package:ppsc_helping_kit/src/widgets/department_card.dart';
import 'package:ppsc_helping_kit/src/widgets/main_heading.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PPSC Helping Kit"),
      ),
      body: Container(
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
                        "Be  .",
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
                          text: ["AWESOME", "OPTIMISTIC", "DIFFERENT"],
                          textStyle:
                              TextStyle(fontSize: 22.0, fontFamily: "Horizon"),
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
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(YearPage());
                      },
                      child: DepartMentCard(
                        text: "test",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(YearPage());
                      },
                      child: DepartMentCard(
                        text: "test",
                      ),
                    ),
                    DepartMentCard(
                      text: "test",
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(YearPage());
                      },
                      child: DepartMentCard(
                        text: "test",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
