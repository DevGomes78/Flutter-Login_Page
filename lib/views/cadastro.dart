import 'package:flutter/material.dart';
import 'package:flutter_validation/constants/routes_api.dart';
import 'package:flutter_validation/sing_up/sing_up_service.dart';
import 'package:flutter_validation/utils/validate.dart';
import 'package:flutter_validation/views/login_page.dart';
import 'package:flutter_validation/widgets/button_widget.dart';
import 'package:flutter_validation/widgets/container_widget.dart';
import 'package:flutter_validation/widgets/text_form_widget.dart';
import 'package:flutter_validation/widgets/text_widget.dart';

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool _obscureText = true;
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
                          Icons.person_add,
                          color: Colors.green,
                        ),
                        controller: nomeController,
                        obscureText: false,
                        validator: Validate().validateNome,
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
                        sulfixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        controller: senhaController,
                        obscureText: _obscureText,
                        validator: Validate().validateSenha,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.loginPage);
                },
                child: Textwidget(
                  cadastro: 'Já é Cadastrado? ',
                  login: 'Fazer Login',
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    SingUpService().singUp(
                      context,
                      emailController.text,
                      senhaController.text,
                    );
                  }
                  nomeController.clear();
                  emailController.clear();
                  senhaController.clear();
                },
                child: ButtonWidget(
                  text: 'Cadastrar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
