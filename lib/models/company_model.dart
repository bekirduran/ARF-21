class Company {
  Company({
    required this.id,
    required this.companyName,
    required this.companyUrl,
    required this.companyDepartment,
    required this.establishment,
    required this.employeeCount,
    required this.address,
    required this.contact,
    required this.website,
    required this.companyAbout,
  });

  int id;
  String companyName;
  String companyUrl;
  String companyDepartment;
  String establishment;
  int employeeCount;
  String address;
  String contact;
  String website;
  String companyAbout;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"] as int,
        companyName: json["companyName"] as String,
        companyUrl: json["companyUrl"] as String,
        companyDepartment: json["companyDepartment"] as String,
        establishment: json["establishment"] as String,
        employeeCount: json["employeeCount"] as int,
        address: json["address"] as String,
        contact: json["contact"] as String,
        website: json["website"] as String,
        companyAbout: json["companyAbout"] as String,
      );
}
