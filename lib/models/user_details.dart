class UserDetails {
  final String name;
  final String email;
  final String profilePicture;
  final String phoneNumber;
  final String address;
  final String occupation;
  final String gender;
  

  const UserDetails({
    required this.name,
    required this.email,
    this.profilePicture="",
    this.phoneNumber="",
    this.address="",
    this.occupation="",
    this.gender="",
  });

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "email": this.email,
      "phoneNumber": this.phoneNumber,
      "address": this.address,
      "profilePicture": this.profilePicture,
      "occupation": this.occupation,
    };
  }

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      name: json["name"],
      email: json["email"],
      address: json["address"],
      occupation: json["occupation"],
      profilePicture: json["profilePicture"],
    );
  }
}
