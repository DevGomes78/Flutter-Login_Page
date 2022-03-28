import 'package:flutter/material.dart';
import 'package:flutter_validation/sing_up/login_singup.dart';
import 'package:flutter_validation/sing_up/sing_up_service.dart';
import 'package:flutter_validation/utils/validate.dart';
import 'package:flutter_validation/views/bem_vindo.dart';
import 'package:flutter_validation/widgets/button_widget.dart';
import 'package:flutter_validation/widgets/container_widget.dart';
import 'package:flutter_validation/widgets/text_form_widget.dart';
import 'cadastro.dart';

class Login extends StatelessWidget {
  TextEditingController emailController =
      TextEditingController(text: 'amilson@gmail.com');
  TextEditingController senhaController = TextEditingController(text: '123456');
  final _formKey = GlobalKey<FormState>();
  bool? ok;

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
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    controller: senhaController,
                    obscureText: true,
                    validator: Validate().validateSenha,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, right: 20),
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text('Esqueceu a Senha?'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cadastro(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  _doLogin();
                },
                child: ButtonWidget(
                  text: 'Login',
                ),
              ),
              const SizedBox(height: 10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Nao tem Cadastro?'),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cadastro(),
                          ),
                        );
                      },
                      child: const Text(
                        'Cadastrar Agora',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _doLogin()async{
    if (_formKey.currentState!.validate()) {
      LoginService().login(
           emailController.text,
          senhaController.text);
    }else{
      print('invalido');
    }
  }
}
