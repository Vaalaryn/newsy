class ConnectReturn {
  var username;
  var mail;
  var token;
  var data;

  @override
  ConnectReturn(
      {this.data, this.username, this.token, this.mail});

  factory ConnectReturn.fromJson(Map<String, dynamic> json) =>
      _connectReturnToJson(json);
}

ConnectReturn _connectReturnToJson(Map<String, dynamic> json) {
  return ConnectReturn(
    username: json['username'] as String,
    mail: json['mail'] as String,
    token: json['token'] as String,
    data: json['data'] as String,
  );
}