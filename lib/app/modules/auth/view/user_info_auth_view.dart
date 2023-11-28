
import 'package:flutter/material.dart';

class UserInfoAuthView extends StatelessWidget {
  const UserInfoAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('User Info'),
      // ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 200
              ),
              child: FloatingActionButton.extended(
                elevation: 2,
                onPressed: () {},
                label: Text('Sign out'),
                backgroundColor: Colors.black,


              ),
            )
          ],
        ),
      ),
    );
  }
}