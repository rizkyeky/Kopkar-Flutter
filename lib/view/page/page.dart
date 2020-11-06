library page;

// import 'package:animations/animations.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/bloc.dart';
import '../../locator.dart';
import '../../model/model.dart';
import '../../theme.dart';
import '../component/component.dart';

part 'page_main.dart';
part 'page_home.dart';
part 'page_history.dart';
part 'page_login.dart';
part 'page_pinjaman.dart';
part 'page_profile.dart';
part 'page_simpanan.dart';
part 'page_historyoption.dart';
part 'page_detail_pinjaman_berjalan.dart';

enum HistoryType {pembelian, simpanan, shu, ppbo, potongan, pinjaman}

abstract class Page<T extends Bloc> extends StatefulWidget {

  final T _bloc = locator<T>();
  T get blc => _bloc;
  
  Page({
    Key key,
  }) : super(key: key);

  @override
  _PageState<T> createState() => _PageState<T>();

  @protected
  Widget build(BuildContext context);

  @protected
  void init();

  @protected
  void dispose();
}

class _PageState<T extends Bloc> extends State<Page<T>> {
  
  @override
  void initState() {
    if (widget.init != null) {
      widget.init();
      widget.blc.init();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.dispose != null) {
      widget.dispose();
      widget.blc.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}