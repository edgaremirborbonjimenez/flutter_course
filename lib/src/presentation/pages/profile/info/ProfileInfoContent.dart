import 'package:e_commerce/src/domain/models/User.dart';
import 'package:flutter/material.dart';

class ProfileInfoContent extends StatelessWidget {

  User? user;

   ProfileInfoContent(this.user);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _imageBackground(context),
        Column(
          children: [
            _imageProfile(),
            Spacer(),
            _cardProfileInfo(context)
          ],
        )
        ]);
  }

  Widget _cardProfileInfo(BuildContext context){
      return Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ListTile(
                title: Text('${user?.name ?? ''} ${user?.lastName ?? ''}'),
                subtitle: Text("Username"),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text('${user?.email ?? ''}'),
                subtitle: Text("Email"),
                leading: Icon(Icons.email),
              ),
              ListTile(
                title: Text('${user?.phone ?? ''}'),
                subtitle: Text("Phone Number"),
                leading: Icon(Icons.phone),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 10, bottom: 10),
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: (){
                  
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  ),),
              )
            ],
          ),
        ),
      );
  }

  Widget _imageProfile() {
    return Container(
      margin: EdgeInsets.only(top:100),
      width: 150,
      child: AspectRatio(
        aspectRatio: 1/1,
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
