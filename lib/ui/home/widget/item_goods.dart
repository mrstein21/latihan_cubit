import 'package:basic_flutter/cubit/home_cubit/home_cubit.dart';
import 'package:basic_flutter/mixins/constant/color.dart';
import 'package:basic_flutter/mixins/constant/constant.dart';
import 'package:basic_flutter/mixins/constant/text_style.dart';
import 'package:basic_flutter/model/goods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemGoods extends StatelessWidget {
  const ItemGoods({Key? key, required this.goods, required this.index}) : super(key: key);
  final Goods goods;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(goods.name,style: kTextAveHev14,)),
              const SizedBox(width: kDefaultPadding/5,),
              InkWell(
                onTap: (){
                  BlocProvider.of<HomeCubit>(context).removeData(index);
                },
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding/4),
                  decoration: const BoxDecoration(
                      color: kColorRed,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: const Icon(Icons.delete_forever_outlined,color: kColorWhite,size: 15,),
                ),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding/4,),
          Text(goods.formattedPrice,style: kTextAveRom12.copyWith(
            color: kColorMuted
          ),),
          const SizedBox(height: kDefaultPadding/4,),
          Text("Quantity: ${goods.qty}",style: kTextAveRom12.copyWith(
              color: kColorMuted
          ),),
          const SizedBox(height: kDefaultPadding/4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Total : ${goods.formattedTotal}",style: kTextAveHev14.copyWith(
                  fontSize: 12,
                  color: kColorDark
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      if(goods.qty>0){
                        BlocProvider.of<HomeCubit>(context).decrementQty(index);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(kDefaultPadding/4),
                      decoration: const BoxDecoration(
                        color: kColorPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: const Icon(Icons.remove,color: kColorWhite,size: 15,),
                    ),
                  ),
                  const SizedBox(width: kDefaultPadding/2,),
                  InkWell(
                    onTap: (){
                      BlocProvider.of<HomeCubit>(context).incrementQty(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(kDefaultPadding/4),
                      decoration: const BoxDecoration(
                          color: kColorPrimary,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: const Icon(Icons.add,color: kColorWhite,size: 15,),
                    ),
                  ),

                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
