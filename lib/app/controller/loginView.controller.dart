import 'package:engenharia_projeto/app/home/home.view.dart';
import 'package:engenharia_projeto/app/models/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  // Criando uma lista de usuários
  final RxList<Usuario> usuarioList = RxList<Usuario>();

  @override
  void onInit() {
    super.onInit();

    // Adicionando um usuário exemplo (se necessário)
    Usuario newUsuario = Usuario('daniel@uesb.edu.br', '123');
    usuarioList.add(newUsuario);
  }

  void printError(String error) {
    print(error);
  }

  Future<void> logarUsuario({required String email, required String senha}) async {
    String email = emailInput.text.trim();
    String senha = passwordInput.text.trim();

    // Validação básica
    if (email.isEmpty || senha.isEmpty) {
      Get.snackbar('Erro', 'Por favor, preencha todos os campos.'); // Mensagem de erro
      return; // Retorna para evitar a execução do login
    }

    try {
      // Tentando fazer login
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: senha);
      Get.to(() => const HomeView()); // Redirecionar após login bem-sucedido
      print("Login com sucesso");
      emailInput.clear(); // Limpa o campo de email
      passwordInput.clear(); // Limpa o campo de senha
    } on FirebaseAuthException catch (e) {
      print("Erro no login: ${e.message}");
      // Exibir mensagem de erro com base no código de erro
      String message = e.message ?? 'Erro desconhecido';
      switch (e.code) {
        case 'user-not-found':
          message = 'Nenhum usuário encontrado com esse email.';
          break;
        case 'wrong-password':
          message = 'Senha incorreta.';
          break;
        // Adicione outros códigos de erro conforme necessário
      }
      Get.snackbar('Erro', message); // Exibir mensagem de erro
    }
  }

}