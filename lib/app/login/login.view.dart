import 'package:engenharia_projeto/app/controller/loginView.controller.dart';
import 'package:engenharia_projeto/app/login/recover_password.view.dart'; 
import 'package:engenharia_projeto/app/login/register.view.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Mudança para um tom mais claro
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // Logo
                Image.asset(
                  'lib/app/images/logoUESB.png', 
                  height: 150, 
                ),

                const SizedBox(height: 20),

                // Welcome Text
                Text(
                  'Seja bem-vindo',
                  style: TextStyle(
                    color: Colors.blueGrey[800],
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                // Email TextField
                _buildTextField(
                  controller: controller.emailInput,
                  hint: 'Email',
                ),

                const SizedBox(height: 15),

                // Password TextField
                _buildTextField(
                  controller: controller.passwordInput,
                  hint: 'Senha',
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                // Login Button
                _buildButton(
                  label: 'Entrar',
                  onTap: () async {
                    await controller.logarUsuario(email: '', senha: '');
                  },
                ),

                const SizedBox(height: 20),

                // Register Text
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hint,
        fillColor: Colors.grey[200],
        filled: true,
        contentPadding: const EdgeInsets.all(15), // Espaçamento interno
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 3, 34, 59),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Não tem uma conta?',
              style: TextStyle(color: Colors.blueGrey[700]),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                Get.to(() => const RegisterView());
              },
              child: const Text(
                'Cadastre-se',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Get.toNamed('/recover-password');
          },
          child: const Text(
            'Esqueceu sua senha?',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
