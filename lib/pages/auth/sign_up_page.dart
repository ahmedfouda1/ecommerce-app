import 'package:ecommerce_app/base/custom_loader.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/models/signup_body_model.dart';
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

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var singUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];
    void _registration(AuthController authController){
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(name.isEmpty){
        ShowCustomSnackBar("Type in your name",title: "Name");
      }else if(phone.isEmpty){
        ShowCustomSnackBar("Type in your phone number",title: "Phone number");
      }else if(email.isEmpty){
        ShowCustomSnackBar("Type in your email address",title: "Email address");
      }else if(!GetUtils.isEmail(email)){
        ShowCustomSnackBar("Type in your valid email address",title: "Valid email address");
      }else if(password.isEmpty){
        ShowCustomSnackBar("Type in your password",title: "Password");
      }else if(password.length<6){
        ShowCustomSnackBar("Password can not be less than six character",title: "Password");
      }else{
        SignUpBody signUpBody = SignUpBody(
            name: name,
            phone: phone,
            email: email,
            password: password,
        );
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            Get.offNamed(RouteHelper.getInitial());
          }else{
            ShowCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController){
        return !_authController.isLoading?SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHight * 0.05,
              ),
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
              AppTextField(
                  textController: emailController,
                  hintText: "Email",
                  icon: Icons.email),
              SizedBox(
                height: Dimensions.height20,
              ),
              AppTextField(
                  textController: passwordController,
                  hintText: "Password",
                  icon: Icons.password_sharp,isObscure: true,),
              SizedBox(
                height: Dimensions.height20,
              ),
              AppTextField(
                  textController: nameController,
                  hintText: "Name",
                  icon: Icons.person),
              SizedBox(
                height: Dimensions.height20,
              ),
              AppTextField(
                  textController: phoneController,
                  hintText: "Phone",
                  icon: Icons.phone),
              SizedBox(
                height: Dimensions.height30,
              ),
              GestureDetector(
                onTap: (){
                  _registration(_authController);
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
                      text: "Sign up",
                      size: Dimensions.font20 + Dimensions.font20 / 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              RichText(text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                text: "Have an account already?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20,

                ),
              ),
              ),
              SizedBox(height: Dimensions.height45,),
              RichText(text: TextSpan(
                text: "Sign up using one of the following methods",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font16,

                ),
              ),
              ),
              SizedBox(height: Dimensions.height10,),
              Wrap(
                children: List.generate(3, (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: Dimensions.radius30,
                    backgroundImage: AssetImage(
                      "assets/image/"+singUpImages[index],
                    ),
                  ),
                )),
              ),
            ],
          ),
        ):const CustomLoader();
      })
    );


  }
}
