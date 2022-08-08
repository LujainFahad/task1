import 'dart:convert' show json;

class JsonCoder {
  static String modelToJson(Map<String, dynamic> data) => json.encode(data);

  static /* Map<String, dynamic> */ dynamic modelFromJson(String data) =>
      json.decode(data);
}
