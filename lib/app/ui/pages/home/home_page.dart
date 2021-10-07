import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tramipet/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:tramipet/app/ui/routes/routes.dart';

import 'package:tramipet/src/providers/menu_provider.dart';
import 'package:tramipet/src/utils/icono_string_util.dart';
import 'package:tramipet/src/widgets/Menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TramiPET v1.2.3'),
        backgroundColor: const Color(0xff43cbff),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff43cbff),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset('assets/tramipet.png'),
                  ),
                  const Text(
                    'Tramipet - Menu del alumno',
                    style: TextStyle(
                      fontFamily: 'Sansation_Light',
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil del alumno'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Solicitudes pedidas'),
              onTap: () {},
            ),
            const SizedBox(height: 450),
            CupertinoButton(
              color: Colors.blue,
              child: const Text("Salir"),
              onPressed: () async {
                await Get.i.find<AuthenticationRepository>().signOut();
                router.pushNamedAndRemoveUntil(Routes.LOGIN);
              },
            ),
          ],
        ),
      ),
      body: MenuPrincipal(),
    );
  }
}
