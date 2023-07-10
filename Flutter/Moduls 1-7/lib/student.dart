class Student{

  final String name;
   int _age;

  Student? benchmate;

  Student(this.name, this._age);

  void  sayHello(){
    print("Hello I am $name, $_age years old");
    if(benchmate!=null){
      print("My benchmate : ${benchmate!.name}");
    }

  }
  void celebratebirthday() {
    _age+=1;
  }

  void celebratebirthdayourbenchmate(){
    if(benchmate!=null){
      print("$name, celebrated friend's birthday");
      benchmate!.celebratebirthday();
    }
  }

}