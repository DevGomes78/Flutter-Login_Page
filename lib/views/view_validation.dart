import 'package:flutter/material.dart';
import 'package:flutter_validation/utils/validate.dart';
import 'package:flutter_validation/widgets/button_widget.dart';
import 'package:flutter_validation/widgets/container_widget.dart';
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ContainerWidget(text: 'Cadastrar'),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                      ),
                      child: TextFormWidget(
                        'Nome',
                        'Digite o Nome',
                        const Icon(
                          Icons.email,
                          color: Colors.green,
                        ),
                        controller: emailController,
                        obscureText: false,
                        validator: Validate().validateEmail,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                      ),
                      child: TextFormWidget(
                        'Email',
                        'digite email',
                        const Icon(
                          Icons.email,
                          color: Colors.green,
                        ),
                        controller: emailController,
                        obscureText: false,
                        validator: Validate().validateEmail,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                      ),
                      child: TextFormWidget(
                        'Senha',
                        'digite a senha',
                        const Icon(
                          Icons.vpn_key,
                          color: Colors.green,
                        ),
                        controller: senhaController,
                        obscureText: true,
                        validator: Validate().validateSenha,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ButtonWidget(text: 'Cadastrar'),
            ],
          ),
        ),
      ),
    );
  }
}
