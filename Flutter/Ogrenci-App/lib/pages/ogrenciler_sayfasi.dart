import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/repository/ogrenciler_repository.dart';

class OgrencilerSayfasi extends ConsumerWidget {
  const OgrencilerSayfasi({super.key});

  Widget build(BuildContext context,WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Ogrenciler')),
      body: Column(
        children: [
           PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.00,vertical: 30.00),
                child: Text(
                    "${ogrencilerRepository.ogrenciler.length} Ogrenci"
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) =>  OgrenciSatiri(
                ogrencilerRepository.ogrenciler[index],
              ),
              separatorBuilder:(context, index) => const Divider(),
              itemCount: ogrencilerRepository.ogrenciler.length,

            ),
          ),
        ],
      ),
    );
  }
}

class OgrenciSatiri extends ConsumerWidget {
  final Ogrenci ogrenci;
  const OgrenciSatiri(this.ogrenci, {
    super.key,
  });
  Widget build(BuildContext context,WidgetRef ref) {
    bool seviyorMuyum = ref.watch(ogrencilerProvider).seviyorMuyum(ogrenci);
    return ListTile(
      title: Text(ogrenci.ad + '  '+ ogrenci.soyad ),
      leading: Text(ogrenci.cinsiyet == 'Kadin'  ? '👩' :'👨'),
      trailing: IconButton(
          onPressed: () {
            ref.read(ogrencilerProvider).sev(ogrenci,!seviyorMuyum);
          },
          icon: Icon(seviyorMuyum ? Icons.favorite : Icons.favorite_border)),
    );
  }
}

