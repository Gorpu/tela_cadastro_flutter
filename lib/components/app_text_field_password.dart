import "package:flutter/material.dart";

class AppTextFieldPassword extends StatefulWidget {
  final Icon iconeInicial;
  final String nomeDoCampo;
  final Icon iconeFinal;
  final VoidCallback? onPressed;
  final TextEditingController? controlador;
  final Function(String)? onChanged;
  final String? erroText;
  const AppTextFieldPassword({
    super.key,
    required this.iconeInicial,
    required this.nomeDoCampo,
    this.iconeFinal = const Icon(null),
    this.onPressed,
    this.controlador,
    this.onChanged,
    this.erroText,
  });

  @override
  State<AppTextFieldPassword> createState() => _AppTextFieldPasswordState();
}

class _AppTextFieldPasswordState extends State<AppTextFieldPassword> {
  bool _visivel = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controlador,
      obscureText: !_visivel,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        errorText: widget.erroText,
        prefixIcon: widget.iconeInicial,
        hintText: widget.nomeDoCampo,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _visivel = !_visivel;
            });
          },
          icon: Icon(_visivel ? Icons.visibility_off : Icons.visibility),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
