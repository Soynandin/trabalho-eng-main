import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  TextEditingController confirmPasswordInput = TextEditingController();

  Future<void> createAccount() async {
    String email = emailInput.text.trim();
    String senha = passwordInput.text.trim();
    String confirmSenha = confirmPasswordInput.text.trim();

    // Validação básica
    if (email.isEmpty || senha.isEmpty || confirmSenha.isEmpty) {
      Get.snackbar('Erro', 'Por favor, preencha todos os campos.');
      return;
    }

    // Verifica se o email termina com '@uesb.edu.br'
    if (!email.endsWith('@uesb.edu.br')) {
      Get.snackbar('Erro', 'O email deve terminar com @uesb.edu.br.');
      return;
    }

    // Verifica se as senhas são iguais
    if (senha != confirmSenha) {
      Get.snackbar('Erro', 'As senhas não coincidem.');
      return;
    }

    try {
      // Criar usuário com Firebase
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: senha);
      Get.snackbar('Sucesso', 'Conta cadastrada com sucesso!');

      // Limpar os campos
      emailInput.clear();
      passwordInput.clear();
      confirmPasswordInput.clear();

      // Redirecionar para a tela de login
      Get.offNamed('/login'); // Redireciona para a rota de login
    } on FirebaseAuthException catch (e) {
      String message;

      // Tratamento específico de erros do Firebase
      switch (e.code) {
        case 'email-already-in-use':
          message = 'Este email já está em uso.';
          break;
        case 'invalid-email':
          message = 'Email inválido.';
          break;
        case 'operation-not-allowed':
          message = 'Operação não permitida.';
          break;
        case 'weak-password':
          message = 'A senha deve ter pelo menos 6 caracteres.';
          break;
        default:
          message = 'Ocorreu um erro ao criar a conta. Tente novamente.';
      }
      
      Get.snackbar('Erro', message);
      print("Erro no cadastro: $message");
    } catch (e) {
      Get.snackbar('Erro', 'Ocorreu um erro ao criar a conta.');
      print("Erro no cadastro: $e");
    }
  }
}
