import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      mode: VRouterMode.history,
      routes: [
        VWidget(
          path: '/',
          widget: const Root(),
          stackedRoutes: [
            VWidget(
              path: '/first',
              widget: const First(),
              fullscreenDialog: true,
              stackedRoutes: [
                VWidget(
                  path: '/first/second',
                  widget: const Second(),
                  fullscreenDialog: true,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _pressed(context),
          child: const Text('Press'),
        ),
      ),
    );
  }

  void _pressed(BuildContext context) {
    context.vRouter.to('/first', queryParameters: {'X': 'true'});
  }
}

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _pressed(context),
          child: const Text('Press'),
        ),
      ),
    );
  }

  void _pressed(BuildContext context) {
    context.vRouter.to('/first/second');
  }
}

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Second'),
      ),
    );
  }
}
