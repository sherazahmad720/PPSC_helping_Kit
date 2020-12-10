import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppsc_helping_kit/src/controller/url_controller.dart';
import 'package:ppsc_helping_kit/src/pages/about_app.dart';
import 'package:ppsc_helping_kit/src/pages/about_me.dart';
import 'package:ppsc_helping_kit/src/pages/home_page.dart';
import 'package:ppsc_helping_kit/src/pages/terms_condition_page.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerList extends StatefulWidget {
  final selected;

  DrawerList({this.selected});

  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  final UrlController url = UrlController();

  Widget line = Divider(
    height: 0,
    color: Colors.blue[50],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      decoration: BoxDecoration(
        color: Colors.red[900].withOpacity(.8),
        // gradient: LinearGradient(
        //     begin: FractionalOffset.topRight,
        //     end: FractionalOffset.bottomLeft,
        //     colors: [
        //   Colors.blue[900].withOpacity(.8),
        //   Colors.blue[700].withOpacity(.8),
        //   Colors.blue.withOpacity(0.8),
        // ])
      ),
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              height: 140,
              // color: Colors.white,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("assets/images/logo_wide.png"))),
              child: Center(
                  child: Text(
                "Vu Helping Kit",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              )),
            ),
            line,
            GestureDetector(
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
                child: tileCard("Home", Icons.home)),
            line,
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AboutMe();
                  }));
                },
                child: tileCard("About me", Icons.account_box)),
            line,
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AboutApp();
                  }));
                },
                child: tileCard("About App", Icons.info_outline)),
            line,
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  url.open(
                      "https://play.google.com/store/apps/details?id=com.sherazi.ppsc_helping_kit");
                },
                child: tileCard("Rate This app", Icons.star)),
            line,
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  launchURLFeedBack();
                },
                child: tileCard("Send Us Feedback", Icons.send)),
            line,
            GestureDetector(
                onTap: () {
                  shareApp();
                },
                child: tileCard("Share App", Icons.share)),
            line,
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  url.open(
                      "https://play.google.com/store/search?q=pub%3Asherazi&c=apps");
                },
                child: tileCard("Explore Other App", Icons.explore)),
            line,
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TermsAndCondition();
                  }));
                },
                child: tileCard("Terms & Conditions", Icons.security)),
            line,
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TermsAndCondition();
                  }));
                },
                child: tileCard("Login", Icons.login)),
            line,
          ],
        ),
      ),
    );
  }

  Widget tileCard(String title, IconData icon) {
    return Container(
      color: widget.selected != null
          ? widget.selected == title
              ? Colors.white
              : Colors.transparent
          : Colors.transparent,
      height: 60,
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Icon(
            icon,
            color: widget.selected != null
                ? widget.selected == title
                    ? Colors.red
                    : Colors.white
                : Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: GoogleFonts.heebo(
                color: widget.selected != null
                    ? widget.selected == title
                        ? Colors.red
                        : Colors.white
                    : Colors.white,
                fontSize: 18),
          ),
        ],
      ),
    );
  }

  void launchURLFeedBack() async {
    const url =
        'mailto:sherazahmad720@gmail.com.org?subject=Feedback For PPSC Helping Kit &body=';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> shareApp() async {
    await FlutterShare.share(
        title: "PPSC Helping Kit",
        text:
            "Now you can find all helping material of PPSC at one place just download App",
        linkUrl:
            "https://play.google.com/store/apps/details?id=com.sherazi.ppsc_helping_kit",
        chooserTitle: "PPSC Helping Kit");
  }
}
//kafdsljflkjdfslkjdsfalkjdflkjfdsslkajdfoisajdsoiojdfslkjfdalkdaflskk
