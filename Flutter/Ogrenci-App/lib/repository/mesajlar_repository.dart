import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MesajlarRepository extends ChangeNotifier{

  final List<Mesaj> mesajlar =[
    Mesaj("Merhaba", "Ali", DateTime.now().subtract(Duration(minutes: 3))),
    Mesaj("Orada mısın", "Ali", DateTime.now().subtract(Duration(minutes: 2))),
    Mesaj("Evet", "Ayşe ", DateTime.now().subtract(Duration(minutes: 1))),
    Mesaj("Nasılsın", "Ali", DateTime.now()),
  ];

  int yeniMesajSayisi = 4;

}
final mesajlarProvider = ChangeNotifierProvider((ref) => MesajlarRepository());

class YeniMesajSayisi extends StateNotifier<int>{
  YeniMesajSayisi(super.state);

  void sifirla(){
    state =0;
}}

final yeniMesajSayisiProvider = StateNotifierProvider<YeniMesajSayisi,int>((ref) => YeniMesajSayisi(4));


class Mesaj{
  String yazi;
  String gonderen;
  DateTime zaman;

  Mesaj(this.yazi, this.gonderen, this.zaman);
}