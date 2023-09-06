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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          JumpButton(controller: _controller),
          IconButton(
            tooltip: 'Sort by Date',
            onPressed: () => context.read<PersonCubit>().sortByDate(),
            icon: const Icon(Icons.date_range),
          ),
          IconButton(
            tooltip: 'Sort by Name',
            onPressed: () => context.read<PersonCubit>().sortByName(),
            icon: const Icon(Icons.person),
          ),
          IconButton(
            tooltip: 'Sort by balance',
            onPressed: () => context.read<PersonCubit>().sortByBalance(),
            icon: const Icon(Icons.attach_money),
          ),
        ],
      ),
      body: PersonList(controller: _controller),
    );
  }
}

class JumpButton extends StatefulWidget {
  const JumpButton({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<JumpButton> createState() => _JumpButtonState();
}

class _JumpButtonState extends State<JumpButton> {
  bool isMiddle = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        isMiddle
            ? widget.controller
                .jumpTo(widget.controller.position.minScrollExtent)
            : widget.controller
                .jumpTo(widget.controller.position.maxScrollExtent / 2);
        setState(() => isMiddle = !isMiddle);
      },
      icon: Icon(isMiddle ? Icons.skip_previous : Icons.skip_next),
    );
  }
}
