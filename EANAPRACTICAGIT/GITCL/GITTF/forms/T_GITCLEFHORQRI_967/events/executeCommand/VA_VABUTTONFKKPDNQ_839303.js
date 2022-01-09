

//Entity: AFABCliente
//AFABCliente. (Button) View: EstudianteAFABForm
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONFKKPDNQ_839303 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = true;
    //executeCommandEventArgs.commons.serverParameters.AFABCliente = true;

    console.log(entities.AFABCliente.nombre + " " + entities.AFABCliente.apellido)
};