package com.example.free_wallpaper

import android.annotation.TargetApi
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build

class RequestRuntimePermission {

    @TargetApi(Build.VERSION_CODES.Q)
    fun checkPermission(context: Context): Boolean {

        var isPermissionGranted = false

        val check: Int = context.checkSelfPermission(
            android.Manifest.permission.WRITE_EXTERNAL_STORAGE
        )

        if (check == PackageManager.PERMISSION_GRANTED) {
            isPermissionGranted = true
        } else if (check == PackageManager.PERMISSION_DENIED) {
            isPermissionGranted = false
        }
        Activity().shouldShowRequestPermissionRationale(android.Manifest.permission.WRITE_EXTERNAL_STORAGE)
        return isPermissionGranted
    }

    @TargetApi(Build.VERSION_CODES.Q)
    fun requestRuntimePermission(context: Context) {
        if (!checkPermission(context)) {
            Activity().requestPermissions(
                arrayOf(
                    android.Manifest.permission.READ_EXTERNAL_STORAGE,
                    android.Manifest.permission.WRITE_EXTERNAL_STORAGE,
                    android.Manifest.permission.ACCESS_MEDIA_LOCATION
                ), 101
            )
            Activity().onRequestPermissionsResult(
                101, arrayOf(
                    android.Manifest.permission.READ_EXTERNAL_STORAGE,
                    android.Manifest.permission.WRITE_EXTERNAL_STORAGE,
                    android.Manifest.permission.ACCESS_MEDIA_LOCATION
                ), IntArray(PackageManager.PERMISSION_GRANTED)
            )

        }
    }
}