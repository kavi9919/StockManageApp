import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                "assets/vector_1.png",
                width: screenSize.width, // Adjust as needed
                height: screenSize.height * 0.45, // Adjust as needed
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                      color: const Color(0xFF755DC1),
                      fontSize: screenSize.width * 0.06, // Responsive font size
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                  ),
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
                  SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                  TextField(
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
                  SizedBox(
                    height: screenSize.height * 0.025,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      width: screenSize.width * 0.8,
                      height: screenSize.height * 0.08,
                      //sign in button
                      child: ElevatedButton(
                        onPressed: () {
                          //sign in logic
                          Navigator.of(context).pushNamed('/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9F7BFF),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width *
                                0.035, // Responsive font size
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.015,
                  ),
                  Row(
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          color: const Color(0xFF837E93),
                          fontSize:
                              screenSize.width * 0.03, // Responsive font size
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width * 0.0075,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigate to Sign Up Screen
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: const Color(0xFF755DC1),
                            fontSize:
                                screenSize.width * 0.03, // Responsive font size
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.015,
                  ),
                  Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: const Color(0xFF755DC1),
                      fontSize: screenSize.width * 0.03, // Responsive font size
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
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
