import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icondemo/person/model.dart';

List<Person> parseItems(String json) {
  final parsed = jsonDecode(json) as List<dynamic>;
  return parsed.map((e) => Person.fromJson(e as Map<String, dynamic>)).toList();
}

class PersonCubit extends Cubit<List<Person>> {
  PersonCubit() : super(const []);

  void fetchItems() async {
    try {
      final s = await rootBundle.loadString('assets/data.json');
      final items = await compute(parseItems, s);
      emit(items);
    } catch (e, st) {
      // log
      log('Error fetching data!', error: e, stackTrace: st);
      emit(const []);
    }
  }

  void sortByDate() {
    emit(state.toList()..sort((a, b) => a.registered.compareTo(b.registered)));
  }

  void sortByName() {
    emit(state.toList()..sort((a, b) => a.name.compareTo(b.name)));
  }

  void sortByBalance() {
    emit(state.toList()..sort((a, b) => a.balance.compareTo(b.balance)));
  }
}
