import 'package:flutter/material.dart';
import 'package:flutter_validation/constants/routes_api.dart';
import 'package:flutter_validation/routes/routes.dart';
import 'package:flutter_validation/sing_up/login_singup.dart';
import 'package:flutter_validation/utils/validate.dart';
import 'package:flutter_validation/widgets/button_widget.dart';
import 'package:flutter_validation/widgets/container_widget.dart';
import 'package:flutter_validation/widgets/text_form_widget.dart';
import 'package:flutter_validation/widgets/text_widget.dart';
import 'cadastro.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  TextEditingController senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ContainerWidget(text: 'Login'),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Container(
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
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Container(
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, right: 20),
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: const Text(
                    'Esqueceu a Senha?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.cadastro);
                  },
                ),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  _doLogin(context);
                },
                child: ButtonWidget(
                  text: 'Login',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RoutesPage.cadastro);
                },
                child: Textwidget(
                  cadastro: 'Nao tem Cadastro?  ',
                  login: 'Cadastrar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin(context) async {
    if (_formKey.currentState!.validate()) {
      LoginService().login(
        context,
        emailController.text,
        senhaController.text,
      );
    }
  }
}
