import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String textButton;
  final Color colorButton;
  final VoidCallback? funcao;
  const AppButton({
    super.key,
    required this.textButton,
    required this.colorButton,
    required this.funcao,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.funcao,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: widget.colorButton,
        minimumSize: Size(400, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(widget.textButton),
    );
  }
}
