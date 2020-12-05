import 'package:flutter/material.dart';

import 'package:ppsc_helping_kit/src/widgets/main_heading.dart';
import 'package:ppsc_helping_kit/src/widgets/year_card.dart';

class YearPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Year"),
      ),
      body: Container(
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
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: (2 / 1),
                  children: [
                    YearCard(
                      text: "2018",
                      color: Colors.red,
                    ),
                    YearCard(
                      text: "2018",
                      color: Colors.blue,
                    ),
                    YearCard(
                      text: "2018",
                      color: Colors.amber,
                    ),
                    YearCard(
                      text: "2018",
                      color: Colors.green,
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
