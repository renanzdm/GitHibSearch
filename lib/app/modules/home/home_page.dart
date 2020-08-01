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
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller?.listUsers?.length,
                              itemBuilder: (context, index) {
                                var model = controller?.listUsers[index];
                                return Card(
                                  child: ListTile(
                                    onTap: (){
                                      Modular.to.pushNamed('/details/',arguments: model);
                                    },
                                    title: Text("${model?.login}"),
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(model?.avatarUrl),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            height: controller.isLoading ? 50 : 0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                  Colors.deepPurpleAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                  break;
                case OptionSelected.repositories:
                  return Container(
                      child: NotificationListener<ScrollNotification>(
                    // ignore: missing_return
                    onNotification: (ScrollNotification scrollInfo) {
                      if (!controller.isLoading &&
                          scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                        controller.nextResultsRepositories();
                        controller.isLoading = true;
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller?.listRepositories?.length,
                            itemBuilder: (context, index) {
                              var model = controller.listRepositories[index];
                              return Card(
                                child: ListTile(
                                   onTap: (){
                                    },
                                  title: Text(model.name),
                                  leading: CircleAvatar(
                                    child:
                                        Text(model.stargazersCount.toString()),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          height: controller.isLoading ? 50 : 0,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation(Colors.deepPurpleAccent),
                          ),
                        ),
                      ],
                    ),
                  ));
                  break;
                case OptionSelected.none:
                  return Container();
                  break;

                default:
              }
            },
          ),
        ),
      ),
    );
  }
}
