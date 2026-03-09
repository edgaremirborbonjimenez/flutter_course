import 'package:e_commerce/src/domain/models/User.dart';
import 'package:e_commerce/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:e_commerce/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:e_commerce/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:e_commerce/src/presentation/utils/BlocFormItem.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultIconBack.dart';
import 'package:e_commerce/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';

class ProfileUpdateContent extends StatelessWidget {
  ProfileUpdateBloc? bloc;
  ProfileUpdateState state;
  User? user;
  ProfileUpdateContent(this.bloc, this.state, this.user);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _imageBackground(context),
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _imageProfile(),
                // Spacer(),
                _cardProfileInfo(context),
              ],
            ),
          ),
        ),
        DefaultIconBack(left: 15, top: 50),
      ],
    );
  }

  Widget _cardProfileInfo(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            _textUpdateInfo(),
            _textFieldName(),
            _textFieldLastName(),
            _textFieldEmail(),
            _textFieldPhone(),
            _fabSubmit(),
          ],
        ),
      ),
    );
  }

  Widget _fabSubmit() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 10, top: 20),
      child: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Icon(Icons.check, color: Colors.white),
      ),
    );
  }

  Widget _textUpdateInfo() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 25, left: 35, bottom: 10),
      child: Text("UPDATE INFORMATION", style: TextStyle(fontSize: 17)),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: "Name",
        icon: Icons.person,
        initialValue: user?.name ?? '',
        color: Colors.black,
        onChanged: (text) {
          bloc?.add(ProfileUpdateNameChange(name: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.name.error;
        },
      ),
    );
  }

  Widget _textFieldLastName() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: "LastName",
        icon: Icons.person_outline,
        initialValue: user?.lastName ?? '',
        color: Colors.black,
        onChanged: (text) {
          bloc?.add(
            ProfileUpdateLastNameChange(lastName: BlocFormItem(value: text)),
          );
        },
        validator: (value) {
          return state.lastName.error;
        },
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: "Email",
        icon: Icons.email,
        initialValue: user?.email ?? '',
        color: Colors.black,
        onChanged: (text) {
          bloc?.add(ProfileUpdateEmailChange(email: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.email.error;
        },
      ),
    );
  }

  Widget _textFieldPhone() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: "Phone",
        icon: Icons.phone,
        initialValue: user?.phone ?? '',
        color: Colors.black,
        onChanged: (text) {
          bloc?.add(ProfileUpdatePhoneChange(phone: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.phone.error;
        },
      ),
    );
  }

  Widget _imageProfile() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      width: 150,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipOval(
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/img/user.png',
            image:
                'https://imgs.search.brave.com/Ak3-wGTlGWp6clTi_iWX4ma6KPUXbryxlNQmN1Itgk4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tYXJr/ZXRwbGFjZS5jYW52/YS5jb20vRUFHMW1P/S19kemMvMi8wLzE2/MDB3L2NhbnZhLWJs/dWUtbW9kZXJuLXdv/bWFuLXBvcnRyYWl0/LWluc3RhZ3JhbS1w/cm9maWxlLXBpY3R1/cmUtRU5zN1ZTS0pi/Z3cuanBn',
            fit: BoxFit.cover,
            fadeInDuration: Duration(seconds: 1),
          ),
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background3.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
