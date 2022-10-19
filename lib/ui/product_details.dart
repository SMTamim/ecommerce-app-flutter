import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  final _product;
  const ProductDetails(this._product);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // void _di() {
  //   print(widget._product);
  // }

  // @override
  // void initState() {
  //   _di();
  //   super.initState();
  // }

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
        title: const Text("Basic E-commerce"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white54,
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(bottom: 15.h, top: 10.h),
              padding: EdgeInsets.only(left: 10.w),
              width: 1.sw,
              child: Text(
                widget._product['prod_name'],
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 5.w, bottom: 30.w),
              height: 300.h,
              width: 1.sw,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FittedBox(
                    child: Image.network(
                      widget._product['prod_img'],
                      fit: BoxFit.fitWidth,
                    ),
                    fit: BoxFit.fill,
                  )),
            ),
            Container(
              width: 1.sw - 40.w,
              child: Row(
                children: [
                  Text(
                    "Price: ৳ ${widget._product['prod_price']}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromARGB(255, 21, 218, 3),
                        fontSize: 20.sp),
                  ),
                  SizedBox(
                    width: (1.sw - 100.w) / 2.w,
                  ),
                  Text(
                    "Stock: ${widget._product['prod_stock']}",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.green, fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.w),
              width: 1.sw,
              child: Text("Color: ${widget._product['prod_color']}"),
            ),
            Container(
              width: 1.sw,
              margin: EdgeInsets.only(top: 20.w),
              padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
              child: Text(
                "About ${widget._product['prod_name']}",
                style: TextStyle(color: Colors.orange, fontSize: 18.sp),
              ),
            ),
            Container(
              width: 1.sw,
              padding: EdgeInsets.only(
                  left: 10.w, top: 10.h, bottom: 10.h, right: 8.w),
              child: Text(
                "${widget._product['prod_description']}",
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.w),
              width: 1.sw,
              child: Text(
                "Manufactured By: ${widget._product['prod_manufacturer']}",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.orange, fontSize: 16.sp),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 20.w),
                width: 1.sw,
                height: 56.h,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent, elevation: 3),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
