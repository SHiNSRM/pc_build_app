import 'package:flutter/material.dart';

class PartsDetail extends StatelessWidget {
  final dynamic data;
  PartsDetail({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['name']),
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['name'],
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                color: Colors.white,
                child: ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 180),
                  // child: Image.network(parts['image']),
                ),
              ),
              DescriptionBox(title: 'ソケット形状', text: data['desc']['socket']),
              DescriptionBox(title: 'コア数', text: data['desc']['core']),
              DescriptionBox(title: 'クロック周波数', text: data['desc']['clock']),
              DescriptionBox(title: 'スレッド数', text: data['desc']['thread']),
            ],
          ))),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  final String title;
  final String text;
  DescriptionBox({this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.white,
                width: 1.5,
              ),
            )),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}
