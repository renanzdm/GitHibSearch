import 'package:flutter_modular/flutter_modular.dart';
import 'details_user_page.dart';

class DetailUserModule extends ChildModule {
  @override
  List<Bind> get binds => [
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DetailUserPage(
          model: args.data,
         
        )),
      ];

  static Inject get to => Inject<DetailUserModule>.of();
}
