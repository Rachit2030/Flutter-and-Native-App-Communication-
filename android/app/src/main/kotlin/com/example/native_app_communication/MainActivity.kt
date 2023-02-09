package com.example.native_app_communication

import io.flutter.embedding.android.FlutterActivity
import android.content.*
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent



class MainActivity: FlutterActivity() {
    private val TEXT_CHANNEL = "material.dart/battery"
    private lateinit var channel : MethodChannel
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,TEXT_CHANNEL)

        channel.setMethodCallHandler {   call, result ->
            if (call.method == "getBatteryLevel"){
                val text = "HELLO ANDROID"
                result.success(text)
            }
        }

    }
}
