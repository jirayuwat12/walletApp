import 'dart:core';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class DataListPageSummary{
  var _info = BehaviorSubject<List<DataStruct>>.seeded([]);
  Stream get stream => _info.stream;
  List<DataStruct> get current => _info.value;

  void add(DataStruct dtst){
    List<DataStruct> temp = _info.value;
    temp.insert(0,dtst);
    _info.add(temp);
  }
  void delete(DataStruct target){
    List<DataStruct> temp = current;
    temp.remove(target);
    _info.add(temp);
  }

  clear()=> _info.add([]);
}
class DataStruct{
  Padding icon;
  Text category;
  String str_category;
  double value;
  Text discribe;
  Text date;
  Text type;

  DataStruct(String cate,double value,String desc,String date,String type){
    this.icon = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(Icons.money_rounded,size: 50,),
    );
    this.str_category = cate;
    this.category = Text(cate,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
    this.value = value;
    this.discribe = Text('(' +desc+')',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold
      ),
    );
    this.date = Text(date);
    this.type = Text(type);
  }
}

DataListPageSummary dataListPageSummaryService = DataListPageSummary();