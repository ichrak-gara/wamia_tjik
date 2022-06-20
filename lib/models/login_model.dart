class UserLogin {
  int? uid;
  int? companyId;
  int? partnerId;
  String? accessToken;
  String? companyName;
  String? country;
  String? contactAddress;

  UserLogin({this.uid,
    this.companyId,
    this.partnerId,
    this.accessToken,
    this.companyName,
    this.country,
    this.contactAddress});

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      uid: json['uid'],
      companyId: json['companyId'],
      partnerId: json['partnerId'],
      accessToken: json['accessToken'],
      companyName: json['companyName'],
      country: json['country'],
      contactAddress: json['contactAddress'],
    );
  }
}
