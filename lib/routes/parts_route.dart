import 'package:flutter/material.dart';

import '../parts/parts_list.dart';

class Parts extends StatefulWidget {
  @override
  _PartsCardState createState() => _PartsCardState();
}

class _PartsCardState extends State<Parts> {
  static const _partsName = [
    'CPU',
    'CPUクーラー',
    'マザーボード',
    'メモリ',
    'ストレージ',
    'GPU',
    'ケース',
    'ケースファン',
    '電源ユニット'
  ];
  List cards = List.generate(
      _partsName.length, (i) => CustomCard(partsName: _partsName[i])).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('パーツ'),
      ),
      // body: ListView(
      //   padding: const EdgeInsets.symmetric(
      //     vertical: 20,
      //     horizontal: 50,
      //   ),
      //   children: cards,
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: [
              Color(0xff800d59),
              Color(0xff1e0d80),
            ],
            stops: [
              0.0,
              1.0,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 50,
          ),
          children: cards,
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String partsName;
  CustomCard({this.partsName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return Scaffold(
                body: PartsList(name: partsName),
              );
            },
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.black54.withOpacity(0.4),
        margin: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        child: Container(
          padding: const EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                partsName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
