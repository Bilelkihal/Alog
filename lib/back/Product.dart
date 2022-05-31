import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../back/apiConnection.dart';

class Product {
  final String id;
  final String user;
  final String name;
  final String category;
  final String color;
  final String Weight;
  final String price;
  final String nbr;
  final String Description;

  Product(
      {required this.id,
      required this.user,
      required this.name,
      required this.category,
      required this.color,
      required this.Weight,
      required this.price,
      required this.nbr,
      required this.Description});
}

var response;
var loading = false;

ProductsList allProducts = ProductsList(Products: [
  Product(
      color: 'black',
      price: '180,000 DA',
      id: '1',
      Weight: '250g',
      name: 'Iphone 13',
      Description: 'Iphone 13',
      user: '1',
      category: 'Phones',
      nbr: '2'),
  Product(
      color: 'black',
      price: '180,000 DA',
      id: '1',
      Weight: '250g',
      name: 'Iphone 13',
      Description: 'Iphone 13',
      user: '1',
      category: 'Phones',
      nbr: '2'),
  Product(
      color: 'black',
      price: '180,000 DA',
      id: '1',
      Weight: '250g',
      name: 'Iphone 13',
      Description: 'Iphone 13',
      user: '1',
      category: 'Phones',
      nbr: '2'),
]);

class ProductsList {
  List<Product> Products;

  ProductsList({required this.Products});
}
