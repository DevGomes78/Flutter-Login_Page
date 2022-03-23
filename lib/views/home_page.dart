import 'package:flutter/material.dart';
import 'package:flutter_validation/utils/validate.dart';
import 'package:flutter_validation/views/view_validation.dart';
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
            Container(
              height: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                ),
                color: Colors.green,
                gradient: LinearGradient(
                    colors: [(Colors.green), (Colors.black)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset('images/frog.png'),
                      height: 150,
                      width: 180,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 20),
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
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
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  alignment: Alignment.center,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green,
                    gradient: const LinearGradient(
                        colors: [(Colors.green), (Colors.black)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nao tem Cadastro?'),
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
            )
          ],
        ),
      ),
    );
  }
}
