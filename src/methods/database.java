package methods;

import com.sun.deploy.util.SessionState;
import com.sun.net.httpserver.HttpServer;
import jdk.nashorn.internal.runtime.Debug;
import sun.net.httpserver.HttpServerImpl;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Properties;

public class database {
    private Connection con;
    private String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/mddb?characterEncoding=ISO-8859-9";//?characterEncoding=ISO-8859-9
    private Statement stm;
    private ResultSet resultSet = null;

    public database() {
        this.stm = connect();
    }

    public Statement connect() {
        try {
            Class.forName(driver).newInstance();
            System.out.println("JDBC surucu basari ile yüklendi.");
        } catch (Exception e) {
            System.out.println("JDBC surucu Yuklenemedi. Hata:" + e.getMessage());
            System.exit(0);
        }

        try {
            con = DriverManager.getConnection(url, "root", "root");
            System.out.println("baglandi");
        } catch (Exception e) {
            System.out.println("Veri Taban. Hata:" + e.getMessage());

        }
        try {
            stm = con.createStatement();
        } catch (Exception e) {
            System.out.println("Hata:" + e.getMessage());

        }

        return stm;
    }

    public String get_Value(String query, int index) {
        try {
            resultSet = stm.executeQuery(query);
            resultSet.next();
            return resultSet.getString(index).toString();
            /*finally {
                try {
                    resultSet.close();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }*/
        } catch (Exception e) {
            System.out.println("Hata:" + e.getMessage());
        }

        return null;
    }

    public int get_Value_Int(String query, int index) {
        try {
            resultSet = stm.executeQuery(query);
            resultSet.next();
            return resultSet.getInt(index);
        } catch (Exception e) {
            System.out.println("Hata:" + e.getMessage());
        }
        return -1;
    }

    public boolean get_Value_Bool(String query, int index) {
        try {
            resultSet = stm.executeQuery(query);
        } catch (Exception e) {
            System.out.println("Hata:" + e.getMessage());
        }
        try {
            return resultSet.getBoolean(index);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                resultSet.close();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

        return false;
    }

    public ResultSet get_List(String query) {
        try {
            resultSet = stm.executeQuery(query);
        } catch (Exception e) {
            System.out.println("Hata list:" + e.getMessage());
        }
        return resultSet;
    }

    boolean status = false;

    public boolean set_Command(String query) {
        try {
            stm.execute(query);
            return true;
        } catch (Exception e) {
            System.out.println("Hata:" + e.getMessage());
        }
        return false;
    }

    public boolean Login(String table, String username, String password) {
        int ID = get_Value_Int("select id from mddb." + table + " where username='" + username + "' and password='" + password + "'", 1);
        if (ID > 0) {
            return true;
        } else
            return false;
    }

    public int get_Account_ID(String table, String username, String password) {
        int ID = get_Value_Int("select id from mddb." + table + " where username='" + username + "' and password='" + password + "'", 1);
        if (ID > 0) {
            return ID;
        } else
            return -1;
    }

    public String get_Date() {
        java.util.Date dNow = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(dNow);
        return date;
    }

    public String get_Date_File_Name() {
        java.util.Date dNow = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String date = sdf.format(dNow);
        System.out.println("dsya:" + date);
        return date + ".pdf";
    }

    public void auto_Mail() {
        try {
            ResultSet rs = get_List("call mddb.sp_asama_2();");
            String mesaj = "Sayın #; Hakemliğini kabul etmiş olduğunuz @ adlı makalenizin sonuç raporunu yüklemeniz için Bir haftanız kalmıştır. Lütfen değerlendirmenizi yapın maili gönderilecektir";
            while (rs.next()) {
                String id = rs.getString("hakem_ID");
                String baslik = rs.getString("baslik");
                String ad_soyad = rs.getString("hakem_ad_soyad");
                String mail = rs.getString("eposta");
                String aciklama = mesaj.replace("#", ad_soyad).replace("@", baslik);

                send_Mail2(mail, aciklama);
            }
        } catch (Exception e) {
        }
    }

    public void send_Mail2(String to, String mesaj) {
        final String username = "email@gmail.com";
        final String password = "şifre";
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("biseyler@bisey.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Hakem Atama Sistemi Bilgilendirme");
            message.setText(mesaj);
            Transport.send(message);

            System.out.println("MAIL: TRUE");

        } catch (MessagingException ex) {
            System.out.println("MAIL: false");
            System.out.println("MAIL: "+ex.getMessage());
            throw new RuntimeException(ex);
        }
    }
}
