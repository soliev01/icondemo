import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(createToJson: false)
class Person extends Equatable {
  final String id;
  final int index;
  final bool isActive;
  final String balance;
  final String picture;
  final int age;
  final String eyeColor;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String about;
  final DateTime registered;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  const Person({
    required this.id,
    required this.index,
    required this.isActive,
    required this.balance,
    required this.picture,
    required this.age,
    required this.eyeColor,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.about,
    required this.registered,
  });

  factory Person.dummy() => Person(
        id: '64f6d090e698263223d38746',
        index: 0,
        isActive: true,
        balance: '\$1,334,678',
        picture: 'https://picsum.photos/200',
        age: 19,
        eyeColor: 'eyecolor',
        name: 'name username',
        email: 'email@gmail.com',
        phone: '+1 (922) 485-3541',
        address: '895 Blake Avenue, Emison, Pennsylvania, 6576',
        about: '''
Laboris cillum et in Lorem. Culpa proident dolor eiusmod adipisicing incididunt mollit eu et pariatur commodo amet aliqua. Enim qui aliqua esse dolore non cillum. Exercitation mollit dolore ipsum cillum non id culpa voluptate nostrud cupidatat. Nostrud amet do do proident incididunt pariatur sint cupidatat ad. Ea ad non culpa elit ea elit aliquip id reprehenderit ullamco veniam laboris qui. Irure tempor occaecat est laborum.
        ''',
        registered: DateTime(2017),
      );
  @override
  List<Object?> get props => [id, index, name, age, email];
}

    //  {
    //   "id": "64f6e66ee7932bd1d5a92b83",
    //   "index": 19931,
    //   "isActive": false,
    //   "balance": "$1,468.52",
    //   "picture": "https://picsum.photos/200",
    //   "age": 36,
    //   "eyeColor": "blue",
    //   "name": "Haley Maynard",
    //   "email": "haleymaynard@polaria.com",
    //   "phone": "+1 (922) 485-3541",
    //   "address": "895 Blake Avenue, Emison, Pennsylvania, 6576",
    //   "about": "Laboris cillum et in Lorem. Culpa proident dolor eiusmod adipisicing incididunt mollit eu et pariatur commodo amet aliqua. Enim qui aliqua esse dolore non cillum. Exercitation mollit dolore ipsum cillum non id culpa voluptate nostrud cupidatat. Nostrud amet do do proident incididunt pariatur sint cupidatat ad. Ea ad non culpa elit ea elit aliquip id reprehenderit ullamco veniam laboris qui. Irure tempor occaecat est laborum.\r\n",
    //   "registered": "2019-08-26T01:17:16 -09:00"
    // }