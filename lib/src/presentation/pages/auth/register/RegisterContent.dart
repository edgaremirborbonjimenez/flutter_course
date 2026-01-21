import 'package:e_commerce/src/presentation/pages/auth/register/bloc/RegistareState.dart';
import 'package:e_commerce/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:e_commerce/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:e_commerce/src/presentation/utils/BlocFormItem.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultButton.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultIconBack.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterContent extends StatelessWidget {
  final RegisterBloc? bloc;
  final RegisterState state;
  const RegisterContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/img/background3.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            color: Color.fromRGBO(0, 0, 0, 0.7),
            colorBlendMode: BlendMode.darken,
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, size: 100, color: Colors.white),
                  Text(
                    "REGISTER",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: "Name",
                      icon: Icons.person,
                      onChanged: (text) {
                        bloc?.add(
                          RegisterNameChanged(name: BlocFormItem(value: text)),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: "Last Name",
                      icon: Icons.person,
                      onChanged: (text) {
                        bloc?.add(
                          RegisterLastNameChanged(
                            lastName: BlocFormItem(value: text),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: "Email",
                      icon: Icons.email,
                      onChanged: (text) {
                        bloc?.add(
                          RegisterEmailChanged(
                            email: BlocFormItem(value: text),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: "Phone Number",
                      icon: Icons.phone,
                      onChanged: (text) {
                        bloc?.add(
                          RegisterPhoneChanged(
                            phone: BlocFormItem(value: text),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      obscureText: true,
                      label: "Password",
                      icon: Icons.lock,
                      onChanged: (text) {
                        bloc?.add(
                          RegisterPasswordChanged(
                            password: BlocFormItem(value: text),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      obscureText: true,
                      label: "Validate Password",
                      icon: Icons.lock,
                      onChanged: (text) {
                        bloc?.add(
                          RegisterConfirmPasswordChanged(
                            confirmPassword: BlocFormItem(value: text),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: DefaultButton(
                      color: Color.fromARGB(255, 187, 141, 5),
                      text: "REGISTER",
                      onPressed: () {
                        if (state.formKey!.currentState!.validate()) {
                          bloc?.add(RegisterFormSubmit());
                        } else {
                          print("invalido");
                          Fluttertoast.showToast(
                            msg: 'Invalid data',
                            toastLength: Toast.LENGTH_LONG,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          DefaultIconBack(left: 45, top: 150),
        ],
      ),
    );
  }
}
