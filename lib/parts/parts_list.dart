import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../parts/parts_detail.dart';

class PartsList extends StatelessWidget {
  final Map<String, String> parts;
  PartsList({this.parts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(parts['name']),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: [
              Color(0xff1e0d80),
              Color(0xff006400),
            ],
            stops: [
              0.0,
              1.0,
            ],
          ),
        ),
        child: JsonPartsDate(type: parts['type']),
      ),
    );
  }
}

class JsonPartsDate extends StatefulWidget {
  final String type;
  JsonPartsDate({this.type});

  @override
  _JsonPartsDateState createState() => _JsonPartsDateState();
}

class _JsonPartsDateState extends State<JsonPartsDate> {
  List _data;
  String jsonString;

  /*
   * JSONファイル読み込みテスト用
   */
  Future<String> _loadAVaultAsset() async {
    return await rootBundle.loadString('assets/json/cpu.json');
  }

  /*
   * JSON　データセット
   */
  Future getJSONData() async {
    jsonString = await _loadAVaultAsset();
    setState(() {
      final jsonResponse = json.decode(jsonString);
      print('gotcha:${widget.type}');
      // _data = jsonResponse[widget.type];
      _data = jsonResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: ListView.builder(
      itemCount: _data == null ? 0 : _data.length,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 50,
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      body: PartsDetail(data: _data[index]),
                    );
                  },
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.black54.withOpacity(0.4),
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                padding: const EdgeInsets.all(26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _data[index]['name'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      color: Colors.white,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.expand(height: 120),
                        // child: Image.network(parts['image']),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '￥${_data[index]['price']}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    ));
  }

  @override
  void initState() {
    super.initState();
    getJSONData();
  }
}
