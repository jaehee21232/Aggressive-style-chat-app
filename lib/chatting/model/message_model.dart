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

  factory MessageModel.fromMap(
      {required String message, name, date, phonenumber}) {
    return MessageModel(
        date: date, name: name, message: message, phonenumber: phonenumber);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data[name] = name;
    data[message] = message;
    data[phonenumber] = phonenumber;
    data[date] = date;
    return data;
  }
}
