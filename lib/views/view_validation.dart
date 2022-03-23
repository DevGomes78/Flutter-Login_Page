import 'package:flutter/material.dart';
import 'package:flutter_validation/utils/validate.dart';
import 'package:flutter_validation/widgets/text_form_widget.dart';

class Validation extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController sobreNomeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                TextFormWidget(
                  'Nome',
                  'Digite o Nome',
                  const Icon(Icons.person_add),
                  controller: nomeController,
                  obscureText: false,
                  validator: Validate().validateNome,
                ),
                const SizedBox(height: 10),
                TextFormWidget(
                  'Sobrenome',
                  'Digite o Sobrenome',
                  const Icon(Icons.person_add),
                  controller: sobreNomeController,
                  obscureText: false,
                  validator: Validate().validateSobreNome,
                ),
                const SizedBox(height: 10),
                TextFormWidget(
                  'Telefone',
                  'Digite o Telefone',
                  const Icon(Icons.phone),
                  controller: phoneController,
                  obscureText: false,
                  validator: Validate().validatePhone,
                ),
                const SizedBox(height: 10),
                TextFormWidget(
                  'email',
                  'Digite o Email',
                  const Icon(Icons.email),
                  controller: emailController,
                  obscureText: false,
                  validator: Validate().validateEmail,
                ),
                const SizedBox(height: 10),
                TextFormWidget(
                  'Senha',
                  'Digite a Senha',
                  const Icon(Icons.lock),
                  controller: senhaController,
                  obscureText: true,
                  validator: Validate().validateSenha,
                ),
                const SizedBox(height: 10),
                buildGestureDetector()
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: const Text(
          'Validar',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
