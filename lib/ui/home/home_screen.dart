import 'package:basic_flutter/cubit/home_cubit/home_cubit.dart';
import 'package:basic_flutter/cubit/home_cubit/home_state.dart';
import 'package:basic_flutter/mixins/constant/color.dart';
import 'package:basic_flutter/mixins/constant/constant.dart';
import 'package:basic_flutter/mixins/constant/input_style.dart';
import 'package:basic_flutter/mixins/constant/text_style.dart';
import 'package:basic_flutter/mixins/routes.dart';
import 'package:basic_flutter/ui/home/widget/item_empty.dart';
import 'package:basic_flutter/ui/home/widget/item_goods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  final TextEditingController _controller=TextEditingController();

  void showDialogChangeName(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext dialogContext){
        return AlertDialog(
          actions: [
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text("Close",style: kTextAveHev14,)
            ),
            ElevatedButton(
                onPressed: (){
                  BlocProvider.of<HomeCubit>(context).changeName(_controller.text);
                  _controller.clear();
                  Navigator.of(context).pop();
                },
                child: const Text("Apply",style: kTextAveHev14,)
            )
          ],
          title: const Text("Ubah Nama",style: kTextAveHev16,),
          content: Wrap(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text("Nama",style:kTextAveHev14,),
                  const SizedBox(height: kDefaultPadding/4,),
                  TextFormField(
                    controller: _controller,
                    decoration: kInputPrimary.copyWith(
                        hintText: "Masukkan Nama",
                        hintStyle: kTextAveRom12
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      appBar: AppBar(
        title: BlocBuilder<HomeCubit,HomeState>(
          /// Widget yang dibungkus sama BlocBuilder tidak akan di update
          /// jika state  name sekarang sama dengan state name sebelumnya
          buildWhen: (prev,current){
            if(prev.name!=current.name){
              return true;
            }
            return false;
          },
          builder: (context,state) {
            print("Terjadi Perubahan pada state variable name");
            if(state.name.isEmpty){
              return const Text("Daftar Barang",style: kTextAveHev16);
            }
            return Text("Welcome,"+state.name+" !",style: kTextAveHev16,);
          }
        ),
        actions: [
          InkWell(
            onTap: (){
              showDialogChangeName(context);
            },
            child: const Icon(Icons.edit,color: kColorWhite,),
          ),
          const SizedBox(width: kDefaultPadding/2,)
        ],
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, routeAdd);
        },
        child:const Icon(Icons.add),
      ),
      body: BlocBuilder<HomeCubit,HomeState>(
        /// Widget yang dibungkus sama BlocBuilder tidak akan di update
        /// jika state variable list sekarang sama dengan state variable list sebelumnya
          buildWhen: (prev,current){
            if(prev.list!=current.list){
              return true;
            }
            return false;
          },
          builder: (context,state) {
            print("Terjadi Perubahan pada state variable list");
            if(state.list.isEmpty){
              return const ItemEmpty();
            }
            return ListView.separated(
                separatorBuilder: (_,index)=>const Divider(),
                itemCount: state.list.length,
                itemBuilder: (BuildContext context,int index){
                  return ItemGoods(goods: state.list[index],index: index,);
                }
            );
          }
      ),
    );
  }
}

