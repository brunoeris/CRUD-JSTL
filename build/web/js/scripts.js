function config(id){

    window.location ='actions/user_config.jsp?id='+id;

};

function atualizarProduto(id){

    window.location ='editarproduto.jsp?id='+id;

};

 function excluirProduto(id){
    if ( confirm('Tem certeza que deseja deletar o produto de id : '+id+' ?') ) {
        window.location = 'actions/deletarproduto.jsp?id='+id;
    }
};


function atualizarFuncionario(id){
                
    window.location ='editarfuncionario.jsp?id='+id;

};

 function excluirFuncionario(id){
    if ( confirm('Tem certeza que deseja deletar o produto de id : '+id+' ?') ) {
        window.location = 'actions/deletarfuncionario.jsp?id='+id;
    }
};


 function atualizarCliente(id){
                
    window.location ='editarcliente.jsp?id='+id;

};

 function excluirCliente(id){
    if ( confirm('Tem certeza que deseja deletar o produto de id : '+id+' ?') ) {
        window.location = 'actions/deletarcliente.jsp?id='+id;
    }
};