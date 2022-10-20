import 'package:basic_ecommerce/ui/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // controller for the two text inputs
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var _username;
  var _password;
  var _hide_password = true;

  void _sing_up() async {
    print(_username);
    print(_password);
    var response = await http.post(
        Uri.parse('http://python.tech-slave.com/signup'),
        body: {"username": _username, "password": _password});
    setState(() {
      print(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 150.h,
            width: ScreenUtil().screenWidth,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.light,
                      color: Colors.transparent,
                    ),
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 22.sp, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: ScreenUtil().screenWidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r))),
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "So, You don't have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                      ),
                    ),
                    Text(
                      'Hope you know how to get started..',
                      style: TextStyle(
                        color: Color.fromARGB(255, 116, 115, 115),
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 55.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r))),
                          child: const Icon(Icons.person),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(
                            child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                              hintText: 'John',
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                  fontSize: 18.sp, color: Colors.black)),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 55.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                          ),
                          child: const Icon(Icons.lock),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _passwordController,
                            obscureText: _hide_password,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                labelText: 'Password',
                                hintStyle: TextStyle(
                                    fontSize: 14.sp, color: Colors.black),
                                labelStyle: TextStyle(
                                  fontSize: 18.sp,
                                ),
                                suffixIcon: _hide_password
                                    ? IconButton(
                                        onPressed: () => {
                                          setState(() => {
                                                _hide_password = false,
                                              })
                                        },
                                        icon: const Icon(Icons.remove_red_eye),
                                      )
                                    : IconButton(
                                        onPressed: (() => {
                                              setState(() =>
                                                  {_hide_password = true}),
                                            }),
                                        icon: Icon(Icons.visibility_off))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Container(
                      width: ScreenUtil().screenWidth,
                      height: 55.h,
                      child: ElevatedButton(
                          onPressed: (() => {
                                setState(() => {
                                      _username = _usernameController.text,
                                      _password = _passwordController.text,
                                      _sing_up()
                                    })
                              }),
                          child: Text(
                            'Sing Up',
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.sp),
                          )),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Wrap(children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      ),
                      GestureDetector(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        onTap: () => {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const Login()))
                        },
                      )
                    ])
                  ],
                ),
              ),
            ),
          ))
        ],
      )),
    );
  }
}
