package com.example.free_wallpaper

import android.content.Context
import android.widget.Toast

class DownloadImageToDownloads {

    fun showWallpaperDownloadedToast(context: Context) {

        Toast.makeText(context, "Image Downloaded Successfully", Toast.LENGTH_SHORT).show()
    }

}
