/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection_pkg;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Palak
 */
public class Connection {
    static java.sql.Connection c=null;
    static Statement s;
       private static final String Driver="com.mysql.jdbc.Driver";
    
   public static void creatConn() throws SQLException, ClassNotFoundException
 {
        Class.forName(Driver);
        c=DriverManager.getConnection("jdbc:mysql://localhost:3306/financial_adviser", "root", "78652");
        //System.out.println("created");
 } 
   
   
   public static void executequary(String q1) throws SQLException
   {
            PreparedStatement ps=(PreparedStatement) c.prepareStatement(q1);
                    ps.executeUpdate();
                    
   }
   
   public static ResultSet executeselectquary(String q1) throws SQLException
   {
         s=c.createStatement(); 
        ResultSet rs=s.executeQuery(q1);
        return  rs;
   }
   
   public static void closeConn()
 {
        
         try {
             c.close();
         } catch (SQLException ex) {
             Logger.getLogger(Connection.class.getName()).log(Level.SEVERE, null, ex);
         }
  }
//   
//   public static void main(String args[]) 
//   {
//        try {
//            Connection.creatConn();
//            //List<Userbean> lst=Connection.executeselectquary("select * from register");
//            Connection.closeConn();
//                            System.out.println("-----------------------------------------------------------------------------   ");
//                            System.out.println("Name\tEmail\t\tConatact\tcity\t\tDOB");
//                            System.out.println("-----------------------------------------------------------------------------   ");
//
////            for (Userbean us:lst)
////            {
////                System.out.println(us.getNm()+"\t"+us.getMail()+"\t"+us.getCno()+"\t"+us.getCity()+"\t"+us.getDate());
////            }
//            
//        } catch (SQLException ex) {
//            Logger.getLogger(Connection.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(Connection.class.getName()).log(Level.SEVERE, null, ex);
//        }
//       
//   
//  
//   
//   }
}
