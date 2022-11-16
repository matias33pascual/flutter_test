import 'dart:convert';

class Value {
  final int value;

  Value({
    required this.value,
  });

  factory Value.fromJson(String str) => Value.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Value.fromMap(Map<String, dynamic> json) => Value(
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "value": value,
      };
}
