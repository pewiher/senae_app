import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:senae_app/data/const/constants.dart';
import 'package:senae_app/ui/Importaciones/notificaciones.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const MyHomePage(
              title: 'AppSenae',
            ));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final _formKey = GlobalKey<FormState>();
  // ButtonState stateTextWithIcon = ButtonState.idle;
  int _selectedDestination = 0;
  late String token = "";
  late String correo = "";
  late String LineaNegocio = "";
  late String NombreUsuario = "";
  bool isLoadView = false;
  final List<Widget> _viewApp = [];

  @override
  void initState() {
    _loadView();
    loadPagina();
    // NombreUsuario = Constants.full_name;
    setState(() {});
    super.initState();
  }

  Widget _menuItem(String data, IconData icon) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5),
          child: Icon(
            icon,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 19,
          ),
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: Text(
            data,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                color: Color.fromARGB(255, 253, 254, 255)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Farletza",
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: Color(0xff004172),
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
          ),
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/svg/hambmenu.svg',
              color: Colors.deepOrange,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget));
                },
                icon: const Icon(
                  Icons.restore,
                  color: Colors.deepOrange,
                ))
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    DrawerHeader(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 253, 254, 255),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Image.asset('assets/images/usuario.png'),
                              backgroundColor: Colors.white,
                              radius: MediaQuery.of(context).size.width * 0.12,
                            ),
                            // const SizedBox(height: 10),
                            Text(
                              NombreUsuario,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Text(
                              correo,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    isLoadView
                        ? Container(
                            child: const Center(
                              child: Column(
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Cargando vistas....."),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            child: Column(
                              children: _viewApp,
                            ),
                          ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    ListTile(
                      selected: _selectedDestination == 5,
                      leading:
                          Icon(MdiIcons.logout, color: const Color(0xff004172)),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          color: Color(0xff004172)),
                      title: const Text(
                        'Cerrar Sesión',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          color: Color(0xff004172),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onTap: () => {
                        // context
                        //    .read<AuthenticationBloc>()
                        //    .add(AuthenticationLogoutRequested())
                      },
                    ),
                  ],
                ),
              ),
              const Text(
                "Versión: 0.0.1",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  color: Color(0xff004172),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
        body: _home());
  }

  Widget _appBarPersonalizado(String titulopag) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Farletza',
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
        ),
        leading: IconButton(
          icon: Image.asset(
            "assets/images/usuario.png",
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //_formKey.currentState.reset();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => super.widget));
              },
              icon: const Icon(
                Icons.restore,
                color: Colors.white,
              ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            child: Image.asset("assets/images/usuario.png"),
                            backgroundColor: Colors.white,
                            radius: MediaQuery.of(context).size.width * 0.10,
                          ),
                          Text(
                            NombreUsuario,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          Text(
                            correo,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  isLoadView
                      ? Container(
                          child: const Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Cargando vistas....."),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          child: Column(
                            children: _viewApp,
                          ),
                        ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.black,
                  ),
                  ListTile(
                    selected: _selectedDestination == 5,
                    leading:
                        Icon(MdiIcons.logout, color: const Color(0xff004172)),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Color(0xff004172)),
                    title: const Text(
                      'Cerrar Sesión',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Color(0xff004172),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onTap: () => {
                      //  context
                      //    .read<AuthenticationBloc>()
                      //   .add(AuthenticationLogoutRequested())
                    },
                  ),
                ],
              ),
            ),
            const Text(
              "Versión: 0.0.1",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: Color(0xff004172),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _home() {
    return Container(
      color: Colors.white,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '¡Hola, bienvenida  ', // ${NombreUsuario}
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18,
              color: Color(0xff707070),
            ),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
          Align(
            alignment: Alignment(0.0, -0.0),
            child: Text(
              'Copyright © Farletza 2023',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: Color(0xff707070),
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItemHint(String hint, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: SvgPicture.asset(
              'assets/svg/hambmenu.svg',
            ),
          ),
        ],
      ),
    );
  }

  void loadPagina() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LineaNegocio = prefs.getString("LineaNegocio") ?? "";
    token = prefs.getString("token") ?? "";
    correo = prefs.getString("email") ?? "";
    NombreUsuario = prefs.getString("full_name") ?? "";

    setState(() {});
  }

  void _loadView() async {
    //  final opcionvenes = Constants.nombreVendedor;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LineaNegocio = prefs.getString("LineaNegocio") ?? "";

    //opciones.forEach((opcionesModel) {
    if (LineaNegocio.contains("IMP")) {
      _viewApp.add(ListTile(
        selected: _selectedDestination == 0,
        leading: SvgPicture.asset('assets/svg/campana_gris.svg',
            color: const Color(0xff004172)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xff004172)),
        title: const Text(
          'Notificaciones',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            color: Color(0xff004172),
            fontWeight: FontWeight.w700,
          ),
        ),
        onTap: () {
          MaterialPageRoute route;
          route = MaterialPageRoute(
              builder: (BuildContext context) => notificacionIMPPage());
          Navigator.push(context, route);
        },
      ));

      _viewApp.add(ListTile(
        selected: _selectedDestination == 1,
        leading: SvgPicture.asset('assets/svg/lista_ubicacion_gris.svg',
            color: const Color(0xff004172)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xff004172)),
        title: const Text(
          'Crear Itinerario',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            color: Color(0xff004172),
            fontWeight: FontWeight.w700,
          ),
        ),
        onTap: () {
          MaterialPageRoute route;
          route = MaterialPageRoute(
              builder: (BuildContext context) => notificacionIMPPage());
          Navigator.push(context, route);
        },
      ));
      _viewApp.add(ListTile(
        selected: _selectedDestination == 2,
        leading: SvgPicture.asset(
          'assets/svg/libreta_visto_gris.svg',
          color: const Color(0xff004172),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xff004172)),
        title: const Text(
          'Asignar Itinerario',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            color: Color(0xff004172),
            fontWeight: FontWeight.w700,
          ),
        ),
        onTap: () {
          MaterialPageRoute route;
          route = MaterialPageRoute(
              builder: (BuildContext context) => notificacionIMPPage());
          Navigator.push(context, route);
        },
      ));
      _viewApp.add(ListTile(
        selected: _selectedDestination == 3,
        leading: SvgPicture.asset('assets/svg/transmision_gris.svg',
            color: const Color(0xff004172)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xff004172)),
        title: const Text(
          'Transmitir Senae',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            color: Color(0xff004172),
            fontWeight: FontWeight.w700,
          ),
        ),
        onTap: () {
          MaterialPageRoute route;
          route = MaterialPageRoute(
              builder: (BuildContext context) => notificacionIMPPage());
          Navigator.push(context, route);
        },
      ));
      _viewApp.add(ListTile(
        selected: _selectedDestination == 4,
        leading: SvgPicture.asset('assets/svg/hoja_reloj_gris.svg',
            color: const Color(0xff004172)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xff004172)),
        title: const Text(
          'Transmisiones realizadas',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            color: Color(0xff004172),
            fontWeight: FontWeight.w700,
          ),
        ),
        onTap: () {
          MaterialPageRoute route;
          route = MaterialPageRoute(
              builder: (BuildContext context) => notificacionIMPPage());
          Navigator.push(context, route);
        },
      ));
      //}
    }
    if (LineaNegocio.contains("EXP")) {
      _viewApp.add(ListTile(
        selected: _selectedDestination == 0,
        leading: SvgPicture.asset('assets/svg/campana_gris.svg',
            color: const Color(0xff004172)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xff004172)),
        title: const Text(
          'Notificaciones',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            color: Color(0xff004172),
            fontWeight: FontWeight.w700,
          ),
        ),
        onTap: () {
          MaterialPageRoute route;
          route = MaterialPageRoute(
              builder: (BuildContext context) => notificacionIMPPage());
          Navigator.push(context, route);
        },
      ));
      _viewApp.add(ListTile(
        selected: _selectedDestination == 1,
        leading: SvgPicture.asset('assets/svg/transmision_gris.svg',
            color: const Color(0xff004172)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xff004172)),
        title: const Text(
          'Transmitir Senae',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            color: Color(0xff004172),
            fontWeight: FontWeight.w700,
          ),
        ),
        onTap: () {
          MaterialPageRoute route;
          route = MaterialPageRoute(
              builder: (BuildContext context) => notificacionIMPPage());
          Navigator.push(context, route);
        },
      ));
      _viewApp.add(ListTile(
        selected: _selectedDestination == 2,
        leading: SvgPicture.asset('assets/svg/hoja_reloj_gris.svg',
            color: const Color(0xff004172)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xff004172)),
        title: const Text(
          'Transmisiones realizadas',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            color: Color(0xff004172),
            fontWeight: FontWeight.w700,
          ),
        ),
        onTap: () {
          MaterialPageRoute route;
          route = MaterialPageRoute(
              builder: (BuildContext context) => notificacionIMPPage());
          Navigator.push(context, route);
        },
      ));
    }
  }

  // );
  //}
  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
