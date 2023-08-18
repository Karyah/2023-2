package com.example.nomeesobrenome

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    private var generatedName = ""

    private var names = Nomes()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        names.nomes = listOf("Jonathan", "James", "Lucas")
        names.sobrenomes = listOf("Calleri", "Rodriguez", "Moura")


        Nomes2.addNome("Karen");
        Nomes2.addNome("Lucas");
        Nomes2.addNome("Rogério");
        Nomes2.addNome("Jefferson");

        Nomes2.addSobrenome("Lima")
        Nomes2.addSobrenome("Matos")
        Nomes2.addSobrenome("Barros")
        Nomes2.addSobrenome("Moura")

        val generateButton = findViewById<Button>(R.id.generateButton)
        generateButton.setOnClickListener() { generateRandomName() }

        val toAddActivity = findViewById<Button>(R.id.toAddActivity)
        toAddActivity.setOnClickListener(){
            goToActivityAddName()
        }


    }

    fun generateRandomName () {
        generatedName = Nomes2.generateRandomName()
        val nameText = findViewById<TextView>(R.id.nameText)
        nameText.text = generatedName
        findViewById<TextView>(R.id.initialText).text = getString(R.string.initial_message_success)
    }

    fun goToActivityAddName(){
        val intent = Intent(this, AddNameActivity::class.java)
        startActivity(intent)
    }


}