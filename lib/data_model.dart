// //
// //     final furniture = furnitureFromJson(jsonString);

import 'dart:convert';

Furniture furnitureFromJson(String str) => Furniture.fromJson(json.decode(str));

String furnitureToJson(Furniture data) => json.encode(data.toJson());

class Furniture {
  Furniture({
    this.status,
    this.a,
    this.b,
    this.c,
    this.d,
  });

  String status;
  List<A> a;
  List<A> b;
  List<A> c;
  List<A> d;

  factory Furniture.fromJson(Map<String, dynamic> json) => Furniture(
        status: json["status"] == null ? null : json["status"],
        a: json["A"] == null
            ? null
            : List<A>.from(json["A"].map((x) => A.fromJson(x))),
        b: json["B"] == null
            ? null
            : List<A>.from(json["B"].map((x) => A.fromJson(x))),
        c: json["C"] == null
            ? null
            : List<A>.from(json["C"].map((x) => A.fromJson(x))),
        d: json["D"] == null
            ? null
            : List<A>.from(json["D"].map((x) => A.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "A": a == null ? null : List<dynamic>.from(a.map((x) => x.toString())),
        "B": b == null ? null : List<dynamic>.from(b.map((x) => x.toString())),
        "C": c == null ? null : List<dynamic>.from(c.map((x) => x.toString())),
        "D": d == null ? null : List<dynamic>.from(d.map((x) => x.toString())),
      };
}

class A {
  A({
    this.image,
  });

  String image;

  factory A.fromJson(Map<String, dynamic> json) => A(
        image: json["image"] == null ? null : json["image"],
      );
}
