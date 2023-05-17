import 'package:bloctest/app/modules/login/bloc/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = LoginBloc();
    final _formKey = GlobalKey<FormState>();
    final _emailEC = TextEditingController();
    final _senhaEC = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailEC,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _senhaEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            final valide = _formKey.currentState!.validate();
                            if (valide) {
                              bloc.add(Loading(
                                  email: _emailEC.text, senha: _senhaEC.text));
                            }
                          },
                          child: const Text('Entrar')),
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return Text(state.email);
                        }

                        return const CircularProgressIndicator();
                      },
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        const Text('Não tem conta?'),
                        TextButton(
                            onPressed: () {}, child: const Text('Cadastre-se')),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
