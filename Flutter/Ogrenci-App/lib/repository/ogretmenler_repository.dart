import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/services/data_service.dart';

import '../models/ogretmen.dart';

class OgretmenlerRepository extends ChangeNotifier{


  final List<Ogretmen> ogretmenler =[
    Ogretmen("Gazi", "Alankuş", 30, 'Erkek'),
    Ogretmen('Elif','Bulut', 28, 'Kadin')

  ];

  final DataService dataService;
  OgretmenlerRepository(this.dataService);
  Future<void> indir() async {
    Ogretmen ogretmen =  await dataService.ogretmenIndir();

    ogretmenler.add(ogretmen);
    notifyListeners();
  }


}
final ogretmenlerProvider = ChangeNotifierProvider((ref) => OgretmenlerRepository(ref.watch(dataServiceProvider)));

