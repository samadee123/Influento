class UserModel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String contactNo;
  final String address;
  final String dob;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.contactNo,
    required this.address,
    required this.dob,
  });

  toJson(){
    return{
      "Name": name,
      "Email": email,
      "Password": password,
      "ContactNo": contactNo,
      "Address": address,
      "Dob": dob
    };
  }
}