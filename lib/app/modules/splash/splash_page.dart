import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_perfil/app/modules/splash/splash_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/dots/dots_widget.dart';

class SplashPage extends StatefulWidget {
  final String title;

  const SplashPage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController>
    with SingleTickerProviderStateMixin {
  //use 'controller' variable to access controller

  List<Widget> pages = [
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text.rich(
            TextSpan(
              style: GoogleFonts.staatliches(
                  fontSize: 24, color: Colors.grey.shade700),
              text: 'Encontre repositórios,\n',
              children: [
                TextSpan(text: 'Perfis, Seguidores\n'),
                TextSpan(
                  text: 'e mais',
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/page1.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text.rich(
            TextSpan(
              style: GoogleFonts.staatliches(
                  fontSize: 24, color: Colors.grey.shade700),
              text: 'Comodidade de,\n',
              children: [
                TextSpan(text: 'ter em suas mãos \n'),
                TextSpan(
                  text: 'as informações do Github',
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/page2.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text.rich(
            TextSpan(
              style: GoogleFonts.staatliches(
                  fontSize: 24, color: Colors.grey.shade700),
              text: 'Acesse em qualquer,\n',
              children: [
                TextSpan(text: 'lugar sem precisar\n'),
                TextSpan(
                  text: 'do seu computador',
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/page3.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Container(
            height: constraints.maxHeight * 0.95,
            width: constraints.maxWidth,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: PageView(
                      pageSnapping: true,
                      onPageChanged: (selectedPage) {
                        controller.changePage(selectedPage);
                      },
                      children: pages),
                ),
                Observer(
                  builder: (context) {
                    return Visibility(
                      visible: controller.currentPage != pages.length - 1,
                      child: DotsWidget(pages.length, controller.currentPage),
                      replacement: FlatButton(
                        onPressed: () {
                          Modular.to.pushReplacementNamed('/home');
                        },
                        child: Text(
                          'Começar',
                          style: GoogleFonts.staatliches(
                              fontSize: 20, color: Colors.grey.shade700),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
