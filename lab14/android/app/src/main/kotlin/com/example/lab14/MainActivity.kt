package com.example.lab14

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.widget.Toast

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.lab14/message"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getGreeting") {
                Toast.makeText(context, "Привіт з нативного коду Android!", Toast.LENGTH_LONG).show()

                result.success("Lab14 Done")
            } else {
                result.notImplemented()
            }
        }
    }
}