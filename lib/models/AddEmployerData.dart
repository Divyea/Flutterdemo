class Post {
  //final int employerId;
  final String name;
  // final DateTime startDate;
  // final DateTime endDate;
  // final bool isContractFullTime;
  // final bool isMemberJobAnnualised;

  Post({
    //this.employerId,
    this.name,
    // this.startDate,
    // this.endDate,
    // this.isContractFullTime,
    // this.isMemberJobAnnualised,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
     // employerId: json['EmployerId'],
      name: json['Name'],
      // startDate: json['JobPlanStartDate'],
      // endDate: json['JobPlanEndDate'],
      // isContractFullTime: json['IsContractFullTime'],
      // isMemberJobAnnualised: json['IsMemberJobAnnualised'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
   //map["employerId"] = employerId;
    map["Name"] = name;
    // map["JobPlanStartDate"] = startDate;
    // map["JobPlanEndDate"] = endDate;
    // map["IsContractFullTime"] = isContractFullTime;
    // map["IsMemberJobAnnualised"] = isMemberJobAnnualised;
    return map;
  }
}
