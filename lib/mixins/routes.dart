import 'package:basic_flutter/ui/add_goods/add_goods_screen.dart';
import 'package:basic_flutter/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

const routeHome = "/home";
const routeAdd = "/add";


var routes = {
    routeHome: (context) => HomeScreen(),
    routeAdd: (context) => AddGoodsScreen(),
};
