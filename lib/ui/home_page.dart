import 'dart:convert';

import 'package:basic_ecommerce/ui/product_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  fetchCarouserImages() async {
    print("Hello WOrld");
  }

  var _dotPosition = 0;
  final List<dynamic> _carouselImages = [
    "https://cdn.pixabay.com/photo/2022/03/31/01/05/bird-7102006_960_720.jpg",
    "https://cdn.pixabay.com/photo/2012/06/19/10/32/owl-50267_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/02/07/16/47/kingfisher-2046453_960_720.jpg",
    "https://cdn.pixabay.com/photo/2015/11/16/16/28/bird-1045954_960_720.jpg"
  ];

  var _products;
  Future getData() async {
    var response =
        await http.get(Uri.parse('http://python.tech-slave.com/api/products'));
    setState(() {
      var decode = json.decode(response.body);
      _products = decode[0]['payload'];
    });
  }

  String getProdName(String a) {
    if (a.length > 24) {
      a = a.substring(0, 24);
      a += '...';
    }
    return a;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.shop_rounded),
        title: Text("NUBTK Shop"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40.h,
                        child: TextFormField(
                          controller: _searchController,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.r)),
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.r)),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              hintText: "Work in progress...",
                              hintStyle: TextStyle(fontSize: 15.sp)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        color: Colors.blueAccent,
                        height: 40.h,
                        width: 40.w,
                        child: const Center(
                            child: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                      ),
                      onTap: () => {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              AspectRatio(
                  aspectRatio: 3.5,
                  child: CarouselSlider(
                    items: _carouselImages
                        .map((img) => Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.r),
                                    image: DecorationImage(
                                        image: NetworkImage(img),
                                        fit: BoxFit.fitWidth)),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        autoPlayAnimationDuration:
                            const Duration(microseconds: 600),
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (val, carouselPageChangedReason) {
                          setState(() {
                            _dotPosition = val;
                          });
                        }),
                  )),
              SizedBox(
                height: 10.h,
              ),
              DotsIndicator(
                dotsCount:
                    _carouselImages.length == 0 ? 1 : _carouselImages.length,
                position: _dotPosition.toDouble(),
                decorator: DotsDecorator(
                    activeColor: Colors.blue,
                    color: Colors.blue.withOpacity(.5),
                    spacing: EdgeInsets.all(2),
                    activeSize: Size(8, 8),
                    size: Size(6, 6)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 1.sw,
                padding: EdgeInsets.all(5.w),
                color: Colors.blueAccent,
                child: Text(
                  "Our Products",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _products == null ? 0 : _products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    ProductDetails(_products[index]))),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 3,
                          child: Column(
                            children: [
                              AspectRatio(
                                  aspectRatio: 1.27,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "http://python.tech-slave.com/static/uploads/${_products[index]['prod_img']}",
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              SizedBox(height: 5),
                              Text(getProdName(
                                  _products[index]['prod_name'].toString())),
                              Text(
                                  "৳ ${_products[index]['prod_price'].toString()}"),
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
