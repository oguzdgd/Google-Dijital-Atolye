// 8.1 - 8.2 - 8.3
/*
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

  void yeniOgrenciEkle(String yeniOgrenci){
    setState(() {
      ogrenciler.add(yeniOgrenci);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Sinif(
          sinif: sinif,
          ogrenciler: ogrenciler,
          baslik:baslik,
          yeniOgrenciEkle:yeniOgrenciEkle,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Sinif extends StatelessWidget {
  const Sinif({
    super.key,
    required this.sinif,
    required this.ogrenciler,
    required this.baslik,
    required  this.yeniOgrenciEkle,
  });

  final int sinif;
  final List<String> ogrenciler;
  final String baslik;
  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.star),
            Text(
              '$sinif. Sinif',
              textScaleFactor: 2,
            ),
            Icon(Icons.star),
          ],
        ),
        Text(
          'baslik',
          textScaleFactor: 2,
        ),
        OgrenciListesi(ogrenciler: ogrenciler),
        OgrenciEkleme(yeniOgrenciEkle:yeniOgrenciEkle)
      ],
    );
  }
}


class OgrenciListesi extends StatelessWidget {
  const OgrenciListesi({
    super.key,
    required this.ogrenciler,
  });

  final List<String> ogrenciler;

  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisSize: MainAxisSize.min,

      children: [
      for (final o in ogrenciler)
        Text(o),
      ],
    );
  }
}
class OgrenciEkleme extends StatefulWidget {

  const OgrenciEkleme({
    super.key,
    required  this.yeniOgrenciEkle,
  });

  final void Function(String yeniOgrenci) yeniOgrenciEkle;
  @override
  State<OgrenciEkleme> createState() => _OgrenciEklemeState();
}

class _OgrenciEklemeState extends State<OgrenciEkleme> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controller,
          onChanged: (value){
            setState(() {

            });
          },
        ),
        ElevatedButton(
            onPressed:controller.text.isEmpty ? null: (){
              final yeniOgrenci =controller.text;
              widget.yeniOgrenciEkle(yeniOgrenci);
              controller.text='';
              // setState(() {
              //   ogrenciler.add('yeni');
              // });
            },
            child: Text('Ekle')),
      ],
    );
  }
}*/

//8. 4 Inherited Widget // Hata veriyor nedense :/
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

  void yeniOgrenciEkle(String yeniOgrenci){
    setState(() {
      ogrenciler=[...ogrenciler,yeniOgrenci];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SinifBilgisi(
        sinif: sinif,
        ogrenciler: ogrenciler,
        baslik:baslik,
        yeniOgrenciEkle:yeniOgrenciEkle,
        child: const Sinif(
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SinifBilgisi extends InheritedWidget {
  const SinifBilgisi({
    super.key,
    required Widget child,
    required this.sinif,
    required this.ogrenciler,
    required this.baslik,
    required  this.yeniOgrenciEkle,
  }) : super(child: child);
  final int sinif;
  final List<String> ogrenciler;
  final String baslik;
  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  static SinifBilgisi of(BuildContext context) {
    final SinifBilgisi? result = context.dependOnInheritedWidgetOfExactType<SinifBilgisi>();
    assert(result != null, 'No SinifBilgisi found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SinifBilgisi old) {
    return sinif !=old.sinif ||
          baslik !=old.baslik ||
          ogrenciler!=ogrenciler||
          yeniOgrenciEkle != old.yeniOgrenciEkle;
  }
}

class Sinif extends StatelessWidget {
  const Sinif({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final sinifBilgisi = SinifBilgisi.of(context);
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.star),
            Text(
              '${sinifBilgisi.sinif}. Sinif',
              textScaleFactor: 2,
            ),
            Icon(Icons.star),
          ],
        ),
        Text(
          'baslik',
          textScaleFactor: 2,
        ),
        OgrenciListesi(),
        OgrenciEkleme()
      ],
    );
  }
}


class OgrenciListesi extends StatelessWidget {
  const OgrenciListesi({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final sinifBilgisi = SinifBilgisi.of(context);
    return Column (
      mainAxisSize: MainAxisSize.min,

      children: [
        for (final o in sinifBilgisi.ogrenciler)
          Text(o),
      ],
    );
  }
}
class OgrenciEkleme extends StatefulWidget {

  const OgrenciEkleme({
    super.key,
  });

  @override
  State<OgrenciEkleme> createState() => _OgrenciEklemeState();
}

class _OgrenciEklemeState extends State<OgrenciEkleme> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sinifBilgisi=SinifBilgisi.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controller,
          onChanged: (value){
            setState(() {

            });
          },
        ),
        ElevatedButton(
            onPressed:controller.text.isEmpty ? null: (){
              final yeniOgrenci =controller.text;
              sinifBilgisi.yeniOgrenciEkle(yeniOgrenci);
              controller.text='';
 
            },
            child: Text('Ekle')),
      ],
    );
  }
}