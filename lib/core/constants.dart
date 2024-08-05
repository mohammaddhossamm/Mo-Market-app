import 'package:e_commerce_app/features/cart/data/models/cart_model/cart_model.dart';
import 'package:e_commerce_app/features/cart/presentation/view/cart_view.dart';
import 'package:e_commerce_app/features/home/data/models/home_model/home_model.dart';
import 'package:e_commerce_app/features/home/presentation/view/home_view.dart';
import 'package:e_commerce_app/features/settings/presentation/view/settings_view.dart';
import 'package:e_commerce_app/features/wishlist/data/model/wishlist_model/wishlist_model.dart';
import 'package:e_commerce_app/features/wishlist/presentation/view/wishlist_view.dart';
import 'package:flutter/material.dart';

const List<Widget> screens = [
  HomeView(),
  CartView(),
  WishlistView(),
  SettingsView()
];

const String kToken = 'token';
const String kOnBording = 'onbording';
const String kLanguage = 'language';

var kSignUpKey= GlobalKey<FormState>();
var searchKey= GlobalKey<FormState>();
var kProfileKey= GlobalKey<FormState>();

HomeModel? kHomeModel;
Map<int, bool> kWishListMap = {};
Map<int, bool> kCartMap = {};
WishlistModel? kWishListModel;
CartModel? kCartModel;
Map<int, int> kAmountMap = {};
