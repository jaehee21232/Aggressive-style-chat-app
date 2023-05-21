class MessageModel {
  final String message;
  final String name;
  final String date;
  final String phonenumber;

  MessageModel(
      {this.message = "",
      this.name = "",
      this.date = "",
      this.phonenumber = ""});

  factory MessageModel.fromJson(
      {required String message, name, date, phonenumber}) {
    return MessageModel(
        date: date, name: name, message: message, phonenumber: phonenumber);
  }

  factory MessageModel.fromMap({required Map<String, dynamic> map}) {
    return MessageModel(
        name: map["name"],
        message: map["message"],
        phonenumber: map["phonenumber"],
        date: map["date"]);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data["name"] = name;
    data["message"] = message;
    data["phonenumber"] = phonenumber;
    data["date"] = date;
    return data;
  }
}
