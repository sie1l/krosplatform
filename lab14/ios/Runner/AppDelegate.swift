import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // 1. Отримуємо контролер Flutter
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

    // 2. Створюємо канал з унікальним ім'ям "com.example.lab14/message"
    let messageChannel = FlutterMethodChannel(name: "com.example.lab14/message",
                                              binaryMessenger: controller.binaryMessenger)

    // 3. Слухаємо виклики
    messageChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Перевіряємо, чи викликали метод "getGreeting"
      if call.method == "getGreeting" {
        // Повертаємо статичну стрічку згідно варіанту
        result("Hi, Mom!")
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}