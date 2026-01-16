import 'package:e_commerce/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultButton.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultIconBack.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterContent extends StatelessWidget {
  final RegisterBlocCubit? _registerBlocCubit;

  const RegisterContent(this._registerBlocCubit);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  child: StreamBuilder(
                    stream: _registerBlocCubit?.nameStream,
                    builder: (context, asyncSnapshot) {
                      return DefaultTextField(
                        label: "Name",
                        errorText: asyncSnapshot.error?.toString(),
                        icon: Icons.person,
                        onChanged: (text) {
                          _registerBlocCubit?.changeName(text);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: StreamBuilder(
                    stream: _registerBlocCubit?.lastNameStream,
                    builder: (context, asyncSnapshot) {
                      return DefaultTextField(
                        label: "Last Name",
                        errorText: asyncSnapshot.error?.toString(),
                        icon: Icons.person,
                        onChanged: (text) {
                          _registerBlocCubit?.changeLastName(text);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: StreamBuilder(
                    stream: _registerBlocCubit?.emailStream,
                    builder: (context, asyncSnapshot) {
                      return DefaultTextField(
                        label: "Email",
                        errorText: asyncSnapshot.error?.toString(),
                        icon: Icons.email,
                        onChanged: (text) {
                          _registerBlocCubit?.changeEmail(text);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: StreamBuilder(
                    stream: _registerBlocCubit?.phoneStream,
                    builder: (context, asyncSnapshot) {
                      return DefaultTextField(
                        label: "Phone Number",
                        errorText: asyncSnapshot.error?.toString(),
                        icon: Icons.phone,
                        onChanged: (text) {
                          _registerBlocCubit?.changePhone(text);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: StreamBuilder(
                    stream: _registerBlocCubit?.passwordStream,
                    builder: (context, asyncSnapshot) {
                      return DefaultTextField(
                        obscureText: true,
                        label: "Password",
                        errorText: asyncSnapshot.error?.toString(),
                        icon: Icons.lock,
                        onChanged: (text) {
                          _registerBlocCubit?.changePassword(text);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: StreamBuilder(
                    stream: _registerBlocCubit?.validatePasswordStream,
                    builder: (context, asyncSnapshot) {
                      return DefaultTextField(
                        obscureText: true,
                        label: "Validate Password",
                        errorText: asyncSnapshot.error?.toString(),
                        icon: Icons.lock,
                        onChanged: (text) {
                          _registerBlocCubit?.changeValidatePassword(text);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                  child: StreamBuilder(
                    stream: _registerBlocCubit?.validateForm,
                    builder: (context, asyncSnapshot) {
                      return DefaultButton(
                        color: asyncSnapshot.hasData
                            ? Color.fromARGB(255, 187, 141, 5)
                            : Colors.grey,
                        text: "REGISTER",
                        onPressed: () {
                          if (asyncSnapshot.hasData) {
                            _registerBlocCubit?.register();
                          } else {
                            Fluttertoast.showToast(
                              msg: 'Invalid data',
                              toastLength: Toast.LENGTH_LONG,
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        DefaultIconBack(left: 45, top: 150),
      ],
    );
  }
}
