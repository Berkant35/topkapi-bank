


import 'package:flutter/material.dart';

class ComplexInherited extends InheritedWidget {
  ComplexInherited({
    super.key,
    required super.child,
  }) ;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  static ComplexInherited of(BuildContext context) {
    final ComplexInherited? result = context.dependOnInheritedWidgetOfExactType<ComplexInherited>();
    assert(result != null, 'No ComplexInherited found in context');
    return result!;
  }

  //Trigger anında alanları güncellememizi sağlar
  @override
  bool updateShouldNotify(ComplexInherited old) {
    return true;
  }
}
