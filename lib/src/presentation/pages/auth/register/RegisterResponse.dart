import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:e_commerce/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterResponse extends StatelessWidget {
  final RegisterBlocCubit? registerBlocCubit;

  const RegisterResponse({super.key, required this.registerBlocCubit});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: registerBlocCubit?.responseStream,
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
            msg: 'Successfull Register',
            toastLength: Toast.LENGTH_LONG,
          );
        }
        return Container();
      }),
    );
  }
}
