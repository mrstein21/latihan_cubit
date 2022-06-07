import 'package:basic_flutter/model/goods.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeState extends Equatable{
  List<Goods> list=[];
  String name="";
  HomeState({
      required this.list,
      required this.name
   });

  HomeState copyWith({List<Goods>? list,String? name}){
    return HomeState(
        list: list ?? this.list,
        name:  name ?? this.name
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [list,name];

}