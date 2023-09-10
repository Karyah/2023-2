import { useEffect, useState } from 'react';
import { View, Pressable, Text, StyleSheet, SafeAreaView} from 'react-native';
import Constants from 'expo-constants';

export default function MinhasTarefas({navigation}){

    const [setTarefas, tarefas] = useState([])

    useEffect(() =>{
        fetch('http://localhost:8080/mision/get-all', {method: 'GET',
        headers:{
            Accept: 'application/json',
            'Content-Type':'application/json'
        }

    })
        .then(resposta => resposta.json())
        .then(json => {
            console.log(json)
            setTarefas(resposta)
        })

        .catch(()=>{
            Alert.alert('Deu Ruim')
        })
    })

    return(
      <SafeAreaView>
        <View style={styles.div}>
            <View style={styles.cabecalho}>
                <Pressable style={{backgroundColor:'pink'}} onPress={()=>navigation.goBack()}></Pressable>
                <Text style={{fontWeight:'bold'}}>Minhas Tarefas</Text>
            </View>

            <View>
              
            </View>
            
        </View>
        </SafeAreaView>
    )
}


const styles = StyleSheet.create({
  cabecalho:{
      margin:'2rem',
      textAlign:'center'
    },
    div: {
        flex:1,
        paddingTop:Constants.statusBarHeight,
    }
})