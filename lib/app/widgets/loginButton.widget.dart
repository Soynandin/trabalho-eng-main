import 'package:engenharia_projeto/app/controller/loginView.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class LoginButton extends GetView<LoginController> {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, // Set the button color directly
    foregroundColor: Colors.white,
    ),
      onPressed:() { controller.logarUsuario(email: controller.emailInput.text, senha:controller.passwordInput.text );},
      child: const Text('Entrar'),
      );
  }
}