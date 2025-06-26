class CustomerCadastreViewModel {
  // Valores digitados
  String email = '';
  String senha = '';
  String nome = '';
  String cpf = '';

  String? emailErrorText;
  String? senhaErroText;
  String? nomeErroText;
  String? cpfErroText;

  void onEmailChanged(String value) {
    email = value;
    if (value.isEmpty) {
      emailErrorText = "Email obrigatório";
    } else if (!value.contains("@")) {
      emailErrorText = "E-mail inválido.";
    } else {
      emailErrorText = null;
    }
  }

  void onNomeChanged(String value) {
    nome = value;
    if (value.isEmpty) {
      nomeErroText = "Nome obrigatório";
    } else if (!value.contains(" ")) {
      nomeErroText = "Informe o Sobrenome";
    } else {
      nomeErroText = null;
    }
  }

  void onSenhaChanged(String value) {
    senha = value;
    final regLyricsCase = RegExp(r'^(?=.*[a-z])');
    final regNumber = RegExp(r'^(?=.*[0-9])');
    if (senha.isEmpty) {
      senhaErroText = "Senha obrigatória";
    } else if (!regNumber.hasMatch(value.trim())) {
      senhaErroText = "deve conter numeros.";
    } else if (!regLyricsCase.hasMatch(value.trim())) {
      senhaErroText = "deve conter letra.";
    } else if (senha.length <= 5) {
      senhaErroText = "deve conter 6 caracteres";
    } else {
      senhaErroText = null;
    }
  }

  void onCpfChanged(String value) {
    cpf = value;
    if (cpf.isEmpty) {
      cpfErroText = "CPF obrigatório";
    } else if (cpf.length <= 5) {
      cpfErroText = "CPF inválido";
    } else {
      cpfErroText = null;
    }
  }

  bool didTapConfirmUser() {
    onEmailChanged(email);
    onSenhaChanged(senha);
    onNomeChanged(nome);
    onCpfChanged(cpf);
    return emailErrorText == null &&
        senhaErroText == null &&
        nomeErroText == null &&
        cpfErroText == null;
  }
}
