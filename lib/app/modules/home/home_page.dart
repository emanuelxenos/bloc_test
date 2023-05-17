import 'package:bloctest/app/modules/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    final formKey = GlobalKey<FormState>();
    final textEC = TextEditingController();
    final textTooEC = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is HomeInitial) {
                      return const CircularProgressIndicator();
                    } else if (state is TextWelcomeSuccess) {
                      return Column(
                        children: [
                          Text(state.text),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(state.textToo),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: textEC,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: textTooEC,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    formKey.currentState!.validate();
                    bloc.add(TextWelcomeUpdate(
                        text: textEC.text, textToo: textTooEC.text));
                    textEC.text = '';
                  },
                  child: const Text("Clique aqui"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
