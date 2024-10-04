import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPasswordController extends GetxController {
  TextEditingController emailInput = TextEditingController();

  Future<void> recoverPassword() async {
    String email = emailInput.text.trim();

    // Validação básica
    if (email.isEmpty) {
      Get.snackbar('Erro', 'Por favor, preencha o campo de email.');
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar('Sucesso', 'Um link de recuperação foi enviado para seu email.');
      emailInput.clear(); // Limpar o campo de email
    } on FirebaseAuthException catch (e) {
      String message;

      // Tratamento específico de erros do Firebase
      switch (e.code) {
        case 'invalid-email':
          message = 'Email inválido.';
          break;
        case 'user-not-found':
          message = 'Nenhum usuário encontrado com esse email.';
          break;
        default:
          message = 'Ocorreu um erro ao enviar o link de recuperação.';
      }
      
      Get.snackbar('Erro', message);
      print("Erro na recuperação de senha: $message");
    } catch (e) {
      Get.snackbar('Erro', 'Ocorreu um erro ao enviar o link de recuperação.');
      print("Erro na recuperação de senha: $e");
    }
  }
}
