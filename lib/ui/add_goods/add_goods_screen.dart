import 'package:basic_flutter/cubit/home_cubit/home_cubit.dart';
import 'package:basic_flutter/mixins/constant/color.dart';
import 'package:basic_flutter/mixins/constant/constant.dart';
import 'package:basic_flutter/mixins/constant/input_style.dart';
import 'package:basic_flutter/mixins/constant/text_style.dart';
import 'package:basic_flutter/model/goods.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddGoodsScreen extends StatelessWidget {
  AddGoodsScreen({Key? key}) : super(key: key);
  final _formKey=GlobalKey<FormState>();
  String name="";
  String qty="";
  String price="";

  void addData(BuildContext context){
    if(_formKey.currentState!.validate()){
      int priceInt=int.parse(price.replaceAll(".",""));
      int qtyInt=int.parse(qty.replaceAll(".",""));
      Goods goods=Goods(
          name: name,
          price: priceInt,
          qty: qtyInt
      );
      BlocProvider.of<HomeCubit>(context).addGoods(goods);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Barang",style: kTextAveHev16,),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding,vertical: kDefaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              const Text("Nama Barang",style: kTextAveHev14,),
              const SizedBox(height: kDefaultPadding/4,),
              TextFormField(
                onChanged: (String? value){
                  name=value!;
                },
                validator: (String? value){
                  if(value!.isEmpty){
                    return "Nama Barang harus diisi";
                  }
                  return null;
                },
                decoration: kInputPrimary.copyWith(
                  hintStyle: kTextAveRom12,
                  hintText: "Masukkan Nama Barang"
                ),
              ),
              const SizedBox(height: kDefaultPadding,),
              const Text("Harga Barang",style: kTextAveHev14,),
              const SizedBox(height: kDefaultPadding/4,),
              TextFormField(
                onChanged: (String? value){
                  price=value!;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter(
                    locale: 'id',
                    decimalDigits: 0,
                    symbol: '',
                  )
                ],
                validator: (String? value){
                  if(value!.isEmpty){
                    return "Harga Barang harus diisi";
                  }
                  return null;
                },
                decoration: kInputPrimary.copyWith(
                    hintStyle: kTextAveRom12,
                    hintText: "Masukkan Harga Barang (Rp.)"
                ),
              ),
              const SizedBox(height: kDefaultPadding,),
              const Text("Quantity",style: kTextAveHev14,),
              const SizedBox(height: kDefaultPadding/4,),
              TextFormField(
                onChanged: (String? value){
                  qty=value!;
                },
                validator: (String? value){
                  if(value!.isEmpty){
                    return "Qty harus diisi";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter(
                    locale: 'id',
                    decimalDigits: 0,
                    symbol: '',
                  )
                ],
                decoration: kInputPrimary.copyWith(
                    hintStyle: kTextAveRom12,
                    hintText: "Masukkan Quantity"
                ),
              ),
              const SizedBox(height: kDefaultPadding,),
              ElevatedButton(
                 style: ButtonStyle(
                   shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(8))
                   )),
                   backgroundColor: MaterialStateProperty.all(kColorPrimary)
                 ),
                  onPressed: (){
                    addData(context);
                  },
                  child: Text("Tambah",style: kTextAveHev16.copyWith(
                    color: kColorWhite
                  ),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
