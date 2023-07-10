/*void main() {
 String s = 'Hello';
  String s1 = s.replaceFirst('e', 'a');
  print(s);
  print(s1);
}*/

// --- Chapter 3 ---

// 3.5 Class
/*
void main() {

  final ali= Student("Ali", "Yilmaz", 21, "male", 100);
  final selim= Student("Selim", "Yilmaz", 20, "male", 70);

  print(ali.name);
  print(ali); // If we want to print the properties in our class directly, we need to override them.Before override =  output : Instance of 'Student'

  if(ali.isItAboveAverage(90)){
    print("Excellent Ali");
  }

  print(ali.nameSurname);
  ali.nameSurname="Oguzhan Dogdu";

  //getter-setter output
  print(ali.nameSurname);

  //static field output
  print(Student.schoolName); // pay attention ! we used class name.

  //static method output
  Student.setSchoolName("Cukurova University");
  print(Student.schoolName);

}
class Student{

  //static field : this is like a global variable
  static String schoolName="Mersin University";

  //static method
  static void setSchoolName(String newSchoolName){
    schoolName=newSchoolName;
  }

  //Field
  String name;
  String surname;
  int age;
  String gender;
  int mark;
  bool gratuated;

  //Constructor -- alt + insert button
  Student(this.name, this.surname, this.age, this.gender, this.mark) : gratuated=false;

  //Method
  bool isItAboveAverage(int average){
    return mark>average;
  }

  //getter
  String get nameSurname => '$name $surname';

  //setter
  set nameSurname(String value){
    int space=value.indexOf(" ");
    name = value.substring(0,space);
    surname = value.substring(space + 1);
  }

  //override
  @override
  String toString() {
    return "$name,$surname,$age,$gender,$mark,$gratuated";
  }


}*/

// 3.6 Null Safety
/*
void main() {
  //Non-Nullable
  String s;
  s = "Oguz";
  print(s);
  print(s.length);

  //Nullable
  String? sn;
  sn = getName();// This function is non nullable because String?. Thats why we should use ! for: print(sn!.length);
  print(sn);
  print(sn!.length); //Exclamation means : We need to show that it is not nullable.


  //we should avoid exclamation (!)
  //Dealing with nullable with Type Promotion
  String? tr;
  tr = getJob();
  print(tr);
  if(tr !=null){ //İf sn is not null, write tr.length
    print(tr.length);
  }
}
String? getName() => "Selim";
String? getJob() => "Hilmi";*/

// 3.7 Catching Error
/*
void main() {
  //this is just using double parse

double s = double.parse("11.3");
  print(s);
  double a =5;
  double b=s+a;
  print(b);


  //1
  try {
    double.parse("First ");
  } catch (e) {
    print("Error Occures : " + e.toString()); // e.toString write the error and output. Output : Error Occured : FormatException: Invalid double.
  }

  //2
  try {
    double.parse("Second ");
  } on FormatException catch (e) {
    print("Format Exception Error!");
  } catch (e) {
    print("another error has occurred."); //
  }

  //finally
  try {
    double.parse("Third");
  } catch (e) {
    print("Error occured");
  } finally {
    print("Finally"); // Finally works whether there is an error or not.
  }
  //Throw : the developer herself can generate the error message.
  int a=5;
  if(a!=6){
    throw Exception ('This is an error. Tt shouldnt have been like this');
  }
*/

// 3.8 Flutter Lints
// 3.9 Using Libraries

// --- Chapter 4 ---

// 4.1 Class
/*
import 'package:dijital_atolye/student.dart';

void  main() {
  Student s1 = Student("Oguz", 23);
  Student s2 = Student("Sade", 22);


  s1.sayHello();
  s2.sayHello();

  s1.celebratebirthday();

  s1.sayHello();
  s2.sayHello();
  //s1._name="selami"; we add "_" this .and also we put the Student class in another file. So we cant change the fields.
  s1.sayHello();


}
*/

// 4.2 References
/*import 'package:dijital_atolye/student.dart';

void  main() {
  Student s1 = Student("Oguz", 23);
  Student s2 = Student("Sade", 22);

  s1.sayHello();
  s2.sayHello();

  s1.benchmate=s2;
  s2.benchmate=s1;
  print("s1:s2");

  s1.sayHello();
  s2.sayHello();

  s1.celebratebirthdayourbenchmate();
  s1.sayHello();
  s2.sayHello();

}*/

