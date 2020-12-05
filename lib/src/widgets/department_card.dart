import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppsc_helping_kit/src/pages/year_page.dart';

class DepartMentCard extends StatelessWidget {
  final String imagePath;
  final String text;
  DepartMentCard({this.imagePath, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(YearPage());
      },
      child: Container(
        // width: 200,
        // height: 200,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage("https://picsum.photos/200"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text(text,
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                    Container(
                        child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.orange,
                      size: 18,
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
