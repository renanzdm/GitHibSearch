import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Function onSubmited;

  const CustomAppBar({Key key, this.height, this.onSubmited}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: height,
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.deepPurpleAccent),
        child: TextField(
          onSubmitted: onSubmited,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Buscar',
            hintStyle: TextStyle(fontWeight: FontWeight.w300),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
