import 'package:get/get.dart';
import 'package:ppsc_helping_kit/src/models/department_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppsc_helping_kit/src/models/doc_model.dart';
import 'package:ppsc_helping_kit/src/models/year_model.dart';

import '../models/department_model.dart';

class HomeController extends GetxController {
  List<DepartmentModel> deptList = [];
  List<YearModel> yearList = [];
  List<DocModel> docList = [];
  List<DocModel> tempdocList = [
    DocModel(
        departmentName: "Police",
        docLink: "",
        docName: "First name",
        year: "2015"),
    DocModel(
        departmentName: "Police",
        docLink: "",
        docName: "Second name",
        year: "2015"),
    DocModel(
        departmentName: "Police",
        docLink: "",
        docName: "Third name",
        year: "2015"),
    DocModel(
        departmentName: "Police",
        docLink: "",
        docName: "Fourth name",
        year: "2015"),
    DocModel(
        departmentName: "Police",
        docLink: "",
        docName: "Fifth name",
        year: "2015")
  ];
  List<YearModel> tempyear = [
    // YearModel(
    //     yearName: "2010",
    //     totalDocument: "10",
    //     color: Colors.green,
    //     department: "police"),
    // YearModel(
    //     yearName: "2020",
    //     totalDocument: "10",
    //     color: Colors.blue,
    //     department: "police"),
    // YearModel(
    //     yearName: "2021",
    //     totalDocument: "10",
    //     color: Colors.amber,
    //     department: "police"),
    // YearModel(
    //     yearName: "2017",
    //     totalDocument: "10",
    //     color: Colors.indigo,
    //     department: "police"),
    // YearModel(
    //     yearName: "2016",
    //     totalDocument: "10",
    //     color: Colors.red,
    //     department: "police"),
    // YearModel(
    //     yearName: "2012",
    //     totalDocument: "15",
    //     color: Colors.red,
    //     department: "Police"),
    // YearModel(
    //     yearName: "2013",
    //     totalDocument: "16",
    //     color: Colors.red,
    //     department: "Police"),
    // YearModel(
    //     yearName: "2014",
    //     totalDocument: "17",
    //     color: Colors.red,
    //     department: "Police"),
    // YearModel(
    //     yearName: "2015",
    //     totalDocument: "18",
    //     color: Colors.red,
    //     department: "Police"),
    // YearModel(
    //     yearName: "2016",
    //     totalDocument: "19",
    //     color: Colors.red,
    //     department: "Police"),
    // YearModel(
    //     yearName: "2017",
    //     totalDocument: "20",
    //     color: Colors.red,
    //     department: "Health"),
    // YearModel(
    //     yearName: "2018",
    //     totalDocument: "21",
    //     color: Colors.red,
    //     department: "Health"),
    // YearModel(
    //     yearName: "2019",
    //     totalDocument: "22",
    //     color: Colors.red,
    //     department: "Health"),
    // YearModel(
    //     yearName: "2020",
    //     totalDocument: "23",
    //     color: Colors.red,
    //     department: "Health"),
    // YearModel(
    //     yearName: "2021",
    //     totalDocument: "24",
    //     color: Colors.red,
    //     department: "Health"),
    // YearModel(
    //     yearName: "2022",
    //     totalDocument: "25",
    //     color: Colors.red,
    //     department: "Health"),
    // YearModel(
    //     yearName: "2023",
    //     totalDocument: "26",
    //     color: Colors.red,
    //     department: "Health"),
    // YearModel(
    //     yearName: "2024",
    //     totalDocument: "27",
    //     color: Colors.red,
    //     department: "sport"),
    // YearModel(
    //     yearName: "2025",
    //     totalDocument: "28",
    //     color: Colors.red,
    //     department: "sport"),
    // YearModel(
    //     yearName: "2026",
    //     totalDocument: "29",
    //     color: Colors.red,
    //     department: "sport"),
    // YearModel(
    //     yearName: "2027",
    //     totalDocument: "30",
    //     color: Colors.red,
    //     department: "sport"),
    // YearModel(
    //     yearName: "2028",
    //     totalDocument: "31",
    //     color: Colors.red,
    //     department: "sport"),
    // YearModel(
    //     yearName: "2029",
    //     totalDocument: "32",
    //     color: Colors.red,
    //     department: "Teaching"),
  ];
  List<DepartmentModel> tempDepartment = [
    DepartmentModel(
        departmentName: "Police", picUrl: "https://loremflickr.com/240/240"),
    DepartmentModel(
        departmentName: "Health", picUrl: "https://loremflickr.com/240/240"),
    DepartmentModel(
        departmentName: "Teaching", picUrl: "https://loremflickr.com/240/240"),
    DepartmentModel(
        departmentName: "Sport", picUrl: "https://loremflickr.com/240/240"),
    DepartmentModel(
        departmentName: "E-Tech", picUrl: "https://loremflickr.com/240/240"),
  ];

  getDepartmentList() async {
    FirebaseFirestore.instance.collection('DepartmentName').get().then((qshot) {
      deptList = qshot.docs.map((doc) {
        return DepartmentModel(
            departmentName: doc.data()['DeptName'],
            picUrl: doc.data()['PicUrl']);
      }).toList();
      update();
    });
  }

  getYearList(String condition) async {
    yearList.clear();
    FirebaseFirestore.instance
        .collection('Year')
        .where('Dept', isEqualTo: condition)
        .get()
        .then((qshot) {
      yearList = qshot.docs.map((doc) {
        return YearModel(
          yearName: doc.data()['YearName'],
          totalDocument: doc.data()['TotalDocs'],
          department: doc.data()['Dept'],
          color: doc.data()['Color'],
        );
      }).toList();
      update();
    });
  }

  getDocument({String department, String year}) async {
    docList.clear();
    FirebaseFirestore.instance
        .collection('Documents')
        .where('DeptName', isEqualTo: department)
        .where('Year', isEqualTo: year)
        .get()
        .then((qshot) {
      docList = qshot.docs.map((doc) {
        return DocModel(
          departmentName: doc.data()['DeptName'],
          docLink: doc.data()['DocLink'],
          docName: doc.data()['DocName'],
          year: doc.data()['Year'],
        );
      }).toList();
      update();
    });
  }

  addData() {}
  uploadData() async {
    for (int i = 0; i < tempdocList.length; i++) {
      FirebaseFirestore.instance.collection("Documents").add({
        "DeptName": tempdocList[i].departmentName,
        "DocLink": tempdocList[i].docLink,
        "DocName": tempdocList[i].docName,
        "Year": tempdocList[i].year,
      });
      print("Data uploaded");
    }
  }
  // uploadData() async {
  //   for (int i = 0; i < tempyear.length; i++) {
  //     FirebaseFirestore.instance.collection("Year").add({
  //       "YearName": tempyear[i].yearName,
  //       "TotalDocs": tempyear[i].totalDocument,
  //       "Color": tempyear[i].color.toString(),
  //       "Dept": tempyear[i].department,
  //     });
  //     print("Data uploaded");
  //   }
  // }
  // uploadData() async {
  //   for (int i = 0; i < tempDepartment.length; i++) {
  //     FirebaseFirestore.instance.collection("DepartmentName").add({
  //       "DeptName": tempDepartment[i].departmentName,
  //       "PicUrl": tempDepartment[i].picUrl
  //     });
  //     print("Data uploaded");
  //   }
  // }
}
