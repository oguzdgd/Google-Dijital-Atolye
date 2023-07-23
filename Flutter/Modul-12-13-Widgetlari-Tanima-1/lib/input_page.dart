import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Cinsiyet {
  kadin,
  erkek,
  bos,
}

const okullar = ['ilkokul', 'ortaokul', 'üniversite'];

class _InputPageState extends State<InputPage> {
  bool? okuldaMisin = false;
  Cinsiyet? cinsiyet = Cinsiyet.bos;
  String? okul;

  double boy = 100;
  TextEditingController yorumController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    yorumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Girdi Sayfasi'),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Column(
                children:[
                  ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: constraints.maxHeight
                  ),
                    child: IntrinsicHeight(
                        child: Column(
                          children: <Widget>[
                            Container(
                              // A fixed-height child.
                              color: const Color(0xffeeee00), // Yellow
                              height: 120.0,
                              alignment: Alignment.center,
                              child: const Text('Fixed Height Content'),
                            ),
                            Expanded(
                              // A flexible child that will grow to fit the viewport but
                              // still be at least as big as necessary to fit its contents.
                              child: Container(
                                color: const Color(0xffee0000), // Red
                                height: 120.0,
                                alignment: Alignment.center,
                                child: const Text('Flexible Content'),
                              ),
                            ),
                          ],
                        ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Checkbox(
                          value: okuldaMisin,
                          onChanged: (value) {
                            setState(() {
                              okuldaMisin = value;
                            });
                          },
                        ),
                        Switch(
                          value: okuldaMisin!,
                          onChanged: (value) {
                            setState(() {
                              okuldaMisin = value;
                            });
                          },
                        ),
                        Text(okuldaMisin == true
                            ? 'Okuldasin'
                            : 'Okulda değilsin'),
                        Radio(
                          value: Cinsiyet.kadin,
                          groupValue: cinsiyet,
                          onChanged: (value) {
                            setState(() {
                              cinsiyet = value;
                            });
                          },
                        ),
                        Radio(
                          value: Cinsiyet.erkek,
                          groupValue: cinsiyet,
                          onChanged: (value) {
                            setState(() {
                              cinsiyet = value;
                            });
                          },
                        ),
                        Text(cinsiyet.toString()),
                        DropdownButtonFormField<String>(
                          value: okul,
                          items: okullar
                              .map(
                                (e) =>
                                DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ),
                          )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              okul = value;
                            });
                          },
                          validator: (value) {
                            if (!okullar.contains(value)) {
                              return 'Lütfen okul seçin';
                            }
                          },
                          onSaved: (newValue) {
                            print('Okul kaydedildi: $newValue');
                          },
                        ),
                        Text(okul ?? ''),
                        Slider(
                          value: boy,
                          min: 30,
                          max: 300,
                          onChanged: (double value) {
                            setState(() {
                              boy = value;
                            });
                          },
                        ),
                        Text(boy.toStringAsFixed(2)),
                        TextFormField(
                          controller: yorumController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'Boş Bırakılamaz';
                              } else {
                                return null;
                              }
                            } else {
                              return 'Null olamaz';
                            }
                          },
                          onSaved: (newValue) {
                            print('Yorum kaydediliyor: $newValue');
                          },
                        ),
                        Text(yorumController.text),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              okuldaMisin = false;
                              cinsiyet = Cinsiyet.bos;
                              okul = null;
                              boy = 100;
                              yorumController.text = '';
                            });
                          },
                          child: Text('Temizle'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final icerikUygunMu = formKey.currentState
                                ?.validate();
                            if (icerikUygunMu == true) {
                              final icerikUygunMu = formKey.currentState?.save();
                            }
                          },
                          child: Text('Gönder'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        )
    );
  }
}
