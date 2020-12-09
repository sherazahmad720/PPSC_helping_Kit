import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppsc_helping_kit/src/pages/pdf_viewer_page.dart';

class DocCard extends StatelessWidget {
  final String text, link;
  DocCard({this.text = "", this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PdfveiwerPage(
          docName: text,
          link: link,
        ));
      },
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
