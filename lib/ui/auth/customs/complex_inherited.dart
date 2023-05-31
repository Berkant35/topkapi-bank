


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComplexInherited extends InheritedWidget{
  ComplexInherited({
    super.key,
    required super.child,
  }) ;

  final TextEditingController emailController = TextEditingController(text: "berkantC93@gmail.com");
  final TextEditingController userNameController = TextEditingController(text: "Berkant");
  final TextEditingController loginEmailController = TextEditingController(text: "berkantC93@gmail.com");
  final TextEditingController loginPasswordController = TextEditingController(text: "12345678");
  final TextEditingController passwordController = TextEditingController(text: "12345678");
  final TextEditingController paymentAmountController = TextEditingController();
  final TextEditingController creditCardHolderNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final doPayBillFormKey = GlobalKey<FormState>();
  final addCreditCardFormKey = GlobalKey<FormState>();


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
