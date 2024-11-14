package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class produto extends conBd{
    private Connection conn;
    private int id;
    private String nome;
    private String tipo;
    private double valor;
    private int userid;
    public produto() throws Exception {
        // Get the connection object
        this.conn = conBd.getConnection();
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getnome() {
        return this.nome;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo() {
        return this.tipo;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public double getValor() {
        return this.valor;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public void setUserId(int userid) {
        this.userid = userid;
    }

    public int setUserId() {
        return this.userid;
    }	

    // Outros métodos da classe...

    public void save() throws SQLException {
        // Salvar o pedido no banco de dados
        String sql = "INSERT INTO produtos (produto_name, produto_type, produto_price, usuario_id) VALUES (?, ?, ?, ?)";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setString(1, this.nome);
        stmt.setString(2, this.tipo);
        stmt.setDouble(3, this.valor);
        stmt.setInt(4, this.userid);

        // Execute the statement
        stmt.executeUpdate();
    }

    public void update() throws SQLException {
        // Atualizar o pedido no banco de dados
        String sql = "UPDATE produtos SET nome = ?, tipo = ?, valor = ? WHERE produto_id = ?";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setString(1, this.nome);
        stmt.setString(2, this.tipo);
        stmt.setDouble(3, this.valor);
        stmt.setInt(4, this.id);

        // Execute the statement
        stmt.executeUpdate();
    }

    public void delete() throws SQLException {
        // Deletar o pedido no banco de dados
        String sql = "DELETE FROM produtos WHERE produto_id = (?)";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setInt(1, this.id);

        // Execute the statement
        stmt.executeUpdate();
    }

}
