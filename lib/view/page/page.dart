library page;

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/bloc.dart';
import '../../locator.dart';
import '../../model/model.dart';
import '../../theme.dart';
import '../component/component.dart';
import '../../service/service.dart';

part 'page_main.dart';
part 'page_home.dart';
part 'page_history.dart';
part 'page_login.dart';
part 'page_pinjaman.dart';
part 'page_profile.dart';
part 'page_simpanan.dart';

part 'page_history_ppbo.dart';
part 'page_history_simpananw.dart';
part 'page_history_simpanansuk.dart';
part 'page_history_pembelian.dart';
part 'page_history_potongan.dart';

part 'page_detail.dart';
part 'page_form_simpanan.dart';
part 'page_form_pinjaman.dart';
part 'page_simulation.dart';

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
  
  bool hasOffline = false;

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
    return ValueListenableBuilder<ConnectionStatus>(
      valueListenable: locator.get<ConnectionService>().networkStatusNotifier,
      builder: (context, value, child) {
        if (value == ConnectionStatus.offline) {
          Future.delayed(const Duration(seconds: 1)).then((value) => 
            showNetworkFlash(context,
              text: 'OFFLINE',
              color: Colors.red,
            )
          );
          hasOffline = true;
        } else if (hasOffline) {
          Future.delayed(const Duration(seconds: 1)).then((value) => 
             showNetworkFlash(context,
              text: 'ONLINE',
              duration: const Duration(seconds: 2),
              color: Colors.green,
            )
          );
        }
        return child;
      },
      child: widget.build(context),
    );
  }
}