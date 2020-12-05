import 'package:flutter/material.dart';
import 'package:ppsc_helping_kit/src/widgets/doc_card.dart';

class DocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Documents"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            children: [
              DocCard(
                text: "title will show heretitle will show ",
              ),
              DocCard(
                text: "title will show here",
              ),
              DocCard(
                text: "title will show here",
              )
            ],
          ),
        ),
      ),
    );
  }
}
