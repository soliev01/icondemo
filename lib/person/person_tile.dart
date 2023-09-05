import 'package:flutter/material.dart';
import 'package:icondemo/person/model.dart';

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
        leading: _Leading(p.picture),
        title: Text(p.name),
        subtitle: _Info(balance: p.balance, email: p.email, date: p.registered),
        trailing: Icon(
          Icons.circle,
          color: p.isActive ? Colors.greenAccent : Colors.red,
        ),
        isThreeLine: true,
        tileColor: Color(color),
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

class _Leading extends StatelessWidget {
  const _Leading(this.url);
  final String url;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(foregroundImage: NetworkImage(url));
  }
}
