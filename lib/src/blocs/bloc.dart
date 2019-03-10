import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

//class Bloc with Validators {
class Bloc extends Object with Validators {
  //definimos variables privadas para q no se puedan ver desde otra classe
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  /*getters - para que sean mas claras las funciones y no tan confusas
  
  en vez de:
  bloc._email.stream.listen((value) {
    print(value);
  });

  usamos:
  bloc.email.listen((value) {
    print(value);
  }); 
  */

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
 	Stream<bool> get sumitValid => Observable.combineLatest2(email, password, (e, p) => true);

  // Change data
  Function(String) get changeEmail => _email.sink.add;  
  Function(String) get changePassword => _password.sink.add;

  summit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  //para que no queden abiertos todo el tiempo, ver carpeta 14 - video 16
  dispose() {
    _email.close();
    _password.close();
  }
}

//single global instance - carpeta 15 - video 1 y 2
//final bloc = Bloc();