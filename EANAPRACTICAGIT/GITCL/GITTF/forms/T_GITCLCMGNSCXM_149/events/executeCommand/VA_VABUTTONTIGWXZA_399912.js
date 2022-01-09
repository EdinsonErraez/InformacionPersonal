

//Entity: EEEVCliente
//EEEVCliente. (Button) View: EstudianteEEEVForm
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONTIGWXZA_399912 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = true;
    //executeCommandEventArgs.commons.serverParameters.EEEVCliente = true;
    
    console.log('Nombre y Apellido: ' + entities.EEEVCliente.nombre + ' ' + entities.EEEVCliente.apellido);
};