class MemberEmployerMob {
  final int id;
  final String memberNumber;
  final int employerId;
  final String employerName;
  final int countryId;
  final String shortName;
  final bool isArchived;
  final String lastModifiedDate;

  factory MemberEmployerMob.fromJson(Map<String, dynamic> json) => MemberEmployerMob(
    id: json["Id"],
    memberNumber: json["MemberNumber"],
    employerId: json["EmployerId"],
    employerName: json["EmployerName"],
    countryId: json["CountryId"],
    shortName: json["ShortName"],
    isArchived: json["IsArchived"],
    lastModifiedDate: json["LastModifiedDate"]
  );


  MemberEmployerMob({
    this.id,
    this.memberNumber,
    this.employerId,
    this.employerName,
    this.countryId,
    this.shortName,
    this.isArchived,
    this.lastModifiedDate,
  });
}

class ArchivedMemberEmployersMob {
  final int id;
  final String memberNumber;
  final int employerId;
  final String employerName;
  final int countryId;
  final String shortName;
  final bool isArchived;
  final String lastModifiedDate;


factory ArchivedMemberEmployersMob.fromJson(Map<String, dynamic> json) => ArchivedMemberEmployersMob(
    id: json["Id"],
    memberNumber: json["MemberNumber"],
    employerId: json["EmployerId"],
    employerName: json["EmployerName"],
    countryId: json["CountryId"],
    shortName: json["ShortName"],
    isArchived: json["IsArchived"],
    lastModifiedDate: json["LastModifiedDate"]
  );

  ArchivedMemberEmployersMob({
    this.id,
    this.memberNumber,
    this.employerId,
    this.employerName,
    this.countryId,
    this.shortName,
    this.isArchived,
    this.lastModifiedDate,
  });
}
