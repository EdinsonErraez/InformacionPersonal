

//Entity: ALLFCliente
//ALLFCliente. (Button) View: EstudianteALFForm
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONSCTFEES_254470 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = true;
    //executeCommandEventArgs.commons.serverParameters.ALLFCliente = true;
    
    console.log(entities.ALLFCliente.nombre + " " +entities.ALLFCliente.apellido)

};