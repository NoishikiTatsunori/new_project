import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/logic.dart';
import 'package:new_project/provider.dart';

class ViewModel{
  Logic _logic = Logic();
  late WidgetRef _ref;

  void setRef(WidgetRef ref){
    this._ref = ref;
  }

  get count => _ref.watch(countDataProvider).count.toString();
  get countUP => _ref.watch(countDataProvider.select((value) => value.countUp)).toString();
  get countDown => _ref.watch(countDataProvider.select((value) => value.countDown)).toString();

  void onIncrease(){
    _logic.increace();
    _ref.watch(countDataProvider) = _logic.countData;
  }

  void onDecrease(){
    _logic.decreace();
    _ref.watch(countDataProvider) = _logic.countData;
  }

  void onReset(){
    _logic.reset();
    _ref.watch(countDataProvider) = _logic.countData;
  }
}