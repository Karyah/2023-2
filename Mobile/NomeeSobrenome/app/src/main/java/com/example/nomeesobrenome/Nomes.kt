package com.example.nomeesobrenome

import kotlin.random.Random

data class Nomes(var nomes: List<String> = ArrayList<String>(),
                 var sobrenomes: List<String> = ArrayList<String>()){

    fun generateRandomName(): String {
        val randomName = Random.nextInt(nomes.size).let {nomes[it]}
        val randomSurname = Random.nextInt(sobrenomes.size).let {sobrenomes[it]}

        return "$randomName $randomSurname"
    }


}
