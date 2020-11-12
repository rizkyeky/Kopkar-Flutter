part of 'component.dart';

class XBox extends StatelessWidget {

  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const XBox({Key key, this.child, this.padding, this.margin}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.fromLTRB(24, 24, 24, 0),
      padding: padding ?? const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.12)),
        borderRadius: BorderRadius.circular(12)
      ),
      child: child
    );
  }
}