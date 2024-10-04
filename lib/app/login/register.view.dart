import 'package:engenharia_projeto/app/controller/register.controller.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navegar de volta para a tela anterior
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Cadastre-se',
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
                  hint: 'Email institucional',
                ),

                const SizedBox(height: 15),

                // Password TextField
                _buildTextField(
                  controller: controller.passwordInput,
                  hint: 'Senha',
                  obscureText: true,
                ),

                const SizedBox(height: 15),

                // Confirm Password TextField
                _buildTextField(
                  controller: controller.confirmPasswordInput,
                  hint: 'Confirme a Senha',
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                // Register Button
                _buildButton(
                  label: 'Criar Conta',
                  onTap: () async {
                    await controller.createAccount();
                  },
                ),
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
        contentPadding: const EdgeInsets.all(15),
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
}
