import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'authenticate.dart';
import 'models/app_user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AppUser?>(context);
    print(user);

    return const Authenticate();
  }
}