import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/routes.dart';
import 'package:rent_a_car/utils/navigator.dart';
import 'package:rent_a_car/widgets/buttons.dart';
import 'package:rent_a_car/widgets/custom_textfield.dart';
import 'package:rent_a_car/providers/authentication.dart';
import 'package:rent_a_car/utils/assets.dart';
import 'package:rent_a_car/widgets/loader.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppAssets.loginBackground,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ), // Blur intensity
                    child: Container(
                      color: Colors.black.withOpacity(0.3), // Dark overlay
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: provider.formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: provider.email,
                          title: 'Email',
                          hint: 'Enter email',
                          validator: (value) {
                            if (!isValidEmail(value!)) {
                              return 'Please enter a valid email';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: provider.pass,
                          title: 'Password',
                          hint: 'Enter password',
                          obscureText: true,
                        ),
                        SizedBox(height: 30),
                        FullButton(
                          leftPadding: 0,
                          rightPadding: 0,
                          name: 'Login',
                          onTap: () async {
                            if (provider.formKey.currentState!.validate()) {
                              await provider.login().then((response) {
                                print(response.statusCode);
                                if (response.statusCode == 200) {
                                  Nav.pushAndRemoveAll(
                                    context,
                                    Routes.homeScreen,
                                  );
                                }
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                if (provider.loader) const Loader(),
              ],
            ),
          ),
        );
      },
    );
  }

  bool isValidEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }
}
