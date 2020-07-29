import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_perfil/app/shared/repositories/git_hub_search.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'widgets/app_bar/custom_app_bar_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => GitHubSearch(i.get())),
        Bind((i) => Dio()),
        Bind((i) => CustomAppBarController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
