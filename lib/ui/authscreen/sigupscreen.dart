import 'package:crm/ui/authscreen/loginscreen.dart';
import 'package:crm/ui/constant/app_color.dart';
import 'package:flutter/material.dart';

import '../screens/dashboard.dart';
import 'otp_verification_page.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
bool isPasswordVisible = false;
bool isPasswordVisible1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgLight,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                  
                    Text("Sign up to your",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColor.mainColor)),
                    Text("Account",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColor.mainColor)),
                    SizedBox(height: 10),
                    Text("Create an account to continue!",
                        style: TextStyle(fontSize: 14, color: AppColor.grey)),
                    SizedBox(height: 30),
                      Text("First Name",style: TextStyle(color: AppColor.textColor),),
                    SizedBox(height: 8),
                    TextField(
                      keyboardType: TextInputType.name,
                      controller: firstnameController,
                      decoration: InputDecoration(
                        hintText: "John",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                      Text("Last Name",style: TextStyle(color: AppColor.textColor),),
                    SizedBox(height: 8),
                    TextField(
                      keyboardType: TextInputType.name,
                      controller: lastnameController,
                      decoration: InputDecoration(
                        hintText: "Peter",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("Email",style: TextStyle(color: AppColor.textColor),),
                    SizedBox(height: 8),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "example@gmail.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("Password",style: TextStyle(color: AppColor.textColor)),
                    SizedBox(height: 8),
                   TextField(
  keyboardType: TextInputType.text,
  controller: passwordController,
  obscureText: !isPasswordVisible,
  decoration: InputDecoration(
    hintText: "********",
    suffixIcon: IconButton(
      icon: Icon(
        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        color: AppColor.litgrey,
      ),
      onPressed: () {
        setState(() {
          isPasswordVisible = !isPasswordVisible;
        });
      },
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),
 SizedBox(height: 16),
                    Text("Confirm Password",style: TextStyle(color: AppColor.textColor)),
                    SizedBox(height: 8),
                   TextField(
  keyboardType: TextInputType.text,
  controller: confirmpasswordController,
  obscureText: !isPasswordVisible1,
  decoration: InputDecoration(
    hintText: "********",
    suffixIcon: IconButton(
      icon: Icon(
        isPasswordVisible1 ? Icons.visibility : Icons.visibility_off,
        color: AppColor.litgrey,
      ),
      onPressed: () {
        setState(() {
          isPasswordVisible1 = !isPasswordVisible1;
        });
      },
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),

                   
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child:
                       ElevatedButton(
                        style: ElevatedButton.styleFrom(
                       
                          backgroundColor:  AppColor.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                               Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpVerificationPage(),
                          ),
                        );
                        },
                        child: Text("Register",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.white)),
                      ),
                    ),
                   
                   
                  ],
                ),
              ),
            ),
               Padding(
  padding: const EdgeInsets.only(bottom: 0),
  child: 
  
  Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(color: AppColor.grey),
        ),
        TextButton(
          onPressed: () {
           Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Loginscreen()),
    );
          },
          child: Text(
            "Login",
            style: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}
