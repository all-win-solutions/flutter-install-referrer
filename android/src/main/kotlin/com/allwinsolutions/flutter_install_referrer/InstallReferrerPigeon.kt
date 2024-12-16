// Autogenerated from Pigeon (v22.6.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
@file:Suppress("UNCHECKED_CAST", "ArrayInDataClass")

package com.allwinsolutions.flutter_install_referrer

import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  return if (exception is FlutterError) {
    listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class FlutterError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()

enum class IRInstallationType(val raw: Int) {
  APP_STORE(0),
  TEST(1),
  DEBUG(2),
  UNKNOWN(3);

  companion object {
    fun ofRaw(raw: Int): IRInstallationType? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

enum class IRInstallationPlatform(val raw: Int) {
  APPLE_APP_STORE(0),
  APPLE_TESTFLIGHT(1),
  GOOGLE_PLAY(2),
  AMAZON_APP_STORE(3),
  HUAWEI_APP_GALLERY(4),
  OPPO_APP_MARKET(5),
  SAMSUNG_APP_SHOP(6),
  VIVO_APP_STORE(7),
  XIAOMI_APP_STORE(8),
  MANUALLY(9),
  UNKNOWN(10);

  companion object {
    fun ofRaw(raw: Int): IRInstallationPlatform? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

enum class IRPlatform(val raw: Int) {
  IOS(0),
  ANDROID(1);

  companion object {
    fun ofRaw(raw: Int): IRPlatform? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class IRInstallationReferrer (
  val type: IRInstallationType? = null,
  val installationPlatform: IRInstallationPlatform? = null,
  val platform: IRPlatform? = null,
  val packageName: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): IRInstallationReferrer {
      val type = pigeonVar_list[0] as IRInstallationType?
      val installationPlatform = pigeonVar_list[1] as IRInstallationPlatform?
      val platform = pigeonVar_list[2] as IRPlatform?
      val packageName = pigeonVar_list[3] as String?
      return IRInstallationReferrer(type, installationPlatform, platform, packageName)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      type,
      installationPlatform,
      platform,
      packageName,
    )
  }
}
private open class InstallReferrerPigeonPigeonCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      129.toByte() -> {
        return (readValue(buffer) as Long?)?.let {
          IRInstallationType.ofRaw(it.toInt())
        }
      }
      130.toByte() -> {
        return (readValue(buffer) as Long?)?.let {
          IRInstallationPlatform.ofRaw(it.toInt())
        }
      }
      131.toByte() -> {
        return (readValue(buffer) as Long?)?.let {
          IRPlatform.ofRaw(it.toInt())
        }
      }
      132.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          IRInstallationReferrer.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is IRInstallationType -> {
        stream.write(129)
        writeValue(stream, value.raw)
      }
      is IRInstallationPlatform -> {
        stream.write(130)
        writeValue(stream, value.raw)
      }
      is IRPlatform -> {
        stream.write(131)
        writeValue(stream, value.raw)
      }
      is IRInstallationReferrer -> {
        stream.write(132)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}


/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface InstallReferrerInternalAPI {
  fun detectReferrer(callback: (Result<IRInstallationReferrer>) -> Unit)

  companion object {
    /** The codec used by InstallReferrerInternalAPI. */
    val codec: MessageCodec<Any?> by lazy {
      InstallReferrerPigeonPigeonCodec()
    }
    /** Sets up an instance of `InstallReferrerInternalAPI` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: InstallReferrerInternalAPI?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.flutter_install_referrer.InstallReferrerInternalAPI.detectReferrer$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            api.detectReferrer{ result: Result<IRInstallationReferrer> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}