import 'package:flutter/material.dart';
import 'package:icondemo/person/model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.p});
  final Person p;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
              height: 200,
              child: Image.network(
                /// to prevent iamge cache add timestamp to the url
                '${p.picture}?${DateTime.now().millisecondsSinceEpoch.toString()}',
              )),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(p.about),
          ),
        ],
      ),
    );
  }
}
