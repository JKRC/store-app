
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerBloc extends Cubit{

  DrawerBloc() : super(null){
    sinkIndexDrawer.add(0);
  }
  int drawerIndex = 0;
  final StreamController<int> _drawerController = StreamController<int>();

  Stream<int> get outIndexDrawer => _drawerController.stream;
  StreamSink<int> get sinkIndexDrawer => _drawerController.sink;

  void dispose(){
    _drawerController.close();
  }

}