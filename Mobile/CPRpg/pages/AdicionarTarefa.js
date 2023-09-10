import { View, Text, StyleSheet, Pressable, TextInput, SafeAreaView} from 'react-native';
import { RadioButton } from 'react-native-paper';
import { useCallback, useState } from 'react';
import Constants from 'expo-constants';


export default function AdicionarTarefa ({navigation}){
    const [setTarefa, tarefa] = useState();
    const [setNome, nome] = useState('');
    const [setXp, xp] = useState('');
    const [setRecorrencia, recorrencia] = useState('');

    const cadastrar = ()=>{
        const result={
            "name": nome,
            "experience":xp,
            "period":recorrencia
        }

        setTarefa(result);
    }

    const request = useCallback(async () => {
        
        await fetch('http://localhost:8080/mission/create', {method: 'POST', mode: 'cors', headers: {
            'Acess-Control-Allow-Origin': '*',
            'Acess-Controll-Allow-Headers':'*',
            'Content-Type':'application/json'
        },
        body:JSON.stringify(tarefa)
        })
    }, [tarefa])

    seEffect(()=>{
        if(!tarefa) return;
        request()
    }, [tarefa])

    
    return(
        <SafeAreaView>
        <View style={styles.div}>
            <View style={styles.cabecalho}>
                <Pressable onPress={() => navigation.goBack()}></Pressable>
                <Text style={{fontWeight:'bold'}}>Adicionar</Text>
            </View>

            <View style={styles.container}>
                <View style={styles.itens}>
                    <Text style={{fontWeight:'bold'}}>Nome da Tarefa:</Text>
                    <TextInput style={styles.botao} onChangeText={setNome} value={nome}></TextInput>
                </View>

                <View style={styles.itens}>
                    <Text style={{fontWeight:'bold'}}>Experiência:</Text>
                    <TextInput style={styles.botao} keyboardType="numeric" onChangeText={setXp} value={xp}></TextInput>
                </View>

                <View style={styles.itens}>
                    <Text style={{fontWeight:'bold'}}>Recorrência:</Text>
                    <RadioButton.Group value={recorrencia} onValueChange={(value)=> setRecorrencia(value)}>
                      <RadioButton.Item label="Diária" value="Diaria"/>
                      <RadioButton.Item label="Semanal" value="Semanal"/>
                    </RadioButton.Group>
                    
                </View>
                
                <Pressable style={styles.botao} onPress={cadastrar}> <Text style={{fontWeight:'bold'}}> Adicionar </Text></Pressable>
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
        justifyContent:'center',
        
    },
    container:{
        alignItens:'center',
        justifyContent:'space-around',
    },
    itens:{margin: '10px'},
    botao:{
      margin:'1rem', 
      padding:'0.5rem',
      border:'solid',
      borderColor: 'black',
      textAlign:'center',
      borderRadius:10,

    }
})