import 'package:flutter/material.dart';
import 'package:github_perfil/app/shared/models/git_user_model.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailUserPage extends StatelessWidget {
  final GitUserModel model;

  const DetailUserPage({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width:double.infinity,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300, width: 1)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                maxRadius: 80,
                backgroundImage: NetworkImage(model?.avatarUrl),
              ),
              Text(
                model.login,
                style: GoogleFonts.staatliches(fontSize: 24),
                textAlign: TextAlign.end,
              ),
            Row(
              children: <Widget>[
                Icon(Icons.person_pin),
                Text('Follower ${model}'),
              ],
            )
              
            ],
          ),
        ),
      ),
    );
  }
}
