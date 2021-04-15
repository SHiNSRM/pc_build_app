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
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['model'],
              style: const TextStyle(
                fontSize: 42,
              ),
            ),
            Container(
              color: Colors.white,
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(height: 180),
                // child: Image.network(parts['image']),
              ),
            ),
            DescriptionBox(title: 'title', text: 'text'),
            DescriptionBox(title: 'title2', text: 'text2'),
          ],
        ),
      ),
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
      margin: const EdgeInsets.symmetric(vertical: 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 36,
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
              fontSize: 28,
            ),
          )
        ],
      ),
    );
  }
}
