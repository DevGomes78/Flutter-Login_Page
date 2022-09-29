import 'package:flutter/material.dart';
import 'package:flutter_validation/constants/string_constants/string_constants.dart';
import 'package:flutter_validation/widgets/button_widget.dart';
import 'package:flutter_validation/widgets/my_custon_clipper_widget.dart';
import 'package:flutter_validation/widgets/text_form_widget.dart';
import 'package:flutter_validation/widgets/text_widget.dart';
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
              _CustonClipper(),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _areaName(),
                    const SizedBox(height: 10),
                    _areaLastName(),
                    const SizedBox(height: 10),
                    _areaMail(),
                    const SizedBox(height: 10),
                    _areaPassword(),
                    const SizedBox(height: 10),
                    _areaConfirmPassword(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _textLogin(context),
              const SizedBox(height: 30),
              _btnRegisterLogin(context),
            ],
          ),
        ),
      ),
    );
  }

  _btnRegisterLogin(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          RegisterLoginService().singUp(
            context,
            _nameController.text,
            _mailController.text,
            _passwordController.text,
          );
        }
        _nameController.clear();
        _mailController.clear();
        _passwordController.clear();
      },
      child: ButtonWidget(
        text: StringConstants.MountAreaRegister,
      ),
    );
  }

  _textLogin(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesPage.loginPage);
      },
      child: Textwidget(
        cadastro: StringConstants.MountAreaRegisterLogin,
        login: StringConstants.MountAreaLoginName,
      ),
    );
  }

  _areaName() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      child: TextFormWidget(
        StringConstants.MountAreaName,
        StringConstants.MountAreaRegisterName,
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

  _areaLastName() {
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

  _areaMail() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      child: TextFormWidget(
        StringConstants.MountAreaEmail,
        StringConstants.MountAreaDigiteEmail,
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

  _areaPassword() {
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

  _areaConfirmPassword() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      child: TextFormWidget(
        StringConstants.password,
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

  _CustonClipper() {
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
}
