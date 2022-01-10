

//Entity: NDQSCliente
//NDQSCliente. (Button) View: EstudianteNDQSForm
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONIFYZZCK_408256 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = true;
    console.log('Nombre y Apellido: ' + entities.NDQSCliente.nombre + " " + entities.NDQSCliente.apellido);
    //executeCommandEventArgs.commons.serverParameters.NDQSCliente = true;

};