// 4.3 Immutable and Final

// 4.4 Constructor
/*import 'package:flutter/cupertino.dart';

const o = Worker.sixth("Hilmi", 700); // Const Constructor. If you realize. We don't have to use "Worker" while we create w3.
void main() {
  final Worker w1 = Worker("Murat", 0);
  final Worker w2 = Worker.fifth("Selami");//Named Constructor
  final Worker w3 = Worker.cc(); //Factory

  w1.introduceYourself();
  w2.introduceYourself();
  o.introduceYourself();
  w3.introduceYourself();

}

@immutable // This hints for immutable objects in your class.
class Worker {
  final String name;
  final int wage;

  //Constructor
  Worker(this.name, int wage) : wage = 500 { //initialize area : " : wage=500 "
    // name="Oguz"; // Normally this code does not work. Because name is a final.But we add late ,so we can use now .
  }

  //Named Constructor
  Worker.fifth(String name) : this(name, 0);

  //Const Constructors
  const Worker.sixth(this.name, this.wage);

  //Factory
  factory Worker.cc() {
    return o;
  }

  void introduceYourself() {
    print("Hello, I am $name, My wage is $wage");
  }
}*/

// 4.5 Getter Setter
/*
void main(){

  Student s1= Student("Tunahan", 12);


  print(s1.classNumber);//getter Output:Class Number: 7

  s1.classNumber=1;//setter
  print(s1.age);//  Now We can check if the age value has changed or not. Output: 6

  //Protecting variable
  s1._branch="A";
  print(s1._branch);

}
class Student{

  String name;
  int age;
  String _branch='';


  //Protecting the Variable
  String get branch => _branch;

  set branch(String value) {
    _branch = value;

  } //getter
  int get classNumber{
    print("Class Number:");
     return age-5;
  }

  set classNumber(int s){
     age = s + 5;
  }

  Student(this.name, this.age);
}*/

// 4.6 Inheritance
/* void main(){

   List<Teacher> teachers =[
     Teacher("Rui"),
     TurkishTeacher("Zamirler", "Hilal")
   ];
   for(final t in teachers){
     t.sayHello();
   }
 }

 class Teacher {
   String name;
   Teacher(this.name);

   void sayHello(){
     print("Hello, I am  teacher $name ");
   }
 }

 class TurkishTeacher extends Teacher{
   String chapter;
   TurkishTeacher(this.chapter,String name) : super(name);

   @override
  void sayHello() {
    super.sayHello();
    print("$chapter konusunda kalmıştık.");
  }
 }*/

//4.7 Generic Types
/*void main(){

  final m =MyClass<String>("merhaba");
  print(m.val);
  m.kullan();
}
class MyClass<T extends String> {
  T val;

  MyClass(this.val);

  void kullan(){
    print(val.length);
  }
}*/
/*void main() {
  final turkishTeacher = TurkishTeacher("Zamirler", "Hilal");
  final teacher = Teacher("Rui");


  final ali =Student<Teacher>(turkishTeacher);
  ali.merhabalas();
}

class Student<T extends  Teacher>{

  T gozeten;
  Student(this.gozeten);

  void merhabalas(){
    print("Ogrenci merhabalaşıyor");
    gozeten.sayHello();
  }
}

class Teacher {
  String name;
  Teacher(this.name);

  void sayHello(){
    print("Hello, I am  teacher $name ");
  }
}

class TurkishTeacher extends Teacher{
  String chapter;
  TurkishTeacher(this.chapter,String name) : super(name);

  @override
  void sayHello() {
    super.sayHello();
    print("$chapter konusunda kalmıştık.");
  }
}*/

// --- Chapter 5 --- (Artık Türkçe yazacağım)

//5.1 Collection'lar
/*void main(){
  final List<int> l =[1,2,3];
  final s={1,2,3};
  final m={1:10,2:20,3:30};

  Iterable<int>li=l; //list bir ıterable
  Iterable<int>si=s; //set bir ıterable
  //Iterable<int>mi=m  //map bir ıterable değil.Bu yüzden böyle kullanamayız.
  final mei =m.entries;
  final mki =m.keys;
  final mvi=m.values;

  //list için döngü
  print("list 1. yöntem");
  for(final e in l){
    print(e);
  }

  print("list 2. yöntem");
  for(var i =0;i<l.length;i++){
    print(l[i]);
  }

  //set için
  print("Set için sadece bu yontem var.");
  for(final e in s){
    print(e);
  }

  //Map için her bir key value ve entries'i tek tek böyle kullanabiliriz.

  print("Map için");
  for(final e in m.entries){
    print('${e.key} ${e.value}');
  }
  for (final k in m.keys){
    print(k);
  }

  for(final v in m.values){
    print(v);
  }

  for(final e in mvi){
    print(e);
  }
  print(li.first);
  print(li.last);
  print(li.length);

  print(li.contains(4));

  li.forEach((element) {print(element);});

   li.toList();
}*/

