import 'package:e_commerce/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:e_commerce/src/presentation/pages/auth/register/RegisterContent.dart';
import 'package:e_commerce/src/presentation/pages/auth/register/RegisterResponse.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultButton.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultIconBack.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

RegisterBlocCubit? _registerBlocCubit;

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _registerBlocCubit?.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    _registerBlocCubit = BlocProvider.of(context, listen: false);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            RegisterContent(_registerBlocCubit),
            RegisterResponse(registerBlocCubit: _registerBlocCubit),
          ],
        ),
      ),
    );
  }
}
