class MemberEmployerVM {
  int id;
  String name;
  String memberNumber;
  BranchOfPractise branchOfPractise;
  bool isArchived;
  DateTime archivedDate;
  double sessionsPerWeek;
  DateTime startDate;
  DateTime endDate;
  bool isContractFullTime;
  bool isMemberJobAnnualised;
  int annualisedWeeks;
  int employerId;
  String employerName;
  int categoryId;
  double pAsPerWeek;
  double customPAsPerWeek;
  EmployerVM employer;
  List<EmployerVM> employers;
  List<JobCategoryVM> defaultJobPlanCategories;
  List<JobCategoryVM> customJobPlanCategories;
  DateTime lastModifiedDate;
  List<JobPlanVM> jobPlans;
  String jobPlanIds;
  String actionType;
  bool isEmployerExisted;
  String pASessionsLabel;
  int employerCountryId;

  MemberEmployerVM({
    this.id,
    this.name,
    this.memberNumber,
    this.branchOfPractise,
    this.isArchived,
    this.archivedDate,
    this.sessionsPerWeek,
    this.startDate,
    this.endDate,
    this.isContractFullTime,
    this.isMemberJobAnnualised,
    this.annualisedWeeks,
    this.employerId,
    this.employerName,
    this.categoryId,
    this.pAsPerWeek,
    this.customPAsPerWeek,
    this.employer,
    this.employers,
    this.defaultJobPlanCategories,
    this.customJobPlanCategories,
    this.lastModifiedDate,
    this.jobPlans,
    this.jobPlanIds,
    this.actionType,
    this.isEmployerExisted,
    this.pASessionsLabel,
    this.employerCountryId,
  });

  Map<String, dynamic> tojson() {
    return {
      'Id': id,
      'Name': name,
      'MemberNumber': memberNumber,
      'BranchOfPractise': branchOfPractise,
      'IsArchived': isArchived,
      'ArchivedDate': archivedDate,
      'SessionsPerWeek': sessionsPerWeek,
      'JobPlanStartDate': startDate,
      'JobPlanEndDate': endDate,
      'IsContractFullTime': isContractFullTime,
      'IsMemberJobAnnualised': isMemberJobAnnualised,
      'AnnualisedWeeks': annualisedWeeks,
      'EmployerId': employerId,
      'EmployerName': employerName,
      'CategoryId': categoryId,
      'PAsPerWeek': pAsPerWeek,
      'CustomPAsPerWeek': customPAsPerWeek,
      'Employer': employer,
      'Employers': employers,
      'DefaultJobPlanCategories': defaultJobPlanCategories,
      'CustomJobPlanCategories': customJobPlanCategories,
      'LastModifiedDate': lastModifiedDate,
      'JobPlans': jobPlans,
      'JobPlanIds': jobPlanIds,
      'ActionType': actionType,
      'IsEmployerExisted': isEmployerExisted,
      'PASessionsLabel': pASessionsLabel,
      'EmployerCountryId': employerCountryId,
    };

    // name: json['Name'],
    // memberNumber: json['MemberNumber'],
    // branchOfPractise: json['BranchOfPractise'],
    // isArchived: json['IsArchived'],
    // archivedDate: json['ArchivedDate'],
    // sessionsPerWeek: json['SessionsPerWeek'],
    // startDate: json['JobPlanStartDate'],
    // endDate: json['JobPlanEndDate'],
    // isContractFullTime: json['IsContractFullTime'],
    // isMemberJobAnnualised: json['IsMemberJobAnnualised'],
    // annualisedWeeks: json['AnnualisedWeeks'],
    // employerId: json['EmployerId'],
    // employerName: json['EmployerName'],
    // categoryId: json['CategoryId'],
    // pAsPerWeek: json['PAsPerWeek'],
    // customPAsPerWeek: json['CustomPAsPerWeek'],
    // employer: json['Employer'],
    // employers: json['Employers'],
    // defaultJobPlanCategories: json['DefaultJobPlanCategories'],
    // customJobPlanCategories: json['CustomJobPlanCategories'],
    // lastModifiedDate: json['LastModifiedDate'],
    // jobPlans: json['JobPlans'],
    // jobPlanIds: json['JobPlanIds'],
    // actionType: json['ActionType'],
    // isEmployerExisted: json['IsEmployerExisted'],
    // pASessionsLabel: json['PASessionsLabel'],
    // employerCountryId: json['EmployerCountryId'],
  }
}

enum BranchOfPractise { SAS, Consultant, Others }

class EmployerVM extends MemberEmployerVM {}

class JobCategoryVM extends MemberEmployerVM {
  int id;
  String name;

JobCategoryVM({
this.id, this.name
});
  
}

class JobPlanVM extends MemberEmployerVM {}
