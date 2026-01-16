import 'package:e_commerce/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:e_commerce/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:e_commerce/src/presentation/pages/auth/login/LoginResponse.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultButton.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _loginBloc;

  @override
  void initState() {
    print("Init State Executed");
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //   _loginBloc?.dispose();
    // });
  }

  @override
  Widget build(BuildContext context) {
    print("Build Executed");

    _loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            LoginResponse(loginBloc: _loginBloc),
            LoginContent(loginBloc: _loginBloc),
          ],
        ),
      ),
    );
  }
}
