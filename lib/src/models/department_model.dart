class DepartmentModel {
  String departmentName;
  String picUrl;
  DepartmentModel({this.departmentName, this.picUrl});
  toMap(DepartmentModel data) {
    Map<String, dynamic> tomap = {
      departmentName: data.departmentName,
      picUrl: data.picUrl
    };
    return tomap;
  }
}
