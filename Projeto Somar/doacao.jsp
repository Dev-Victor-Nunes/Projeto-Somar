<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    try
    {
        // Criando variáveis e armazenando informações de doador
        String nome_doador     = request.getParameter("nome_doador");
        String tel_doador      = request.getParameter("tel_doador");
        String cpf             = request.getParameter("cpf");
        String valor           = request.getParameter("valor");
        String email_doador    = request.getParameter("email_doador");



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
      
       String sql_doacao = "INSERT INTO doacao (Nome_doador, tel_doador, Cpf, Valor, email_doador) values (?, ?, ?, ?, ?)";

       PreparedStatement stm_doacao = conexao.prepareStatement(sql_doacao);

       stm_doacao.setString(1, nome_doador);
       stm_doacao.setString(2, tel_doador);
       stm_doacao.setString(3, cpf);
       stm_doacao.setDouble(4, Double.parseDouble(valor));
       stm_doacao.setString(5, email_doador);
        
       stm_doacao.execute();
       stm_doacao.close();
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
            O Projeto Somar agradece pela sua solidariedade! <br>
            Sua doação irá ajudar muitas comunidades carentes.
        </h2>
        <br>
        <br>
        </div>
        <br><br>
        <br>
        <hr>
        <footer style=" text-align: center; margin-top: 10%; margin-bottom: 5%;">
        <a href="Doacao_Somar.html" style="text-decoration: none; color: black; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-size: x-large; border: solid 1px black; border-radius: 45px; padding: 5px;">Retornar a Página</a>
        </footer>
    </body>
    </html>

    <%
     

    }catch(Exception e) {
        out.print("<h2>Erro ao gravar os dados: " + e.getMessage() + "</h2>");
    }

%>