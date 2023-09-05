import 'package:flutter/material.dart';
import 'package:icondemo/person/model.dart';
import 'package:icondemo/person/person_detail.dart';

class PersonTile extends StatelessWidget {
  const PersonTile(this.p, {super.key});
  final Person p;

  @override
  Widget build(BuildContext context) {
    final id = p.id;
    final color = int.parse('0xFF${id.substring(id.length - 5, id.length)}');
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(p.name),
        subtitle: _Info(balance: p.balance, email: p.email, date: p.registered),
        trailing: Icon(
          Icons.circle,
          color: p.isActive ? Colors.greenAccent : Colors.red,
        ),
        isThreeLine: true,
        tileColor: Color(color),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DetailScreen(p: p)));
        },
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({
    required this.balance,
    required this.email,
    required this.date,
  });
  final String balance;
  final String email;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(balance), Text(email), Text(date.toString())],
    );
  }
}