// 5.2 Collection Operatörleri
/*void main(){
  final l =[1,2,3];
  final s ={1,2,3};
  final m ={1:10,2:20,3:30};

  //Spread Operatörü
  print("Spread Operatörü");
  print([1,23,45,...l,44,66]);
  print({1,23,45,...s,56,34});
  print({1:10,...m,3:34});


  //Collection ıf ve for
  print("Collection ıf ve for");
  print([1,
  2,
  if(1==1)
    66,
  if(1!=1)
    77
  else
    88,
  3
  ]);

  print({1,
  2,
    if(1==1)
      66,
  3,
    for(int i =4;i<7;i++)
      i
  });

  print({1:1,
  2:2,
    for(int i=4;i<7;i++)
      i:i*10,

  3:3,
    if(1!=1)
      4:44
    else
      1:55
  });

  //Spread ve if /for kombinasyonu
  print("Spread ve if /for kombinasyonu");

  print([1,
  2,
  if(1==1)
    ...[50,60,70],

  3,
  if(1==1)
    for(int i =7 ;i<10;i++)
    i
  ]);


  //Liste birleştirme
  print("Liste birleştirme");
  print([1,2,3] + [4,5,6]);

}*/

// 5.3 Collection Methodları
/*void main() {
  var a;
  final iterable = [1, 2, 3, 4, 5,6, 7, 8, 9, 0];

  print(iterable);
  print(iterable.first);
  print(iterable.last);

  print(iterable.firstWhere((element) => element % 4 == 0));

  print("Tüm elemanlara sorma");
  if (iterable.any((element) => element % 11 == 0)) {
    print("11'e bölünen var : 0 }");
  }

  if (iterable.every((element) => element >= 0)) {
    print('Elemanların hepsi 0 dan büyük');
  }

  //elemanların toplamı
  print(iterable.fold<int>(
      0, (previousValue, element) => previousValue + element));

  //Where ile filtreleme
  print(iterable.where((element) => element > 4));

  //her elemanı dönüştürme
  print(iterable.map((e) => '$e  sayısı'));
}*/

// --- CHAPTER 6 FLUTTER'A GİRİS ---

//6.1 Flutter'a giriş
/*import 'package:flutter/material.dart';

void main() {
  print("1. main çalıştırıldı");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
     MyApp({super.key}){
    print("2. MyApp çalıştırıldı.");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
       print("3. MyApp 'in buildi çalıştırılıyor.");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
     MyHomePage({super.key, required this.title}){
    print("4. MyHomePage oluşturuluyor MyApp build tarafından.Buradan MyHomePage createstate gidecek ve daha sonra MyApp builddeki MaterialApp return edilecek.");
  }

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(){
    print("5. MyHomePage state oluşturuluyor.MyHomePage state bir kez oluşturuluyor.");
  }
  int _counter = 0;

  void _incrementCounter() {
    print("7. increment counter");
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("6. MyHomePage state build çağırılıyor. Burası çalıştırılana kadar Homepage sayfası gözükmüyor. Butona her basıldığında buraya giriyor.");

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/

// 6.3 Flutter Inspector
// 6.4 Bazı Temel Widgetlar
/*import 'package:flutter/material.dart';

void main() {
  print("1. main çalıştırıldı");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}){
    print("2. MyApp çalıştırıldı.");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("3. MyApp 'in buildi çalıştırılıyor.");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title}){
    print("4. MyHomePage oluşturuluyor MyApp build tarafından.Buradan MyHomePage createstate gidecek ve daha sonra MyApp builddeki MaterialApp return edilecek.");
  }

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(){
    print("5. MyHomePage state oluşturuluyor.MyHomePage state bir kez oluşturuluyor.");
  }
  int _counter = 0;

  void _incrementCounter() {
    print("7. increment counter");
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("6. MyHomePage state build çağırılıyor. Burası çalıştırılana kadar Homepage sayfası gözükmüyor. Butona her basıldığında buraya giriyor.");

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(widget.title),
        actions: [
          IconButton(icon: Icon(Icons.remove),
            onPressed: () { print('remove'); },),
          IconButton(icon: Icon(Icons.add),
            onPressed: () { print('add'); },),

        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,


      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text("ajsdkasd")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label:'Bir'),
          BottomNavigationBarItem(icon: Icon(Icons.ice_skating),label: 'İki')
        ],
      ),
    );
  }
}*/

