import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../DataModel/DBModel.dart';
import '../DataModel/form.dart';
import '../home.dart';
import '../networkHandler/network_handler.dart';

final getStorage = GetStorage();
var email;
FormData1 userData = FormData1();
var loginController = FormController();
var formController = Get.put(FormController());
bool spinnerLoading = false;

class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

TextEditingController fnameController = TextEditingController();
TextEditingController lnameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _InsertDataState extends State<InsertData> {
  @override
  void initState() {
    super.initState();
    email = getStorage.read("email");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                const IllustrationHome(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16, top: 291),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter Details",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 43,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(38, 0, 38, 8),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.person),
                                  label: Text(
                                    "First Name",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                controller: fnameController,
                                validator:
                                    RequiredValidator(errorText: "Required"),
                                onChanged: (value) {
                                  formController.errorText = "";
                                  setState(() {});
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(38, 0, 38, 8),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.person),
                                  label: Text(
                                    "Last Name",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                controller: lnameController,
                                validator:
                                    RequiredValidator(errorText: "Required"),
                                onChanged: (value) {
                                  formController.errorText = "";
                                  setState(() {});
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(38, 0, 38, 8),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.email),
                                  label: Text(
                                    "Email ID",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                controller: emailController,
                                validator:
                                    RequiredValidator(errorText: "Required"),
                                onChanged: (value) {
                                  formController.errorText = "";
                                  setState(() {});
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(38, 0, 38, 8),
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.password),
                                  label: Text(
                                    "Password",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                controller: passwordController,
                                validator:
                                    RequiredValidator(errorText: "Required"),
                                onChanged: (value) {
                                  formController.errorText = "";
                                  setState(() {});
                                },
                              ),
                            ),
                           
                            const SizedBox(
                              height: 93,
                            ),
                            MainButtonWidget(
                              title: "Submit",
                              onPressed: () async {
                                setState(() {
                                  spinnerLoading = false;
                                });
                                if (_formKey.currentState!.validate()) {
                                  loginController.sendFormData();
                                  await Get.to(HomePage());
                                  getStorage.write(
                                      "email", emailController.text);
                                  print("getStorage email:"
                                      "${getStorage.read("email")}");
                                } else {
                                  formController.errorText = "";
                                }
                              },
                            ),
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IllustrationHome extends StatelessWidget {
  const IllustrationHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0, // you may need to change value
      child: Image.asset(
        "img/BG_Illust.png",
        fit: BoxFit.fitWidth,
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 1,
      ),
    );
  }
}

class MainButtonWidget extends StatelessWidget {
  const MainButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 328,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xff0C6E54),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: "ProductSans Regular",
          ),
        ),
      ),
    );
  }
}

class FormController extends GetxController {
  bool error = false;
  String errorText = "";
  void sendFormData() async {
    EasyLoading.show();
    DbModel loginModal = DbModel(
      firstName: fnameController.text,
      lastName: lnameController.text,
      email: emailController.text,
      password: passwordController.text,

    );
    var response =
        await NetworkHandler.post(DbModelToJson(loginModal), "auth/form");
    print(response);
    if (response != "Error") {
      var userDetails = jsonDecode(response);
      if (userDetails['email'] == true) {
        // await NetworkHandler.storeToken(userDetails['token']);
        // await NetworkHandler.storeUserId(userDetails['_id']);
        print("Login userDetails are $userDetails");
        print("LOGIN response $response");
        if (userDetails['token'] != null) {
          getStorage.write("userId", userDetails['_id']);
          getStorage.write("firstName", fnameController.text);
          getStorage.write("lastName", lnameController.text);
          getStorage.write("email", emailController.text);
          getStorage.write("password", passwordController.text);

          getStorage.write("loginType", "Normal");
          getStorage.write("username", userDetails['firstname']['lastName']);
          getStorage.write("email", true);
          // Get.offAll(HomeNavigation());
        }
        EasyLoading.dismiss();
      } else {
        getStorage.write("userId", userDetails['_id']);

        getStorage.write("firstName", fnameController.text);
        getStorage.write("lastName", lnameController.text);
        getStorage.write("email", emailController.text);

        getStorage.write("loginType", "Normal");
        getStorage.write("username", userDetails['firstname']['lastName']);
      }
    } else {
      print("userDetails['error']");
    }
    EasyLoading.dismiss();
  }
}
