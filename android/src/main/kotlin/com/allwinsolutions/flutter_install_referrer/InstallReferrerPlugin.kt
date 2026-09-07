package com.allwinsolutions.flutter_install_referrer

import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin

/** InstallReferrerPlugin */
class InstallReferrerPlugin : FlutterPlugin, InstallReferrerInternalAPI {

  var context: Context? = null

  override fun onAttachedToEngine(
      @NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
  ) {
    InstallReferrerInternalAPI.setUp(flutterPluginBinding.binaryMessenger, this)

    context = flutterPluginBinding.applicationContext
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    InstallReferrerInternalAPI.setUp(binding.binaryMessenger, null)

    context = null
  }

  override suspend fun detectReferrer(): IRInstallationReferrer =
      context!!.run {
        when (val installerPackageName = packageManager.getInstallerPackageName(packageName)) {
          null ->
              generateResult(
                  type = IRInstallationType.DEBUG,
                  platform = IRInstallationPlatform.MANUALLY,
              )

          "com.amazon" ->
              generateResult(
                  type = IRInstallationType.APP_STORE,
                  platform = IRInstallationPlatform.AMAZON_APP_STORE,
              )

          "com.android.vending" ->
              generateResult(
                  type = IRInstallationType.APP_STORE,
                  platform = IRInstallationPlatform.GOOGLE_PLAY,
              )

          "com.huawei.appmarket" ->
              generateResult(
                  type = IRInstallationType.APP_STORE,
                  platform = IRInstallationPlatform.HUAWEI_APP_GALLERY,
              )

          "com.sec.android.app.samsungapps" ->
              generateResult(
                  type = IRInstallationType.APP_STORE,
                  platform = IRInstallationPlatform.SAMSUNG_APP_SHOP,
              )

          "com.oppo.market" ->
              generateResult(
                  type = IRInstallationType.APP_STORE,
                  platform = IRInstallationPlatform.OPPO_APP_MARKET,
              )

          "com.vivo.appstore" ->
              generateResult(
                  type = IRInstallationType.APP_STORE,
                  platform = IRInstallationPlatform.VIVO_APP_STORE,
              )

          "com.xiaomi.mipicks" ->
              generateResult(
                  type = IRInstallationType.APP_STORE,
                  platform = IRInstallationPlatform.XIAOMI_APP_STORE,
              )

          "com.google.android.packageinstaller" ->
              generateResult(
                  type = IRInstallationType.UNKNOWN,
                  platform = IRInstallationPlatform.MANUALLY,
              )

          else -> throw Exception("Unknown installer $installerPackageName")
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
        platform = IRPlatform.ANDROID)
  }
}
