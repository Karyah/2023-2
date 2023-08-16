package com.example.nomeesobrenome

import kotlin.random.Random

class Nomes2 {
    companion object{
        var nomes = emptyList<String>()
        var sobrenomes = emptyList<String>()

        fun addNome(nome: String){
            nomes += listOf(nome)
        }

        fun addSobrenome(sobrenome:String){
            sobrenomes += listOf(sobrenome)
        }

        fun generateRandomName(): String {
            val randomName = Random.nextInt(nomes.size).let {nomes[it]}
            val randomSurname = Random.nextInt(sobrenomes.size).let {sobrenomes[it]}

            return "$randomName $randomSurname"
        }

        fun containsNome(novoNome: String): Boolean{
            return nomes.contains(novoNome)
        }

        fun containsSobrenome(novoNome: String):Boolean{
            return nomes.contains(novoNome)
        }
    }

}