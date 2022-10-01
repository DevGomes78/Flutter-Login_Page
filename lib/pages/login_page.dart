import 'package:flutter/material.dart';
import 'package:flutter_validation/constants/string_constants/string_constants.dart';
import 'package:flutter_validation/routes/routes.dart';
import 'package:flutter_validation/widgets/button_widget.dart';
import 'package:flutter_validation/widgets/my_custon_clipper_widget.dart';
import 'package:flutter_validation/widgets/text_form_widget.dart';
import 'package:flutter_validation/widgets/text_widget.dart';
import '../controller/validate_fields.dart';
import '../service/login_service.dart';

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
              _custonClipper(),
              const SizedBox(height: 60),
              _emailField(),
              const SizedBox(height: 10),
              _loginField(),
              _forgtPasswordField(context),
              const SizedBox(height: 40),
              btnLogin(context),
              const SizedBox(height: 10),
              textRegister(context),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  textRegister(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          RoutesPage.cadastro,
        );
      },
      child: Textwidget(
        cadastro: StringConstants.notHaveRegistration,
        login: StringConstants.register,
      ),
    );
  }

  btnLogin(BuildContext context) {
    return InkWell(
      onTap: () {
        _doLogin(context);
      },
      child: ButtonWidget(
        text: StringConstants.login,
      ),
    );
  }

  _custonClipper() {
    return ClipPath(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(90),
          ),
          gradient: LinearGradient(
              colors: [(Colors.green), (Colors.black)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        height: 180,
      ),
      clipper: MycustonClipper(),
    );
  }

  _forgtPasswordField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 20),
      alignment: Alignment.centerRight,
      child: InkWell(
        child: const Text(
          StringConstants.forgoLogin,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, RoutesPage.cadastro);
        },
      ),
    );
  }

  _loginField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),
        child: TextFormWidget(
          StringConstants.password,
          StringConstants.registerPassword,
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
            child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          ),
          controller: senhaController,
          obscureText: _obscureText,
          validator: Validate().validateSenha,
        ),
      ),
    );
  }

  _emailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),
        child: TextFormWidget(
          StringConstants.email,
          StringConstants.typeEmail,
          const Icon(
            Icons.email,
            color: Colors.green,
          ),
          controller: emailController,
          obscureText: false,
          validator: Validate().validateEmail,
        ),
      ),
    );
  }

  _doLogin(context) async {
    if (_formKey.currentState!.validate()) {
      LoginService().login(
        context,
        emailController.text,
        senhaController.text,
      );
    }
  }
}
