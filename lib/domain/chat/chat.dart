class Chat {
  String id;
  String from;
  String to;
  String msg;

  Chat({required this.id, required this.from, required this.to, required this.msg});

  // dart -> map (toJson)
  Map<String, dynamic> toJson() => {
    "id": id,
    "from": from,
    "to": to,
    "msg": msg,
  };

  // map -> dart (fromJson)
  factory Chat.fromJson(Map<String, dynamic> json, {String? id}) => Chat(
    id: id ?? json["id"], // id가 null이면 json["id"] 으로 설정한다.
    from: json["from"],
    to: json["to"],
    msg: json["msg"],
  );
}