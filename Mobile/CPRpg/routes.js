import Home from '../CPRpg/pages/Home';
import MinhasTarefas from '../CPRpg/pages/MinhasTarefas';
import AdicionarTarefa from '../CPRpg/pages/AdicionarTarefa';
import { createNativeStackNavigator } from "@react-navigation/native-stack";

const Stack = createNativeStackNavigator;

const Routes = () => {
    return(
        <Stack.Navigator initialRouteName={'Home'}>

            <Stack.Screen name={'Home'} component={Home}/>
            <Stack.Screen name={'AdicionarTarefas'} component={AdicionarTarefa}/>
            <Stack.Screen name={'MinhasTarefas'} component={MinhasTarefas}/>
            
        </Stack.Navigator>
    )
}

export default Routes;