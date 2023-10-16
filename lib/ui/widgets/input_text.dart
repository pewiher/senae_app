import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senae_app/ui/widgets/input_label.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    this.controller,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.labelText = '',
    this.prefixIcon,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.enabled = true,
    this.readOnly = false,
    this.margin = const EdgeInsets.symmetric(vertical: 12),
    this.suffixIcon,
    this.onTap,
    this.textStyle,
    this.title,
    this.filled = false,
    this.obscureText = false,
    this.labelColor,
    this.errorMaxLines,
    this.enabledBorder,
    this.disabledBorder,
  }) : super(key: key);

  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final bool enabled;
  final bool readOnly;
  final EdgeInsetsGeometry margin;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final String? title;
  final bool filled;
  final bool obscureText;
  final Color? labelColor;
  final int? errorMaxLines;
  final TextCapitalization textCapitalization;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;

  @override
  Widget build(BuildContext context) {
    final disableFillColor = Colors.grey[200];

    return Container(
      margin: margin,
      child: Column(
        children: [
          InputLabel(title: title, labelColor: labelColor),
          TextFormField(
            textCapitalization: textCapitalization,
            key: key,
            readOnly: readOnly,
            controller: controller,
            onChanged: onChanged,
            onTap: onTap,
            obscureText: obscureText,
            inputFormatters: inputFormatters,
            enabled: enabled,
            style: textStyle,
            decoration: InputDecoration(
              errorMaxLines: errorMaxLines,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              alignLabelWithHint: false,
              labelStyle: const TextStyle(color: Colors.black54),
              hintStyle: TextStyle(color: Theme.of(context).primaryColor),
              labelText: labelText,
              filled: filled,
              fillColor: enabled
                  ? const Color.fromARGB(255, 3, 7, 19)
                  : disableFillColor,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: enabledBorder,
              disabledBorder: disabledBorder,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
            validator: validator,
            cursorColor: Theme.of(context).primaryColor,
            keyboardType: keyboardType,
          ),
        ],
      ),
    );
  }
}
