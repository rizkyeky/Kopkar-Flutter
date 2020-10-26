part of 'component.dart';

class XTextField extends StatelessWidget {

  final String text;
  final TextEditingController controller;
  final bool obscureText;
  final Widget suffixIcon;
  final void Function(String) onChanged;
  final TextInputType keyboardType;

  const XTextField({ 
  Key key,
  this.text,
  this.controller,
  this.obscureText,
  this.suffixIcon,
  this.onChanged,
  this.keyboardType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: onChanged ?? (value) {},
      obscureText: obscureText ?? false,
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: primaryColor,
            width: 3
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: borderColor,
            width: 3
          )
        ),
      ),
    );
  }
}