function config(id){

    window.location ='form_submit/user_config.jsp?id='+id;

};

function atualizarProduto(id){

    window.location ='editarproduto.jsp?id='+id;

};

 function excluirProduto(id){
    if ( confirm('Deseja excluir o produto de id : '+id+' ?') ) {
        window.location = 'actions/prod_delete.jsp?id='+id;
    }
};


function atualizarPeca(id){
                
    window.location ='editarpeca.jsp?id='+id;

};

 function excluirPeca(id){
    if ( confirm('Deseja excluir a peça de id : '+id+' ?') ) {
        window.location = 'actions/peca_delete.jsp?id='+id;
    }
};


 function atualizarCliente(id){
                
    window.location ='editarcliente.jsp?id='+id;

};

 function excluirCliente(id){
    if ( confirm('Tem certeza que deseja deletar o cliente de id : '+id+' ?') ) {
        window.location = 'actions/cli_delete.jsp?id='+id;
    }
};