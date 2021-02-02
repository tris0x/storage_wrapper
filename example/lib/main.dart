import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:storage_wrapper/storage_wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String commonValue;
  String secureValue;
  final commonStorage = StorageWrapper.common();
  final secureStorage = StorageWrapper.secure();
  String allCommon;
  String allSecure;

  void writeRandom() async {
    final int random = Random().nextInt(100);
    await commonStorage.write(key: 'common', value: random.toString());
    await secureStorage.write(key: 'secure', value: random.toString());
  }

  void readValues() async {
    commonValue = await commonStorage.read(key: 'common');
    secureValue = await secureStorage.read(key: 'secure');
    setState(() {});
  }

  void clearAll() async {
    await commonStorage.deleteAll();
    await secureStorage.deleteAll();
    readValues();
  }

  void getAll() async {
    allCommon = jsonEncode(await commonStorage.getAll());
    allSecure = jsonEncode(await secureStorage.getAll());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Wrapper example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Secure value: $secureValue',
            ),
            Text(
              'Common value: $commonValue',
            ),
            Text('All commons: $allCommon'),
            Text('All secure: $allSecure'),
            ElevatedButton(onPressed: writeRandom, child: Text('Write random')),
            ElevatedButton(onPressed: readValues, child: Text('Read values')),
            ElevatedButton(onPressed: clearAll, child: Text('Clear values')),
            ElevatedButton(onPressed: getAll, child: Text('Get all values')),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
