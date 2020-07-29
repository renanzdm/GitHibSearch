import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_perfil/app/modules/home/widgets/app_bar/custom_app_bar.dart';
import 'package:github_perfil/app/shared/utils/custom_exception.dart';
import 'package:mobx/mobx.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    reaction((_) => controller.failure, (_) {
      controller.failure.map((failure) {
        String message;
        if (failure is Failure) message = 'Não há mais resultados para exibir';

        EdgeAlert.show(context,
            title: 'Erro',
            description: message,
            gravity: EdgeAlert.TOP,
            duration: EdgeAlert.LENGTH_LONG,
            backgroundColor: Colors.red,
            icon: Icons.error);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 80,
          onSubmited: (String value) {
            controller.changeValueQuery(value);
            controller.showOptions(context);
          },
        ),
        body: Container(
          child: Observer(
            builder: (_) {
              switch (controller.optionSelected) {
                case OptionSelected.users:
                  return Container(
                    child: NotificationListener<ScrollNotification>(
                      // ignore: missing_return
                      onNotification: (ScrollNotification scrollInfo) {
                        if (!controller.isLoading &&
                            scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent) {
                          controller.nextResultsUsers();
                          controller.isLoading = true;
                        }
                      },
                      child: ListView.builder(
                        itemCount: controller?.listUsers?.length,
                        itemBuilder: (context, index) {
                          var model = controller?.listUsers[index];
                          return ListTile(
                            title: Text("$index${model?.login}"),
                          );
                        },
                      ),
                    ),
                  );

                  break;
                case OptionSelected.repositories:
                  return Container(
                      child: NotificationListener<ScrollNotification>(
                    // ignore: missing_return
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {}
                    },
                    child: ListView.builder(
                      itemCount: controller?.listRepositories?.length,
                      itemBuilder: (context, index) {
                        var model = controller.listRepositories[index];
                        return ListTile(
                          title: Text(model.name),
                        );
                      },
                    ),
                  ));
                  break;
                default:
                  return Container(
                    child: FlutterLogo(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
