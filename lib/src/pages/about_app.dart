import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ppsc_helping_kit/src/widgets/drawer.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("About App"),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: Drawer(
          child: DrawerList(
            selected: "About App",
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 80, top: 20, left: 10, right: 10),
        child: Card(
          elevation: 5,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                height: 100,
              ),
              ListView(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 40),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(1, 2),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60),
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.cover)),
                      height: 120,
                      width: 120,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 15),
                    child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Text(
                          """
Primary Purpose of the App is to provide a helping Kit to Vu Students.
All They Need to get High grades in their study will be available at this on Platform.
This App has Four main options.
1- Quizzes
 This option Will provide the Random quizzes for Every Subject.
 So students can quickly check their exam preparation.
Just select Category like English or Math than Chose  Subject like Eng 201 And Chose MidTerms or Final Term option.
 Each Quiz has 30 second time, and total quizzes are 10
At the end of the quizzes, the detailed Result Card And Answer Sheet are also Present.
2-Assignments
This option includes all Active Assignments / Gdbs,  with their Solution Idea.
3-Handouts
We want Everything should be available in one place, so we add Handout of All Subject in this App. Just Select Category and then chose the Subject.
4-PastPaper / Notes
In this option, we Provide all past paper, Short Notes, and other helping material. So Students can easily get good marks in Exams.
If you Have any Suggestions, Feel Free to Contact Us.   
Note: If you Need PastPaper of a subject or Assignment or any other Material, Send a Request by clicking The below Button.
We will provide it as soon as possible.        
   
                      """,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.abel(fontSize: 16),
                        )),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 50, left: 50),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          launchURLFeedBack();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Send Request",
                                style: GoogleFonts.abhayaLibre(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor)),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(FontAwesome.send_o,
                                size: 25, color: Theme.of(context).primaryColor)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void launchURLFeedBack() async {
    const url =
        'mailto:sherazahmad720@gmail.com.org?subject=Request from PPSC Helping Kit &body= I need';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
