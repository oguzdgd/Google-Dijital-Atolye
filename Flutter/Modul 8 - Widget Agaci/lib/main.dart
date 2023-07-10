import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  var sinif= 5;
  var baslik = 'Ogrenciler';
  var ogrenciler = ['Ali' ,'Ayşe', 'Berna'];

  @override
  Widget build(BuildContext context) {
    ogrenciler.add('buildden');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$sinif. Sinif',
              textScaleFactor: 2,
            ),
            Text(
              'baslik',
              textScaleFactor: 2,
            ),
            for (final o in ogrenciler)
              Text(o),
            ElevatedButton(onPressed: (){
              setState(() {
                ogrenciler.add('yeni');
              });}, child: Text('Ekle'))
          ],
        ),

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
