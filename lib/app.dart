// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';



// class ZirclyApp extends ConsumerStatefulWidget {
//   const ZirclyApp({super.key});

//   @override
//   ConsumerState<ZirclyApp> createState() => _MyAppState();
// }

// class _MyAppState extends ConsumerState<ZirclyApp> {
//   bool isDeviceSupport = false;

//   @override
//   Widget build(BuildContext context) {
//     final goRouter = ref.watch(goRouterProvider);

//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarBrightness: Brightness.light,
//       statusBarIconBrightness: Brightness.dark,
//     ));

//     return MaterialApp.router(
//       routerConfig: goRouter,
//       debugShowCheckedModeBanner: false,
//       restorationScopeId: 'app',
//       onGenerateTitle: (BuildContext context) => 'Dckap',
//       theme: ThemeData(
//         pageTransitionsTheme: const PageTransitionsTheme(builders: {
//           TargetPlatform.android: CupertinoPageTransitionsBuilder(),
//           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//         }),
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         hoverColor: Colors.transparent,
//       ),
//     );
//   }
// }
