import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icondemo/person/model.dart';
import 'package:icondemo/person/person_cubit.dart';
import 'package:icondemo/person/person_tile.dart';

class PersonList extends StatelessWidget {
  const PersonList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonCubit, List<Person>>(
      builder: (context, items) {
        if (items.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          prototypeItem: PersonTile(Person.dummy()),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (_, index) {
            return PersonTile(items[index]);
          },
        );
      },
    );
  }
}
