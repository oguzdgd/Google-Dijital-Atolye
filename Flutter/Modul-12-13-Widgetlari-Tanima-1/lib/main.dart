import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

import 'album.dart';
import 'input_page.dart';

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
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(
              title: 'Flutter Demı Home Page',
            ),
        '/settings': (context) => SettingsPage()
      },
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

  var sinif = 5;
  var baslik = 'Ogrenciler';
  var ogrenciler = ['Ali', 'Ayşe', 'Berna'];

  void yeniOgrenciEkle(String yeniOgrenci) {
    setState(() {
      ogrenciler = [...ogrenciler, yeniOgrenci];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/settings');
                print('settings');
              },
              icon: Icon(Icons.settings)),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: DefaultTextStyle(
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        child: SinifBilgisi(
          sinif: sinif,
          ogrenciler: ogrenciler,
          baslik: baslik,
          yeniOgrenciEkle: yeniOgrenciEkle,
          child: Stack(
            fit: StackFit.expand,
            children: [
              //ArkaPlan(),
              Positioned(
                top: 10,
                left: 10,
                right: 10,
                bottom: 120,
                child: LayoutBuilder(builder: (context, constrains) {
                  print('contrains.maxWitdh: ${constrains.maxWidth}');
                  if (constrains.maxWidth > 500) {
                    return Row(
                      children: [
                        Sinif(),
                        Expanded(
                            child: Text('Seçili olan ogrencilerin listesi')),
                      ],
                    );
                  } else {
                    return Sinif();
                  }
                }),
              ),
              Positioned(
                  bottom: 30, left: 10, right: 10, child: OgrenciEkleme()),
            ],
          ),
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
    required this.yeniOgrenciEkle,
  }) : super(child: child);
  final int sinif;
  final List<String> ogrenciler;
  final String baslik;
  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  static SinifBilgisi of(BuildContext context) {
    final SinifBilgisi? result =
        context.dependOnInheritedWidgetOfExactType<SinifBilgisi>();
    assert(result != null, 'No SinifBilgisi found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SinifBilgisi old) {
    return sinif != old.sinif ||
        baslik != old.baslik ||
        ogrenciler != ogrenciler ||
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
    return Column(
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
              style: TextStyle(
                color: Colors.amber,
                fontSize: 40,
              ),
            ),
            Icon(Icons.star),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0) + EdgeInsets.only(bottom: 10),
          child: Text(
            sinifBilgisi.baslik,
            textScaleFactor: 2,
          ),
        ),
        Expanded(child: OgrenciListesi()),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: RichText(
            text: TextSpan(text: 'Öğrencileri  ', children: const <TextSpan>[
              TextSpan(
                text: 'Yükle',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ]),
          ),
          onPressed: () async {
            final ogrenciler = SinifBilgisi.of(context).ogrenciler;

            for (final ogrenci in ogrenciler) {
              print('$ogrenci yükleniyor');
              await Future.delayed(Duration(seconds: 1));
              print('$ogrenci yüklendi');
            }
            print('Tüm ogrenciler yüklendi');
          },
        ),
        SizedBox(
          width: 300,
          height: 100,
          child: FittedBox(
            child: ElevatedButton(
              child: Text('Yeni Sayfaya Git'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AlbumPage(),
                ));
                //sor(context);
              },
            ),
          ),
        ),
        ElevatedButton(
          child: Text('Girdi Sayfası '),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => InputPage(),
            ));
            //sor(context);
          },
        ),
        ElevatedButton(
            onPressed: () {},
            child: Transform(
              transform: Matrix4.rotationZ(pi * 0.3),
              child: Icon(Icons.add),
            ))
      ],
    );
  }

  Future<void> sor(BuildContext context) async {
    try {
      bool? cevap = await cevabiAl(context);

      print('cevap geldi : $cevap');
      if (cevap == true) {
        print('beğendi!!');
        throw 'Hata Olsun !!';
      } else {
        cevap = await Navigator.of(context).push<bool>(
          MaterialPageRoute(
            builder: (context) {
              return VideoEkrani(
                  'Canın nasıl isterse...Videoyu beğendiniz mi ?');
            },
          ),
        );
      }
      if (cevap == true) {
        print('BEGENDİNİZ!!');
      }
    } catch (e) {
      print('HATA');
    } finally {
      print('------- iş bitti ----- ');
    }
  }

  Future<bool?> cevabiAl(BuildContext context) async {
    bool? cevap = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (context) {
          return VideoEkrani('Videoyu beğendiniz mi ?');
        },
      ),
    );
    return cevap;
  }
}

class VideoEkrani extends StatelessWidget {
  final String mesaj;

  const VideoEkrani(
    this.mesaj, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('pop edecek');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              //Video(),
              Placeholder(
                fallbackHeight: 150,
              ),
              SizedBox(
                height: 35,
              ),
              Text(mesaj),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).maybePop(true);
                    },
                    child: Text('Evet'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).maybePop(false);
                    },
                    child: Text('Hayır'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        ElevatedButton(
          child: Text('Play / Pause'),
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
        ),
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
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          key: ValueKey(index),
          leading: Icon(Icons.accessibility_new_outlined),
          title: Text(
            sinifBilgisi.ogrenciler[index],
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.black,
        );
      },
      itemCount: sinifBilgisi.ogrenciler.length,
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
    final sinifBilgisi = SinifBilgisi.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controller,
          onChanged: (value) {
            setState(() {});
          },
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
              onPressed: controller.text.isEmpty
                  ? null
                  : () {
                      final yeniOgrenci = controller.text;
                      sinifBilgisi.yeniOgrenciEkle(yeniOgrenci);
                      controller.text = '';
                    },
              child: Text('Ekle')),
        ),
      ],
    );
  }
}

class ArkaPlan extends StatelessWidget {
  const ArkaPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: PhysicalModel(
        color: Colors.white,
        elevation: 15,
        //Alt tarafında gölgelik yapıyor.
        shadowColor: Colors.red,
        //gölgenin rengi
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 10),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: FractionallySizedBox(
              widthFactor: 0.75,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  // color: Colors.grey.shade800,
                  child: Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: Image(
                      image: AssetImage(
                        'images/png-transparent-american-eagle-bald-eagle-bird-tawny-eagle-golden-eagle-eagle-animals-fauna-wildlife-thumbnail.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text('Settings '),
      ),
    );
  }
}
