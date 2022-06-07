import 'package:basic_flutter/mixins/constant/color.dart';
import 'package:basic_flutter/mixins/constant/constant.dart';
import 'package:basic_flutter/mixins/constant/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemEmpty extends StatelessWidget {
  const ItemEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const Icon(Icons.list_alt,color: kColorMuted,size: 50,),
            const SizedBox(height: kDefaultPadding/2,),
            Text("Belum ada daftar Barang",style: kTextAveHev14.copyWith(
              color: kColorMuted
            ),)
          ],
        ),
      ),
    );
  }
}
