<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    try {
        // Criando variáveis e armazenando informações
        String nome_voluntario  = request.getParameter("nome_voluntario") ;
        String tel_voluntario   = request.getParameter("tel_voluntario") ;
        String profissao        = request.getParameter("profissao") ;
        String email_voluntario = request.getParameter("email_voluntario") ;
        String chatV            = request.getParameter("mensagem") ;

        // Variáveis de acesso ao banco de dados.
        String database   = "projeto_somar";
        String enderecoBD = "jdbc:mysql://localhost:3306/" + database;
        String usuarioBD  = "root";
        String senhaBD    = "";

        // Driver
        String driver = "com.mysql.jdbc.Driver";

        // Carregando driver de comunicação com servidor.
        Class.forName(driver);

        // Conectando com Banco de Dados
        Connection conexao = DriverManager.getConnection(enderecoBD, usuarioBD, senhaBD);

        // Comandos para inserir dados
        String sql_voluntario = "INSERT INTO voluntario (Nome_voluntario, tel_voluntario, Profissao, email_voluntario, ChatV) values (?, ?, ?, ?, ?)";

        PreparedStatement stm_voluntario = conexao.prepareStatement(sql_voluntario);
        stm_voluntario.setString(1, nome_voluntario);
        stm_voluntario.setString(2, tel_voluntario);
        stm_voluntario.setString(3, profissao);
        stm_voluntario.setString(4, email_voluntario);
        stm_voluntario.setString(5, chatV);
        stm_voluntario.execute();
        stm_voluntario.close();


        %>

        <!DOCTYPE html>
        <html lang="pt-br">
        <head>
         <meta charset="UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <title>Projeto Somar</title>
         <style>
               *{
                 padding: 0;
                 margin: 0;
                }
        a:hover{
                background-color: #0F8767;
               }

    </style>
    </head>
    <bodys>

    <div style=" background-color:  lightgreen; ">
    <img src="./mídia/Logo_Somar.png" alt="Logo" class="logo" style=" display: block;
    margin: 0 auto;
    max-width: 100%;
    height: auto;">
    </div>
    <br>
    <hr>

    <div style="background-color: aliceblue;">
    <h1 style="text-align: center; margin-top: 100px;">Dados Gravados com Sucesso!</h1>
    <br>
    <br>

    <h2 style="text-align: center; font-size: xx-large;">
        O Projeto Somar agradece pela sua iniciativa! <br>
        Por favor, aguarde que retornaremos contato assim que possível.
    </h2>
    <br>
    <br>
    </div>
    <br><br>
    <br>
    <hr>
    <footer style=" text-align: center; margin-top: 10%; margin-bottom: 5%;">
    <a href="Voluntario_Somar.html" style="text-decoration: none; color: black; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-size: x-large; border: solid 1px black; border-radius: 45px; padding: 5px;">Retornar a Página</a>
    </footer>
</body>
</html>

        <%
    } catch (Exception e) {
        out.print("<h2>Erro ao gravar os dados: " + e.getMessage() + "</h2>");
        out.print("<br><br>") ;
        //out.print("<a href=voluntario.html>Voltar</a>") ;
    }
%>