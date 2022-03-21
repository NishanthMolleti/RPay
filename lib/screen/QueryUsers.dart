class QueryUsers {
  final String name;
  final String user_info_id;
  final String account_id;
  QueryUsers(
      {required this.name,
      required this.user_info_id,
      required this.account_id});
  factory QueryUsers.fromJson(final json) {
    return QueryUsers(
        name: json["Users"]["NAME"],
        user_info_id: json["Users"]["USER_INFO_ID"],
        account_id: json["Users"]["ACCOUNT_ID"]);
  }
}
