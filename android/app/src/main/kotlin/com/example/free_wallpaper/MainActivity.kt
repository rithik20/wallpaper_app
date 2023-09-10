package com.example.free_wallpaper

import android.app.WallpaperManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.InputStream
import java.net.HttpURLConnection
import java.net.URL
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException
import kotlin.coroutines.suspendCoroutine
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class MainActivity : FlutterActivity() {
    private val channel = "wallpaper"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channel
        ).setMethodCallHandler { call, result ->
            // This method is invoked on the main thread.
            // TODO
            if (call.method == "change_wallpaper") {
                /*getting the "imageUrl" key's value from the "change_wallpaper"
                * invokeMethod().the "imageUrl" key's value holds the URL of the Image in the Flutter side
                * */
                val imageUrl: String? = call.argument<String>("imageUrl")
                if (imageUrl != null) {

                    CoroutineScope(Dispatchers.Main).launch {
                        try {
                            val bitmapWallpaper = withContext(Dispatchers.IO) {

                                /*passing the imageUrl variable that holds the "imageUrl" key's value
                                * to the getImageUrl()*/
                                getImageBitmap(imageUrl)
                            }
                            changeWallpaper(bitmapWallpaper)
                            result.success(true)
                        } catch (e: Exception) {
                            result.error("SET_WALLPAPER_ERROR", "Failed to set wallpaper", null)
                        }
                    }
                } else {
                    result.error("SET_WALLPAPER_ERROR", "Failed to set wallpaper", null)
                }

            } else {
                result.notImplemented()
            }
        }
    }

    //this method will return the BitMap object of the image
    private suspend fun getImageBitmap(imageUrl: String): Bitmap = withContext(Dispatchers.IO) {
        return@withContext suspendCoroutine { continuation ->
            try {
                val url = URL(imageUrl)
                val netWorking: HttpURLConnection = url.openConnection() as HttpURLConnection
                netWorking.connect()
                val inputStream: InputStream = netWorking.inputStream
                val bitmap = BitmapFactory.decodeStream(inputStream)
                continuation.resume(bitmap)
            } catch (e: Exception) {
                continuation.resumeWithException(e)
            }
        }
    }

    //this method will set The Wallpaper
    private fun changeWallpaper(bitmap: Bitmap) {
        if (VERSION.SDK_INT >= VERSION_CODES.ECLAIR) {
            //creating object for WallpaperManager class
            val wallpaperManager = WallpaperManager.getInstance(this)
            try {
                /*using the setBitmap() method in the WallpaperManager class to
                * change the Wallpaper using the BitMap returned by the getImageBitmap() method*/
                wallpaperManager.setBitmap(bitmap)
            } catch (e: Exception) {

                throw RuntimeException("Failed ${e.message}");
            }
        }
    }
}
