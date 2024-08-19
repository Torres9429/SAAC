package mx.edu.utez.saac.utils;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseConnectionManager {
    private static final String JDBC_URL = "jdbc:mysql://18.205.106.95:3306/integradoradb";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Password123?";
    private static final HikariConfig config = new HikariConfig();
    private static final HikariDataSource dataSource;

    static {
        try { Class.forName("com.mysql.cj.jdbc.Driver"); }
        catch (ClassNotFoundException e) { throw new RuntimeException("Error", e); }
        config.setJdbcUrl(JDBC_URL);
        config.setUsername(USERNAME);
        config.setPassword(PASSWORD);
        // Ajustes del pool
        config.setMinimumIdle(500);
        config.setMaximumPoolSize(10000);
        config.setConnectionTimeout(30000); // 30 seconds
        dataSource = new HikariDataSource(config);
    }
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    private DatabaseConnectionManager() {
    // Private constructor to prevent instantiation
    }
}
