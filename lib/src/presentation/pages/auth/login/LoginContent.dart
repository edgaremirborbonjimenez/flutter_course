import 'package:e_commerce/src/presentation/pages/auth/login/LoginBlocCubit.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultButton.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginContent extends StatelessWidget {
  final LoginBlocCubit? loginBlocCubit;

  const LoginContent({super.key, required this.loginBlocCubit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/img/background2.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
          color: Color.fromRGBO(0, 0, 0, 0.7),
          colorBlendMode: BlendMode.darken,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.3),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person, color: Colors.white, size: 125),
              Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: StreamBuilder(
                  stream: loginBlocCubit?.emailStream,
                  builder: (context, asyncSnapshot) {
                    return DefaultTextField(
                      label: "Email",
                      errorText: asyncSnapshot.error?.toString(),
                      icon: Icons.email,
                      onChanged: (text) {
                        loginBlocCubit?.changeEmail(text);
                      },
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: StreamBuilder(
                  stream: loginBlocCubit?.passwordStream,
                  builder: (context, asyncSnapshot) {
                    return DefaultTextField(
                      label: "Password",
                      errorText: asyncSnapshot.error?.toString(),
                      icon: Icons.lock,
                      onChanged: (text) {
                        loginBlocCubit?.changePassword(text);
                      },
                      obscureText: true,
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 25,
                  bottom: 15,
                ),
                child: StreamBuilder(
                  stream: loginBlocCubit?.validateForm,
                  builder: (context, asyncSnapshot) {
                    return DefaultButton(
                      color: asyncSnapshot.hasData
                          ? Color.fromARGB(255, 187, 141, 5)
                          : Colors.grey,
                      text: "LOGIN",
                      onPressed: () {
                        if (asyncSnapshot.hasData) {
                          loginBlocCubit?.login();
                        } else {
                          Fluttertoast.showToast(
                            msg: 'Invalid Data',
                            toastLength: Toast.LENGTH_LONG,
                          );
                        }
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 65,
                    height: 1,
                    color: Colors.white,
                    margin: EdgeInsets.only(right: 5),
                  ),
                  Text(
                    "Dont have account?",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Container(
                    width: 65,
                    height: 1,
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 5),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                child: DefaultButton(
                  text: "REGISTER",
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
