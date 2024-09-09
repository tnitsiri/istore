import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  // ANCHOR Create state
  @override
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text(
          'A wiki ⓘ WI-kee) is a form of hypertext publication on the internet which is collaboratively edited and managed by its audience directly through a web browser. A typical wiki contains multiple pages that can either be edited by the public or limited to use within an organization for maintaining its internal knowledge base.',
        ),
      ),
    );
  }
}
