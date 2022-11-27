import 'dart:convert';

class Joke {
  Joke({
    required this.categories,
    required this.createdAt,
    required this.iconUrl,
    required this.id,
    required this.updatedAt,
    required this.url,
    required this.value,
  });

  final List<dynamic> categories;
  final DateTime createdAt;
  final String iconUrl;
  final String id;
  final DateTime updatedAt;
  final String url;
  final String value;

  factory Joke.fromJson(String str) => Joke.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Joke.fromMap(Map<String, dynamic> json) => Joke(
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        iconUrl: json["icon_url"],
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "icon_url": iconUrl,
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "url": url,
        "value": value,
      };
}
