import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OgretmenlerRepository extends ChangeNotifier{


  final List<Ogretmen> ogretmenler =[
    Ogretmen("Gazi", "Alankuş", 30, 'Erkek'),
    Ogretmen('Elif','Bulut', 28, 'Kadin')

  ];

}
final ogretmenlerProvider = ChangeNotifierProvider((ref) => OgretmenlerRepository());

class Ogretmen{
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogretmen(this.ad, this.soyad, this.yas, this.cinsiyet);
}