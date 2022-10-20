import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatefulWidget {
  final _product;
  Cart(this._product);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        title: const Text("You Bought"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                  width: 1.sw - 10.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: ScreenUtil().screenWidth / 100 * 30,
                        height: 100.h,
                        child: Image.network(
                            "http://python.tech-slave.com/static/uploads/${widget._product['prod_img']}"),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget._product['prod_name'],
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.sp),
                          ),
                          Text(
                            "Price: ৳ ${widget._product['prod_price']}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromARGB(255, 21, 218, 3),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 1.sw / 4, top: 1.sh / 4),
                child: Text(
                  "Your TrxID:S1${Random().nextInt(50)}5${Random().nextInt(50)}6E",
                  style: TextStyle(color: Colors.yellow, fontSize: 20.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
