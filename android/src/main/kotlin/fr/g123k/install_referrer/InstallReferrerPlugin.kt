package fr.g123k.install_referrer

import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/** InstallReferrerPlugin */
class InstallReferrerPlugin : FlutterPlugin, InstallReferrerInternalAPI {

    var context: Context? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        InstallReferrerInternalAPI.setUp(
            flutterPluginBinding.binaryMessenger,
            this
        )

        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        InstallReferrerInternalAPI.setUp(
            binding.binaryMessenger,
            null
        )

        context = null
    }

    override fun detectReferrer(callback: (Result<IRInstallationReferrer>) -> Unit) {
        context!!.run {
            when (val installerPackageName = packageManager.getInstallerPackageName(packageName)) {
                null -> callback(
                    Result.success(
                        generateResult(
                            type = IRInstallationType.DEBUG,
                            platform = IRInstallationPlatform.MANUALLY,
                        )
                    )
                )

                "com.amazon" -> callback(
                    Result.success(
                        generateResult(
                            type = IRInstallationType.APP_STORE,
                            platform = IRInstallationPlatform.AMAZON_APP_STORE,
                        )
                    )
                )

                "com.android.vending" -> callback(
                    Result.success(
                        generateResult(
                            type = IRInstallationType.APP_STORE,
                            platform = IRInstallationPlatform.GOOGLE_PLAY,
                        )
                    )
                )

                "com.huawei.appmarket" -> callback(
                    Result.success(
                        generateResult(
                            type = IRInstallationType.APP_STORE,
                            platform = IRInstallationPlatform.HUAWEI_APP_GALLERY,
                        )
                    )
                )

                "com.sec.android.app.samsungapps" -> callback(
                    Result.success(
                        generateResult(
                            type = IRInstallationType.APP_STORE,
                            platform = IRInstallationPlatform.SAMSUNG_APP_SHOP,
                        )
                    )
                )

                "com.oppo.market" -> callback(
                    Result.success(
                        generateResult(
                            type = IRInstallationType.APP_STORE,
                            platform = IRInstallationPlatform.OPPO_APP_MARKET,
                        )
                    )
                )

                "com.vivo.appstore" -> callback(
                    Result.success(
                        generateResult(
                            type = IRInstallationType.APP_STORE,
                            platform = IRInstallationPlatform.VIVO_APP_STORE,
                        )
                    )
                )

                "com.xiaomi.mipicks" -> callback(
                    Result.success(
                        generateResult(
                            type = IRInstallationType.APP_STORE,
                            platform = IRInstallationPlatform.XIAOMI_APP_STORE,
                        )
                    )
                )

                "com.google.android.packageinstaller" -> callback(
                    Result.success(
                        generateResult(
                            type = IRInstallationType.UNKNOWN,
                            platform = IRInstallationPlatform.MANUALLY,
                        )
                    )
                )

                else -> callback(
                    Result.failure(Exception("Unknown installer $installerPackageName"))
                )
            }

        }

    }

    private fun generateResult(
        type: IRInstallationType,
        platform: IRInstallationPlatform
    ): IRInstallationReferrer {
        return IRInstallationReferrer(
            type = type,
            installationPlatform = platform,
            packageName = context!!.packageName,
            platform = IRPlatform.ANDROID
        )
    }
}
