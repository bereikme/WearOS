
package com.example.wearosmotivationapp

import android.graphics.Color
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.wear.widget.BoxInsetLayout
import android.widget.TextView
import android.view.Gravity
import android.widget.FrameLayout

class MainActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Maak een BoxInsetLayout om de content binnen de randen van het scherm te centreren
        val layout = BoxInsetLayout(this)
        layout.setBackgroundColor(Color.parseColor("#FFCCCB")) // Zachtroze achtergrond

        // Maak een TextView voor de boodschap
        val textView = TextView(this).apply {
            text = "Je doet het goed. Ik ben trots op je"
            textSize = 18f
            setTextColor(Color.BLACK)
            gravity = Gravity.CENTER
        }

        // Voeg de TextView toe aan de layout en centreer hem
        val params = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )
        textView.layoutParams = params
        layout.addView(textView)

        // Stel de layout in als de content view van de activity
        setContentView(layout)
    }
}
