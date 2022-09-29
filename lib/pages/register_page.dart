import 'package:flutter/material.dart';
import 'package:flutter_validation/constants/string_constants/string_constants.dart';
import 'package:flutter_validation/widgets/button_widget.dart';
import 'package:flutter_validation/widgets/my_custon_clipper_widget.dart';
import 'package:flutter_validation/widgets/text_form_widget.dart';
import 'package:flutter_validation/widgets/text_widget.dart';
import '../constants/string_constants/error_constants.dart';
import '../controller/validate_fields.dart';
import '../routes/routes.dart';
import '../service/register_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _mailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _custonClipper(),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _nameField(),
                    const SizedBox(height: 10),
                    _lastNameField(),
                    const SizedBox(height: 10),
                    _mailField(),
                    const SizedBox(height: 10),
                    _passwordField(),
                    const SizedBox(height: 10),
                    _confirmPasswordField(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _textLogin(context),
              const SizedBox(height: 30),
              _registerLogin(context),
            ],
          ),
        ),
      ),
    );
  }

  _registerLogin(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_passwordController.text == _confirmPasswordController.text) {
          _register();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(
              content: Text(ErrorConstants.senhaNaoConfere),
            ),
          );
        }
      },
      child: ButtonWidget(
        text: StringConstants.register,
      ),
    );
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      RegisterLoginService().singUp(
        context,
        _nameController.text,
        _lastNameController.text,
        _mailController.text,
        _passwordController.text,
      );
    }
    _nameController.clear();
    _lastNameController.clear();
    _mailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }


_textLogin(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, RoutesPage.loginPage);
    },
    child: Textwidget(
      cadastro: StringConstants.registerLogin,
      login: StringConstants.loginName,
    ),
  );
}

_nameField() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.grey[200],
    ),
    child: TextFormWidget(
      StringConstants.name,
      StringConstants.registerName,
      const Icon(
        Icons.person_add,
        color: Colors.green,
      ),
      controller: _nameController,
      obscureText: false,
      validator: Validate().validateNome,
    ),
  );
}

_lastNameField() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.grey[200],
    ),
    child: TextFormWidget(
      StringConstants.lastName,
      StringConstants.registerLastName,
      const Icon(
        Icons.person_add,
        color: Colors.green,
      ),
      controller: _lastNameController,
      obscureText: false,
      validator: Validate().validateNome,
    ),
  );
}

_mailField() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.grey[200],
    ),
    child: TextFormWidget(
      StringConstants.email,
      StringConstants.digiteEmail,
      const Icon(
        Icons.email,
        color: Colors.green,
      ),
      controller: _mailController,
      obscureText: false,
      validator: Validate().validateEmail,
    ),
  );
}

_passwordField() {
  return Container(
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
        child: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
        ),
      ),
      controller: _passwordController,
      obscureText: _obscureText,
      validator: Validate().validateSenha,
    ),
  );
}

_confirmPasswordField() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.grey[200],
    ),
    child: TextFormWidget(
      StringConstants.confirmPassword,
      StringConstants.confirmPassword,
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
        child: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
        ),
      ),
      controller: _confirmPasswordController,
      obscureText: _obscureText,
      validator: Validate().validateSenha,
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
}}
