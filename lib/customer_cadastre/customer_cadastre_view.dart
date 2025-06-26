import 'package:cadastrowind/components/app_button.dart';
import 'package:cadastrowind/components/app_text_field.dart';
import 'package:cadastrowind/customer_cadastre/customer_cadastre_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../components/app_text_field_password.dart';

class CustomerCadastreView extends StatefulWidget {
  const CustomerCadastreView({super.key});

  @override
  State<CustomerCadastreView> createState() => _CustomerCadastreViewState();
}

class _CustomerCadastreViewState extends State<CustomerCadastreView> {
  final viewModel = CustomerCadastreViewModel();

  Widget retronoDialog(BuildContext context) {
    return AlertDialog(content: Text("Cadastrado com sucesso"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          color: Colors.green,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 300,
                color: Colors.green,
                child: Center(
                  child: Text(
                    "Cadastro",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
              Container(
                width: 400,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 8.0),
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppTextField(
                        icone: Icon(Icons.mail),
                        errorText: viewModel.emailErrorText,
                        onChanged: (value) {
                          viewModel.onEmailChanged(value);
                        },
                        msng: "Email",
                      ),

                      AppTextFieldPassword(
                        iconeInicial: Icon(Icons.lock),
                        erroText: viewModel.senhaErroText,
                        onChanged: (value) {
                          viewModel.onSenhaChanged(value);
                        },
                        nomeDoCampo: "Senha",
                      ),

                      AppTextField(
                        errorText: viewModel.nomeErroText,
                        onChanged: (value) {
                          viewModel.onNomeChanged(value);
                        },
                        icone: Icon(Icons.account_circle_sharp),
                        msng: "Nome",
                      ),

                      AppTextField(
                        msng: "Celular",
                        fieldFormater: MaskTextInputFormatter(
                          mask: '(##) ####-####',
                          filter: {"#": RegExp(r'[0-9]')},
                        ),
                        tipoDeEntrada: TextInputType.number,
                        icone: Icon(Icons.phone),
                      ),

                      AppTextField(
                        icone: Icon(Icons.insert_drive_file),
                        errorText: viewModel.cpfErroText,
                        onChanged: (value) => viewModel.onCpfChanged(value),
                        fieldFormater: MaskTextInputFormatter(
                          mask: "###.###.###-##",
                          filter: {"#": RegExp(r"[0-9]")},
                        ),
                        msng: "CPF",
                      ),

                      AppButton(
                        textButton: "Cadastrar usuário",
                        colorButton: Colors.green,
                        funcao: () {
                          setState(() {});
                          if (viewModel.didTapConfirmUser()) {
                            showDialog(
                              context: context,
                              builder: retronoDialog,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
