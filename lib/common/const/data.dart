import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();
final koreanTextList = [
  "ㄱ",
  "ㄴ",
  "ㄷ",
  "ㄹ",
  "ㅁ",
  "ㅂ",
  "ㅅ",
  "ㅇ",
  "ㅈ",
  "ㅊ",
  "ㅋ",
  "ㅌ",
  "ㅍ",
  "ㅎ",
  "ㅏ",
  "ㅑ",
  "ㅓ",
  "ㅕ",
  "ㅗ",
  "ㅛ",
  "ㅜ",
  "ㅠ",
  "ㅡ",
  "ㅣ",
  "ㅔ",
  "ㅐ",
  "ㅃ",
  "ㅉ",
  "ㄸ",
  "ㄲ",
  "ㅆ",
  "ㅒ",
  "ㅖ",
  "D",
  "C"
];

siginInWithDevice(double number, String name) async {
  await storage.write(key: "login", value: "true");
  await storage.write(key: "number", value: number.toInt().toString());
  await storage.write(key: "name", value: name);
}
