// import 'dart:async';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:midzilla/core/constants/app_strings.dart';
// import 'package:midzilla/core/services/app_keys.dart';
//
// class NoInternetOverlay {
//   static final Connectivity _connectivity = Connectivity();
//   static StreamSubscription<List<ConnectivityResult>>? _streamSubscription;
//   static bool _isSnackbarVisible = false;
//
//   static void init() {
//     _streamSubscription ??= _connectivity.onConnectivityChanged.listen((event) {
//       final hasNoConnection = event.any((result) => result == ConnectivityResult.none);
//
//       if (hasNoConnection) {
//         _showNoInternetSnackbar();
//       } else {
//         _hideSnackbar();
//         _showInternetRestoredSnackbar();
//       }
//     });
//   }
//
//   static void _showNoInternetSnackbar() {
//     if (_isSnackbarVisible) return;
//
//     final context = AppKeys.noInternetConnectionKey.currentContext;
//     if (context == null) return;
//
//     _isSnackbarVisible = true;
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: [
//             const Icon(Icons.wifi_off, color: Colors.white),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Text(
//                 AppString.internetNotConnection.tr(),
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//         duration: const Duration(days: 1), // يختفي يدويًا
//         backgroundColor: Colors.red.shade700,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         margin: const EdgeInsets.all(16),
//         elevation: 6,
//       ),
//     );
//   }
//
//   static void _showInternetRestoredSnackbar() {
//     final context = AppKeys.noInternetConnectionKey.currentContext;
//     if (context == null) return;
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: const [
//             Icon(Icons.wifi, color: Colors.white),
//             SizedBox(width: 12),
//             Expanded(
//               child: Text("تم استعادة الاتصال بالإنترنت", style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//         duration: const Duration(seconds: 2), // يختفي تلقائيًا
//         backgroundColor: Colors.green,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         margin: const EdgeInsets.all(16),
//         elevation: 6,
//       ),
//     );
//   }
//
//   static void _hideSnackbar() {
//     if (!_isSnackbarVisible) return;
//
//     final context = AppKeys.noInternetConnectionKey.currentContext;
//     if (context == null) return;
//
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     _isSnackbarVisible = false;
//   }
//
//   static void dispose() {
//     _streamSubscription?.cancel();
//     _streamSubscription = null;
//   }
// }
