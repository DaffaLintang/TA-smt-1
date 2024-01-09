/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tugasakhir.konveksi.sablon;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author Daffa Lintang
 */
public class Koneksi {
    public static Connection koneksi;

public static Connection getKoneksi(){
    if (koneksi == null){
     try {
            String url = "jdbc:mysql://localhost/konveksisablon01";
            String user = "root";
            String password = "admin";
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            koneksi = DriverManager.getConnection(url, user, password);
            System.out.println("Berhasil");
        } catch (SQLException e) {
            System.out.println(e);
        }   
    }
 return koneksi;
}
public static void main (String[] args){
    getKoneksi();
}
}
