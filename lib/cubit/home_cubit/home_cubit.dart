import 'package:basic_flutter/cubit/home_cubit/home_state.dart';
import 'package:basic_flutter/mixins/constant/constant.dart';
import 'package:basic_flutter/mixins/constant/input_style.dart';
import 'package:basic_flutter/mixins/constant/text_style.dart';
import 'package:basic_flutter/model/goods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeState(list: const [],name: ""));


   void changeName(String name){
     emit(state.copyWith(name: name));
   }

   void addGoods(Goods goods){
     List<Goods> _listGoods=List.from(state.list);
     _listGoods.add(goods);
     emit(state.copyWith(list: _listGoods));
   }


   void removeData(int index){
     List<Goods> list_goods=List.from(state.list);
     list_goods.removeAt(index);
     emit(state.copyWith(list:list_goods));
   }


   void incrementQty(int index){
     List<Goods> _listGoods=List.from(state.list);
     _listGoods[index]=_listGoods[index].copyWith(
       qty: _listGoods[index].qty+1
     );
     emit(state.copyWith(list: _listGoods));
   }

  void decrementQty(int index){
    List<Goods> _listGoods=List.from(state.list);
    _listGoods[index]=_listGoods[index].copyWith(
        qty: _listGoods[index].qty-1
    );
    emit(state.copyWith(list: _listGoods));
  }


}