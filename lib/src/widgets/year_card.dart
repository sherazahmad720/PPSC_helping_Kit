import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppsc_helping_kit/src/pages/doc_page.dart';
import 'package:ppsc_helping_kit/src/widgets/doc_card.dart';

class YearCard extends StatelessWidget {
  final Color color;
  final String text;
  YearCard({this.color = Colors.white, this.text = ""});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DocPage());
      },
      child: Container(
        height: 50,
        child: Card(
          color: color,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Center(
                    child: Text(text,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                Container(
                    child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
