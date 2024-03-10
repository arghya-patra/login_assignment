import 'dart:convert';

CatagoryModel catagoryModelFromJson(String str) =>
    CatagoryModel.fromJson(json.decode(str));

String catagoryModelToJson(CatagoryModel data) => json.encode(data.toJson());

class CatagoryModel {
  bool response;
  String message;
  List<Datum> data;
  String error;

  CatagoryModel({
    required this.response,
    required this.message,
    required this.data,
    required this.error,
  });

  factory CatagoryModel.fromJson(Map<String, dynamic> json) => CatagoryModel(
        response: json["response"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
      };
}

class Datum {
  int id;
  int sequence;
  String category;
  String icon;
  int status;
  String lnBn;
  String lnHn;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.sequence,
    required this.category,
    required this.icon,
    required this.status,
    required this.lnBn,
    required this.lnHn,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sequence: json["sequence"],
        category: json["category"],
        icon: json["icon"],
        status: json["status"],
        lnBn: json["ln_bn"],
        lnHn: json["ln_hn"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sequence": sequence,
        "category": category,
        "icon": icon,
        "status": status,
        "ln_bn": lnBn,
        "ln_hn": lnHn,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
