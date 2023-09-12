package com.example.free_wallpaper

import android.content.Context
import android.os.Build
import android.widget.Toast

class ToastWidget {
    fun showSuccessToastWidget(context: Context) {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            val toast =
                Toast.makeText(context, "Wallpaper Changed Successfully", Toast.LENGTH_SHORT)
            toast.setGravity(2,20,100)
            toast.show()
        }
    }
}