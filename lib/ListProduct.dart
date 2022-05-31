import 'dart:convert';
import 'dart:developer';

import 'package:alog/back/Product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'back/apiConnection.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  getProducts() async {
    log('hi1');
    setState(() {
      loading = false;
      allProducts.Products.clear();
    });
    List response = await getResponse("/products");

    log(response.toString());
    for (Map<String, dynamic> theproduct in response) {
      allProducts.Products.add(
        Product(
            color: theproduct['couleur'],
            price: theproduct['prix'],
            id: '',
            Weight: theproduct['poix'],
            name: theproduct['nom'],
            Description: theproduct['Description'],
            user: '1',
            category: theproduct['categorie'],
            nbr: theproduct['nombre_exemplaire']),
      );
    }
    log('hi2');
    setState(() {
      loading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Container(
          child: Text(
            "Products",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Mukta',
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: allProducts.Products.length,
          itemBuilder: (BuildContext context, int index) {
            final item = allProducts.Products[index];
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    // todo whene the user clicks on an item
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/iphone13.jpg",
                        height: 120,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Mukta',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Color: " + item.color,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Mukta',
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Description: " + item.Description,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Mukta',
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Weight: " + item.Weight,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Mukta',
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            item.price,
                            style: TextStyle(
                              color: Color(0xffF7991D),
                              fontFamily: 'Mukta',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    ));
  }
}
