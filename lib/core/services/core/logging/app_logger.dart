// enum LogLevel {
//   /// use this for general debug logs
//   debug,

//   /// use this for info logs
//   info,

//   /// use this for not so fatal logs
//   warning,

//   /// use this for logs that demand attention
//   error
// }

// /// Global logger for console & remote logging
// abstract class AppLogger {
//   /// this logs to the availabe console
//   void log(
//     dynamic data, {
//     StackTrace? trace,
//     LogLevel logLevel,
//     bool localOnly = false,
//   });

//   /// this logs errors with LogLevel: debug
//   void debug(dynamic data);

//   /// this logs errors with LogLevel: info
//   void info(dynamic data, {localOnly = true});

//   /// this logs errors with LogLevel: warning
//   void warning(dynamic data, {localOnly = true});

//   /// this logs errors with LogLevel: error
//   void error(
//     dynamic data, {
//     localOnly = false,
//     StackTrace trace,
//   });

//   /// this logs exceptions
//   void exception(
//     Exception exception, {
//     localOnly = false,
//   });

//   /// logs flutter errors
//   void onFlutterError(FlutterErrorDetails fError);
// }
