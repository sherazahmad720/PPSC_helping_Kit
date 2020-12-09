// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfveiwerPage extends StatefulWidget {
  PdfveiwerPage({this.link, this.docName});
  final link;
  final docName;
  @override
  _PdfveiwerPafeState createState() => _PdfveiwerPafeState();
}

class _PdfveiwerPafeState extends State<PdfveiwerPage> {
  PDF document;
  _PdfveiwerPafeState();

  int currentpage = 0;
  int totalpage = 0;
  final myController = TextEditingController();
  TextEditingController pageno;
  PDFViewController pdfcontroller;
  // InterstitialAd _interstitialAd;
  // @override
  // void initState() {
  //   FirebaseAdMob.instance
  //       .initialize(appId: "ca-app-pub-7700197525069981~2106929291");
  //   _interstitialAd = createInterstitialAd()
  //     ..load()
  //     ..show();
  //   super.initState();
  // }

  @override
  void dispose() {
    // _interstitialAd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 90,
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // InkWell(
                //   onTap: () {
                //     _showcontent();
                //   },
                //   child: Text(
                //     "Jump to Page",
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
                Text(
                  "Current page ${currentpage + 1}/$totalpage",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("${widget.docName}"),
        // leading: Text(
        //   "Current page ${currentpage + 1}/$totalpage",
        //   style: TextStyle(color: Colors.white),
        // ),
      ),
      body: Container(
        child: Center(
            child: PDF(
                pageSnap: false,
                autoSpacing: false,
                fitEachPage: false,
                pageFling: false,
                onPageChanged: (current, total) {
                  setState(() {
                    currentpage = current;
                    totalpage = total;
                  });
                },
                onViewCreated: (check) {
                  pdfcontroller = check;
                }).cachedFromUrl(
          widget.link,
          placeholder: (progress) {
            return Center(
              child: Text("File is downloading , $progress %"),
            );
          },
          errorWidget: (error) => Center(child: Text(error.toString())),
        )),
      ),
    );
  }

  // InterstitialAd createInterstitialAd() {
  //   return InterstitialAd(
  //       adUnitId: "ca-app-pub-7700197525069981/3990964402",
  //       // adUnitId: InterstitialAd.testAdUnitId,
  //       listener: (MobileAdEvent event) {
  //         print("intersttial ad should loaded at pdf view");
  //       });
  // }
  // void jumpToPage(int page) {
  //   pdfcontroller.setPage(page);
  // }

  // void _showcontent() {
  //   showDialog(
  //     context: context, barrierDismissible: false, // user must tap button!

  //     builder: (BuildContext context) {
  //       return new AlertDialog(
  //         title: new Text('Enter Page'),
  //         content: new SingleChildScrollView(
  //           child: new ListBody(
  //             children: [
  //               TextField(
  //                 autofocus: true,
  //                 keyboardType: TextInputType.number,
  //                 enableInteractiveSelection: false,
  //                 controller: myController,
  //                 decoration: InputDecoration(
  //                     border: OutlineInputBorder(), hintText: "0"),
  //               )
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           new FlatButton(
  //             child: new Text('Jump'),
  //             onPressed: () {
  //               if (int.parse(myController.text) > 0 &&
  //                   int.parse(myController.text) < totalpage) {
  //                 Future(() {
  //                   print("Jumped");
  //                   setState(() {
  //                     pdfcontroller.setPage(int.parse(myController.text));
  //                   });
  //                 });
  //               }

  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
