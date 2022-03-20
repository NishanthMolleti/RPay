class User {
  final int Status;
  final String Name;
  final String LogId;
  final int Balance;

  User(this.Status, this.Name, this.LogId, this.Balance);

  // factory RUsers.fromJson(final json) {
  //   return RUsers(
  //         status :  json["Status"] , Name : json()
  //       //name: json["name"], education: json["education"], skill: json["skill"]);
  //       );
  // }
}
