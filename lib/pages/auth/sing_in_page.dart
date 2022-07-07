import 'package:ecommerce_app/base/custom_loader.dart';
import 'package:ecommerce_app/pages/auth/sign_up_page.dart';
import 'package:ecommerce_app/routes/route_helper.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:ecommerce_app/widgets/app_text_field.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/show_custome_snackbar.dart';
import '../../controllers/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwardController = TextEditingController();

    void _login(AuthController authController){
      String phone = phoneController.text.trim();
      String password = passwardController.text.trim();

      if(phone.isEmpty) {
        ShowCustomSnackBar(
            "Type in your email address", title: "Email address");
      }else if(password.isEmpty){
        ShowCustomSnackBar("Type in your password",title: "Password");
      }else if(password.length<6){
        ShowCustomSnackBar("Password can not be less than six character",title: "Password");
      }else{

        authController.login( phone, password).then((status){
          if(status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
          }else{
            ShowCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoading?SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHight * 0.05,
              ),
              //app logo
              Container(
                height: Dimensions.screenHight * 0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: AssetImage("assets/image/logo part 1.png"),
                  ),
                ),
              ),
              //welcome
              Container(
                margin: EdgeInsets.only(left: Dimensions.width30),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello",
                      style: TextStyle(
                        fontSize: Dimensions.font20*3+Dimensions.font20/2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Sign into your account",
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        //fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20,),
              //email
              AppTextField(
                  textController: phoneController,
                  hintText: "Phone",
                  icon: Icons.phone),
              SizedBox(
                height: Dimensions.height20,
              ),
              AppTextField(
                textController: passwardController,
                hintText: "Password",
                icon: Icons.password_sharp,isObscure: true,),

              SizedBox(height: Dimensions.height20,),
              Row(
                children: [
                  Expanded(child: Container()),
                  RichText(text: TextSpan(
                    text: "Sign into your account",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20,

                    ),
                  ),
                  ),
                  SizedBox(width: Dimensions.width30,),

                ],
              ),
              SizedBox(
                height: Dimensions.screenHight*0.05,
              ),
              GestureDetector(
                onTap: (){
                  _login(authController);
                },
                child: Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHight / 13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: "Sign in",
                      size: Dimensions.font20 + Dimensions.font20 / 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.screenHight*0.05,
              ),
              RichText(text: TextSpan(
                  text: "Don\'t have an account? ",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20,

                  ),
                  children: [
                    TextSpan(
                      recognizer:  TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition: Transition.fade),
                      text: "Create",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainBlackColor,
                        fontSize: Dimensions.font20,

                      ),
                    ),
                  ]
              ),
              ),
            ],
          ),
        ):CustomLoader();
      })
    );
  }
}
