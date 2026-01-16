import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:e_commerce/src/presentation/pages/auth/login/LoginBlocCubit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginResponse extends StatelessWidget {
  final LoginBlocCubit? loginBlocCubit;

  const LoginResponse({super.key, required this.loginBlocCubit});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: loginBlocCubit?.responseStream,
      builder: ((context, snapshot) {
        final state = snapshot.data;
        if (state is Loading) {
          return Center(child: CircularProgressIndicator(color: Colors.black));
        } else if (state is Error) {
          Fluttertoast.showToast(
            msg: state.message,
            toastLength: Toast.LENGTH_LONG,
          );
        } else if (state is Success) {
          Fluttertoast.showToast(
            msg: 'Successfull Login',
            toastLength: Toast.LENGTH_LONG,
          );
        }
        return Container();
      }),
    );
  }
}
