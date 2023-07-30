import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/pages/mesajlar_sayfasi.dart';
import 'package:ogrenci_app/pages/ogrenciler_sayfasi.dart';
import 'package:ogrenci_app/pages/ogretmenler_sayfasi.dart';
import 'package:ogrenci_app/repository/mesajlar_repository.dart';
import 'package:ogrenci_app/repository/ogrenciler_repository.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';
// import 'package:ogrenci_app/repository/mesajlar_repository.dart';
// import 'package:ogrenci_app/repository/ogrenciler_repository.dart';
// import 'package:ogrenci_app/repository/ogretmenler_repository.dart';

void main() {
  runApp(const ProviderScope(child: OgrenciApp()));
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ogrenci Uygulaması',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  AnaSayfa(title: 'Ogrenci Ana Sayfa'),
    );
  }
}

class AnaSayfa extends ConsumerWidget {
  final String title;
   AnaSayfa({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);
    final ogretmenlerRepository = ref.watch(ogretmenlerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
         children: [
           TextButton(onPressed: () {
             _mesajlaraGit(context);
           },
               child:Text('${ref.watch(yeniMesajSayisiProvider)} yeni mesaj'),
           ),
           TextButton(onPressed: () {
             _ogrencilereGit(context);
           },
             child: Text('${ogrencilerRepository.ogrenciler.length} yeni ogrenci'),
           ),
           TextButton(onPressed: () {
             _ogretmenlereGit(context);
           },
             child: Text('${ogretmenlerRepository.ogretmenler.length} yeni ogretmen'),
           ),
         ],
        ),
      ),
    );
  }

  void _ogretmenlereGit(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OgretmenlerSayfasi()));
  }

  void _ogrencilereGit(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return  const OgrencilerSayfasi();
    },));
  }

  Future<void> _mesajlaraGit(BuildContext context) async {
     await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MesajlarSayfasi()));
  }

}








