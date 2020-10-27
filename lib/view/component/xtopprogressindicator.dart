part of 'component.dart';


class XTopLinearProgressIndicator extends StatelessWidget
    implements PreferredSizeWidget {

  final Color backgroundColor;
  final Color valueColor;
  final ValueNotifier<bool> notifier;
  
  @override
  Size get preferredSize => const Size.fromHeight(6);
  
  const XTopLinearProgressIndicator({
    Key key,
    this.backgroundColor,
    this.valueColor,
    this.notifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder<bool>(
        valueListenable: notifier,
        builder: (context, value, child) => value ? LinearProgressIndicator(
          backgroundColor: backgroundColor ?? Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(valueColor ?? primaryColor),
        )
        : const SizedBox(height: 6,)
      ),
    );
  }
}