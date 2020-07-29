import 'package:flutter/material.dart';

class OptionsSearchWidget extends StatelessWidget {
  final Function searchUsers;
  final Function searchRepositories;

  const OptionsSearchWidget(
      {Key key, this.searchUsers, this.searchRepositories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Buscar por Usuarios'),
                onTap: searchUsers,
              ),
              ListTile(
                title: Text('Buscar por Repositorios'),
                onTap: searchRepositories,
              )
            ],
          ),
        ),
      ),
    );
  }
}
