import 'package:new_project/count_data.dart';

class Logic{
  CountData _countData = CountData(count: 0, countUp: 0, countDown: 0);

  get countData => _countData;

  void increace(){
    _countData = _countData.copyWith(
      count: _countData.count +1,
      countUp: _countData.countUp +1,
    );
  }

  void decreace(){
    _countData = _countData.copyWith(
      count: _countData.count -1,
      countDown: _countData.countDown +1,
    );
  }

  void reset(){
    _countData = CountData(count: 0, countUp: 0, countDown: 0);
  }
}