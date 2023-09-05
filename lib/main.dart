import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:icondemo/person/person_cubit.dart';

import 'package:icondemo/person/person_list.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => PersonCubit()..fetchItems(),
        child: const Home(),
      ),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.read<PersonCubit>().sortByDate(),
            icon: const Icon(Icons.date_range),
          ),
          IconButton(
            onPressed: () => context.read<PersonCubit>().sortByName(),
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () => context.read<PersonCubit>().sortByBalance(),
            icon: const Icon(Icons.attach_money),
          ),
        ],
      ),
      body: PersonList(),
    );
  }
}
