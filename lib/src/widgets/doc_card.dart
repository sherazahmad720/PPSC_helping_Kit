import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocCard extends StatelessWidget {
  final String text;
  DocCard({this.text = ""});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 70,
        child: Card(
          color: Colors.blue,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width * 0.7,
                  child: Text(text,
                      style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white)),
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
