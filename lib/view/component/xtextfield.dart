part of 'component.dart';

class XTextField extends StatelessWidget {

  final String text;
  final TextEditingController controller;
  final bool obscureText;
  final bool readOnly;
  final Widget suffixIcon;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final TextInputType keyboardType;

  const XTextField({ 
  Key key,
  this.text,
  this.controller,
  this.obscureText,
  this.suffixIcon,
  this.onChanged,
  this.onSubmitted,
  this.readOnly,
  this.keyboardType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: onChanged ?? (value) {},
      onSubmitted: onSubmitted ?? (value) {},
      obscureText: obscureText ?? false,
      controller: controller,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        labelText: text,
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.never,
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