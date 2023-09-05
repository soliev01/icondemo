// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: json['id'] as String,
      index: json['index'] as int,
      isActive: json['isActive'] as bool,
      balance: json['balance'] as String,
      picture: json['picture'] as String,
      age: json['age'] as int,
      eyeColor: json['eyeColor'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      about: json['about'] as String,
      registered: DateTime.parse(json['registered'] as String),
    );
