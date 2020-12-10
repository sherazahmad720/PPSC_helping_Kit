import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ppsc_helping_kit/src/widgets/drawer.dart';
import 'package:ppsc_helping_kit/src/widgets/social_icon.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("About Me"),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: Drawer(
          child: DrawerList(
            selected: "About me",
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                margin: EdgeInsets.only(top: 100),
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 70, left: 10, right: 10),
                    child: Text(
                      """        
I'm Muhammad Sheraz.
I have done my MCS Degree from Virtual University Of Pakistan.
Graphic Designing, App Development and Web Development are my Key areas of work.
If You Have any Query,Feel Free to Contact me.    
                  
                  """,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.abel(fontSize: 18),
                    )),
              ),
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
                          image: AssetImage("assets/images/sheraz1.jpg"),
                          fit: BoxFit.cover)),
                  height: 120,
                  width: 120,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            launchURLSocial(
                                "http://api.whatsapp.com/send?phone=923461503735");
                          },
                          child: SocialIcon(iconName: FontAwesome.whatsapp)),
                      GestureDetector(
                          onTap: () {
                            launchURLSocial(
                                "https://m.facebook.com/sherazi720/");
                          },
                          child: SocialIcon(iconName: FontAwesome.facebook)),
                      GestureDetector(
                          onTap: () {
                            launchURLSocial(
                                "https://www.instagram.com/programmer_420/");
                          },
                          child: SocialIcon(iconName: Ionicons.logo_instagram)),
                      GestureDetector(
                          onTap: () {
                            launchURLSocial(
                                "https://www.linkedin.com/in/sheraz-ahmad-59146219a");
                          },
                          child: SocialIcon(iconName: Ionicons.logo_linkedin)),
                      GestureDetector(
                          onTap: () {
                            launchURLSocial(
                                "https://www.youtube.com/channel/UCNdcEkKvqMH6BHM_g2O6IyA");
                          },
                          child: SocialIcon(iconName: Ionicons.logo_youtube)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void launchURLSocial(url) async {
    // const url = 'mailto:sherazahmad720@gmail.com.org?subject=Feedback &body=';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
