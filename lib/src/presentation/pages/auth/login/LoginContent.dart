import 'package:e_commerce/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:e_commerce/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:e_commerce/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:e_commerce/src/presentation/utils/BlocFormItem.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultButton.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginContent extends StatelessWidget {
  final LoginBloc? loginBloc;
  final LoginState state;

  const LoginContent(this.loginBloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context),
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
                _iconPerson(),
                _textLogin(),
                _textFieldEmail(),
                _textFieldPassword(),
                _buttonLogin(),
                _textDontHaveAccount(),
                _buttonGoToRegister(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconPerson() => Icon(Icons.person, color: Colors.white, size: 125);

  Widget _textLogin() {
    return Text(
      "LOGIN",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
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
    );
  }

  Widget _buttonGoToRegister(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
      child: DefaultButton(
        text: "REGISTER",
        onPressed: () {
          Navigator.pushNamed(context, 'register');
        },
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
      child: DefaultButton(
        color: Color.fromARGB(255, 187, 141, 5),
        text: "LOGIN",
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            loginBloc?.add(LoginSubmit());
          } else {
            Fluttertoast.showToast(
              msg: 'Invalid Data',
              toastLength: Toast.LENGTH_LONG,
            );
          }
        },
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: "Password",
        // errorText: asyncSnapshot.error?.toString(),
        icon: Icons.lock,
        onChanged: (text) {
          loginBloc?.add(PasswordChanged(password: BlocFormItem(value: text)));
        },
        obscureText: true,
        validator: (value) {
          return state.password.error;
        },
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: "Email",
        // errorText: asyncSnapshot.error?.toString(),
        icon: Icons.email,
        onChanged: (text) {
          loginBloc?.add(EmailChanged(email: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.email.error;
        },
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background2.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
