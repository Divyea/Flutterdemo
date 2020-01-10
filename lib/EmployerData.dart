class MemberEmployerMob {
  final int id;
  final String memberNumber;
  final int employerId;
  final String employerName;
  final String countryId;
  final String shortName;
  final bool isArchived;
  final DateTime lastModifiedDate;


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
  final String countryId;
  final String shortName;
  final bool isArchived;
  final DateTime lastModifiedDate;


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

class Data {
  final List<MemberEmployerMob> unarchived;
  final List<ArchivedMemberEmployersMob> archived;

  Data({
this.archived,
this.unarchived,
  });
}