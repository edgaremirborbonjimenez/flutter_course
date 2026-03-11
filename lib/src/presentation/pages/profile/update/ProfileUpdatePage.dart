import 'package:e_commerce/src/domain/models/User.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:e_commerce/src/presentation/pages/profile/update/ProfileUpdateContent.dart';
import 'package:e_commerce/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:e_commerce/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:e_commerce/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  ProfileUpdateBloc? _bloc;
  User? user;

  //Se ejecutará una sola vez cuando la pantalla es mostrada,
  //metodo alternativo en vez de inicializar el evento en el BlocProvider
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      // Espera a que la pantalla cargue completamente, permitiendo que las instancias creadas por el build a estén creadas
      _bloc?.add(ProfileUpdateInitEvent(user: user));
    });
  }

  //Se ejecuta despues de el init y esto es cada vez que recarga la pagina
  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ProfileUpdateBloc>(context);
    user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      body: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
        listener: (context, state) {
          final responseState = state.response;

          if (responseState is Error) {
            Fluttertoast.showToast(
              msg: responseState.message,
              toastLength: Toast.LENGTH_LONG,
            );
          } else if (responseState is Success) {
            Fluttertoast.showToast(
              msg: "Update Succesfull",
              toastLength: Toast.LENGTH_LONG,
            );
          }
        },
        child: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Stack(
                children: [
                  ProfileUpdateContent(_bloc, state, user),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
            return ProfileUpdateContent(_bloc, state, user);
          },
        ),
      ),
    );
  }
}