// ---Chapter 7 Flutter (StatelessWidget ve StatefulWidget)
// 7.1
// 7.2 Stateless ve Stateful Widgetlar
/*import 'package:flutter/material.dart';

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
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Yazi('suan ki deger:$_counter'),
            Sayac('disaridaki deger : $_counter',
            ilkDeger:3,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class Yazi extends StatelessWidget {
  final String icerik;
  const Yazi(this.icerik, {super.key});

  @override
  Widget build(BuildContext context) {
    print("stateless build");
    return Text(icerik);
  }
}

class Sayac extends StatefulWidget {
  final String baslik;
  final ilkDeger;
  const Sayac(this.baslik, {super.key, required this.ilkDeger});

  @override
  State<Sayac> createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int sayi =0;

  @override
  void initState() {
    print("initstate ");
    super.initState();
    sayi=widget.ilkDeger;
  }
  @override
  Widget build(BuildContext context) {
    print("Stateful build");
    return ElevatedButton(

        onPressed: () {
          print('Glecek buton çağırıldı.');
          print('Sayi ilk deger : $sayi');
          setState(() {
            sayi++;

          });
          print('sayi son deger : $sayi');
        },
        child: Text('${widget.baslik},içerideki $sayi'));
  }
}*/
// 7.3 State ve setState()
// 7.4 State ile Etkileşimli Deneyimler
/*import 'package:flutter/material.dart';

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

  String text='';
  int aktifButon =0;
  bool isaretliMi= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value){
                print(value);
                setState(() {
                  text=value;
                  isaretliMi= value.length.isEven;
                });
              },
            ),
            Text(text),
            Checkbox(value: isaretliMi,
                onChanged: (value){
              setState(() {
                if(value !=null){
                  isaretliMi=value;
                }
                });
                }),

            ElevatedButton(
                onPressed: aktifButon==0 ? () {
                  setState(() {
                  aktifButon = (aktifButon + 1) % 2;

                  });
                  print('0');
                }: null,
                child: Text('0')
            ),
            ElevatedButton(
                onPressed: aktifButon==1 ? () {
                  setState(() {
                    aktifButon = (aktifButon + 1) % 2;

                  });
                  print('0'); }
                    : null,
                child: Text('1')
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
// 7.5 initState, dispose, didUpdateWidget
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
      title: 'Flutter Application',
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
  String text = '';
  int aktifButon = 0;
  String istenenYazi='';
  bool isaretliMi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            YaziYazmaYeri(istenenYazi : istenenYazi),
            Text(text),
            Checkbox(
                value: isaretliMi,
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      isaretliMi = value;
                    }
                  });
                }),
            ElevatedButton(
                onPressed: aktifButon == 0
                    ? () {
                        setState(() {
                          aktifButon = (aktifButon + 1) % 2;
                          istenenYazi='sifir';

                        });
                        print('0');
                      }
                    : null,
                child: Text('0')),
            ElevatedButton(
                onPressed: aktifButon == 1
                    ? () {
                        setState(() {
                          aktifButon = (aktifButon + 1) % 2;
                          istenenYazi='bir';
                        });
                        print('0');
                      }
                    : null,
                child: Text('1'))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class YaziYazmaYeri extends StatefulWidget {
  final istenenYazi;
  const YaziYazmaYeri({
    super.key, required this.istenenYazi,
  });

  @override
  State<YaziYazmaYeri> createState() => _YaziYazmaYeriState();
}

class _YaziYazmaYeriState extends State<YaziYazmaYeri> {

   late TextEditingController controller;

  @override
  void initState() {
    controller=TextEditingController();
    controller.addListener(() {
      print('yeni degerr: ${controller.text}');
    });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YaziYazmaYeri oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.istenenYazi != widget.istenenYazi){
      controller.text =widget.istenenYazi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
          suffixIcon: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          controller.text='';
        },
      )),
    );
  }
}
