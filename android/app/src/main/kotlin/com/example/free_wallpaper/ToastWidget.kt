package com.example.free_wallpaper

import android.content.Context
import android.os.Build
import android.widget.Toast

class SuccessToastWidget {

    fun showSuccessToastWidget(context: Context) {


        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {

            Toast.makeText(context, "Wallpaper Changed Successfully", Toast.LENGTH_SHORT).show()
        }
    }
}

class NotSuccessToastWidget{

    fun showUnSuccessToastWidget(context: Context){

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R){
            Toast.makeText(context, "There is an Error Wallpaper Not Changed", Toast.LENGTH_SHORT).show()
        }
    }
}