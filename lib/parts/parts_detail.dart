import 'package:flutter/material.dart';

class PartsDetail extends StatelessWidget {
  final dynamic data;
  PartsDetail({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['model']),
      ),
      body: Center(child: Text(data['model'])),
    );
  }
}