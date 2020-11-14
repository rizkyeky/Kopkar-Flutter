part of 'component.dart';

class XTextField extends StatelessWidget {

  final String text;
  final bool obscureText;
  final Widget suffixIcon;
  final void Function(String) onSubmitted;
  final void Function(String) onChanged;
  final TextInputType keyboardType;
  final EdgeInsets contentPadding;
  final String hintText;

  const XTextField({ 
  Key key,
  this.text,
  this.obscureText,
  this.suffixIcon,
  this.onSubmitted,
  this.onChanged,
  this.keyboardType,
  this.contentPadding,
  this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType ?? TextInputType.text,
      onSubmitted: onSubmitted ?? (value) {},
      obscureText: obscureText ?? false,
      onChanged: onChanged ?? (value) {},
      decoration: InputDecoration(
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(
          horizontal: 12
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey
        ),
        labelText: text,
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: primaryColor,
            width: 3
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: borderColor,
          )
        ),
      ),
    );
  }
}