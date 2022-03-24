import 'package:flutter/material.dart';
import 'package:flutter_validation/utils/validate.dart';
import 'package:flutter_validation/views/view_validation.dart';
import 'package:flutter_validation/widgets/button_widget.dart';
import 'package:flutter_validation/widgets/container_widget.dart';
import 'package:flutter_validation/widgets/text_form_widget.dart';

class HomePage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContainerWidget(text: 'Login'),
            const SizedBox(height: 50),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.only(left: 3, right: 3),
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
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.only(left: 3, right: 3),
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
            Container(
              margin: const EdgeInsets.only(top: 10, right: 20),
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Text('Esqueceu a Senha?'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Validation(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            ButtonWidget(text: 'Login',),
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
                          builder: (context) => Validation(),
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
    );
  }
}

