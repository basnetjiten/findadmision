// To parse this JSON data, do
//
//     final goNext = goNextFromJson(jsonString);

import 'dart:convert';

GoNext goNextFromJson(String str) => GoNext.fromJson(json.decode(str));

String goNextToJson(GoNext data) => json.encode(data.toJson());

class GoNext {
  GoNext({
    this.gonext,
  });

  bool gonext;

  factory GoNext.fromJson(Map<String, dynamic> json) => GoNext(
    gonext: json["gonext"],
  );

  Map<String, dynamic> toJson() => {
    "gonext": gonext,
  };
}
