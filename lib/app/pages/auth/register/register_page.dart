import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.textStyles.textTitle,
                ),
                Text(
                  'Preencha os campos para criar o cadastro.',
                  style: context.textStyles.textMedium.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                  controller: _nameEC,
                  validator: Validatorless.required('Nome Obrigatório'),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  controller: _emailEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('E-mail obrigatório'),
                    Validatorless.email('E-mail inválido'),
                  ]),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Senha'),
                  controller: _passwordEC,
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha obrigatória'),
                    Validatorless.min(
                        6, 'Senha deve conter pelo menos caracteres'),
                  ]),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Confirma senha'),
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha obrigatória'),
                    Validatorless.compare(
                        _passwordEC, 'As senhas devem coincidir'),
                  ]),
                ),
                const SizedBox(height: 30),
                Center(
                  child: DeliveryButton(
                    width: double.infinity,
                    label: 'CADASTRAR',
                    onPressed: () {
                      final valid = _formKey.currentState?.validate() ?? false;
                      if (valid) {}
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
