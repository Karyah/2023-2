import { View, Image, Pressable, Text, StyleSheet, SafeAreaView} from 'react-native';
import Constants from 'expo-constants';

export default function Home({navigation}){
    return(
      <SafeAreaView>
        <View style={styles.div}>
            
            <Text style={{fontWeight:'bold'}}>MONKEY D. LUFFY</Text>
            <Image style={{width:'20rem', height:'20rem', margin:'0.5rem'}} source={require('../assets/foto.jpg')}></Image>

            <Pressable style={styles.botao} onPress={navigation.navigate('MinhasTarefa')}>
                <Text style={{fontWeight:'bold'}}>Minhas Tarefas</Text>
            </Pressable>

            <Pressable style={styles.botao} onPress={navigation.navigate('AdicionarTarefa')}>
                <Text style={{fontWeight:'bold'}}>Adicionar Tarefas</Text>
            </Pressable>

        </View>
        </SafeAreaView>
    );
}

const styles = StyleSheet.create({
  
    div: {
        marginTop:'0.8rem',
        flex:1,
        paddingTop:Constants.statusBarHeight,
        alignItens:'space-around',
        justifyContent:'center',
        textAlign:'center',
    },
    botao:{
      margin:'1rem', 
      padding:'0.5rem',
      border:'solid',
      borderColor: 'black',
      borderRadius:10
    }

}) 