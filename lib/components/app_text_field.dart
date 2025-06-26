import "package:flutter/material.dart";
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppTextField extends StatelessWidget {
  final Icon icone;
  final String msng;
  final TextInputType? tipoDeEntrada;
  final MaskTextInputFormatter? fieldFormater;
  final void Function(String)? onChanged;
  final String? errorText;

  const AppTextField({
    super.key,
    required this.icone,
    required this.msng,
    this.tipoDeEntrada,
    this.fieldFormater,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: tipoDeEntrada,
      onChanged: onChanged,
      inputFormatters: fieldFormater != null ? [fieldFormater!] : null,
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: icone,
        hintText: msng,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
