// import 'app_logger.dart';

// class AppLoggerImpl extends AppLogger {
//   /// constructor
//   AppLoggerImpl(
//     this._logger, {
//     FirebaseCrashlytics? crashlytics,
//   }) {
//     _crashlytics = crashlytics;
//   }

//   final Logger _logger;
//   FirebaseCrashlytics? _crashlytics;

//   @override
//   void log(
//     data, {
//     LogLevel logLevel = LogLevel.debug,
//     StackTrace? trace,
//     bool localOnly = false,
//   }) {
//     switch (logLevel) {
//       case LogLevel.info:
//         _logger.i(data);
//         break;
//       case LogLevel.warning:
//         _logger.w(data);
//         break;
//       case LogLevel.error:
//         _logger.e(data, [data, trace]);
//         break;
//       default:
//         _logger.d(data);
//     }

//     if (localOnly) return;

//     switch (logLevel) {
//       case LogLevel.error:
//         _crashlytics?.recordError(data, trace);
//         break;
//       case LogLevel.info:
//       case LogLevel.warning:
//       default:
//         // do nothing here
//         break;
//     }
//   }

//   @override
//   void debug(data) {
//     log(data, logLevel: LogLevel.debug, localOnly: true);
//   }

//   @override
//   void error(data, {localOnly = false, StackTrace? trace}) {
//     log(data, logLevel: LogLevel.error, trace: trace, localOnly: localOnly);
//   }

//   @override
//   void exception(Exception exception, {localOnly = false}) {
//     error(exception, localOnly: localOnly);
//   }

//   @override
//   void info(data, {localOnly = true}) {
//     log(data, logLevel: LogLevel.info, localOnly: localOnly);
//   }

//   @override
//   void warning(data, {localOnly = true}) {
//     log(data, logLevel: LogLevel.warning, localOnly: localOnly);
//   }

//   @override
//   void onFlutterError(FlutterErrorDetails fError) {
//     _crashlytics?.recordFlutterError(fError);
//   }
// }
