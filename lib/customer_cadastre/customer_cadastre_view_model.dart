import 'package:flutter/material.dart';

class CustomerCadastreViewModel {
  final onEmailChanged = TextEditingController();
  final onSenhaChanged = TextEditingController();
  final onNomeChanged = TextEditingController();
  final celularController = TextEditingController();
  final onCPFChanged = TextEditingController();
  String? erroEmail;
  String? erroSenha;
  String? erroNome;
  String? erroCPF;

  void emailErrorText(String value) {
    if (value.isEmpty) {
      erroEmail = "Email obrigatório";
    } else if (value.contains("@")) {
      erroEmail = "E-mail inválido.";
    } else {
      erroEmail = null;
    }
  }

  void nomeErrorText(String value) {
    if (value.isEmpty) {
      erroNome = "Nome obrigatório";
    } else if (!value.contains(" ")) {
      erroNome = "Informe o Sobrenome";
    } else {
      erroNome = null;
    }
  }

  void senhaErrorText(String value) {
    final reglyricsCase = RegExp(r'^(?=.*[a-z])');
    final regNumber = RegExp(r'^(?=.*[0-9])');
    if (value.isEmpty) {
      erroSenha = "Senha obrigatória";
    } else if (!regNumber.hasMatch(value.trim())) {
      erroSenha = "deve conter numeros.";
    } else if (!reglyricsCase.hasMatch(value.trim())) {
      erroSenha = "deve conter letra.";
    } else if (value.length <= 5) {
      erroSenha = "deve conter 6 caracteres";
    } else {
      erroSenha = null;
    }
  }

  void cpfErrorText(String value) {
    if (value.isEmpty) {
      erroCPF = "CPF obrigatório";
    } else if (value.length != 14) {
      erroCPF = "CPF inválido";
    } else {
      erroCPF = null;
    }
  }

  bool didTapConfirmUser() {
    emailErrorText(onEmailChanged.text);
    senhaErrorText(onSenhaChanged.text);
    nomeErrorText(onNomeChanged.text);
    cpfErrorText(onCPFChanged.text);
    return erroEmail == null &&
        erroSenha == null &&
        erroNome == null &&
        erroCPF == null;
  }
}
