package com.example.nomeesobrenome

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast

class AddNameActivity : AppCompatActivity() {
    private var names = Nomes()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add_name)


        val addNameButton = findViewById<Button>(R.id.addNameButton)
        addNameButton.setOnClickListener() {
            addName(getNameInput())
            resetNameInput()
        }

        val addSurnameButton = findViewById<Button>(R.id.addSurnameButton)
        addSurnameButton.setOnClickListener() {
            addSurname(getNameInput())
            resetNameInput()
        }

        val goBack = findViewById<Button>(R.id.goBack)
        goBack.setOnClickListener(){
            goBack()
        }
    }


    fun addName (name: String) {
        if(Nomes2.containsNome(name))
            Toast.makeText(this, "Nome já inserido", Toast.LENGTH_SHORT).show();
        else
            Nomes2.addNome(name);
    }

    fun addSurname (surname: String) {
        if(Nomes2.containsSobrenome(surname))
            Toast.makeText(this, "Sobrenome já inserido", Toast.LENGTH_SHORT).show();
        else Nomes2.addSobrenome(surname);
    }

    fun getNameInput(): String {
        val nameInput = findViewById<EditText>(R.id.nameInput)
        return nameInput.text.toString()
    }

    fun resetNameInput() {
        val nameInput = findViewById<EditText>(R.id.nameInput)
        nameInput.setText("")
    }

    fun goBack(){
        finish();
    }
}