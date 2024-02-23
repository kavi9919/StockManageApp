import 'package:flutter/material.dart';
import 'package:my_app/screens/login_page.dart';

class SingUpScreen extends StatefulWidget {
  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _repassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, LoginScreen());
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/vector_2.png",
              width: screenSize.width, // Adjust as needed
              height: screenSize.height * 0.45, // Adjust as needed
            ),
            SizedBox(height: screenSize.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign up',
                    style: TextStyle(
                      color: const Color(0xFF755DC1),
                      fontSize: screenSize.width * 0.06,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.04),
                  TextField(
                    controller: _emailController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF393939),
                      fontSize: screenSize.width * 0.035,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: const Color(0xFF755DC1),
                        fontSize: screenSize.width * 0.04,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF837E93),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF9F7BFF),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _passController,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF393939),
                            fontSize: screenSize.width * 0.035,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Create Password',
                            hintStyle: TextStyle(
                              color: const Color(0xFF837E93),
                              fontSize: screenSize.width * 0.025,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            labelStyle: TextStyle(
                              color: const Color(0xFF755DC1),
                              fontSize: screenSize.width * 0.04,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFF837E93),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFF9F7BFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenSize.width * 0.05),
                      Expanded(
                        child: TextField(
                          controller: _repassController,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF393939),
                            fontSize: screenSize.width * 0.035,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              color: const Color(0xFF837E93),
                              fontSize: screenSize.width * 0.025,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            labelStyle: TextStyle(
                              color: const Color(0xFF755DC1),
                              fontSize: screenSize.width * 0.04,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFF837E93),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFF9F7BFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.025),
                  ClipRRect(
                    borderRadius: BorderRadius.all(const Radius.circular(10)),
                    child: SizedBox(
                      width: screenSize.width * 0.8,
                      height: screenSize.height * 0.08,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9F7BFF),
                        ),
                        child: Text(
                          'Create account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width * 0.035,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.015),
                  Row(
                    children: [
                      Text(
                        ' have an account?',
                        style: TextStyle(
                          color: const Color(0xFF837E93),
                          fontSize: screenSize.width * 0.03,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: screenSize.width * 0.0075),
                      InkWell(
                        onTap: () {
                          // Handle onTap
                        },
                        child: Text(
                          'Log In ',
                          style: TextStyle(
                            color: const Color(0xFF755DC1),
                            fontSize: screenSize.width * 0.03,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
