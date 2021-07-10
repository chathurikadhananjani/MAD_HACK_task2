import 'package:flutter/cupertino.dart';

class TravelModel{
  final String title;
  final String image;
  final String shortDetail;
  final String description;

  TravelModel({required this.title,required this.image,required this.shortDetail,required this.description});
  factory TravelModel.fromJson(Map<String, dynamic> json) => TravelModel(
    title: json['Title'],
    image: json['image'],
    shortDetail: json['short-detail'],
    description: json['description']
  );
}


