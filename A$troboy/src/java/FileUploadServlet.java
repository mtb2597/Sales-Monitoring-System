
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class FileUploadServlet extends HttpServlet {


    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String t=request.getParameter("know");
        Part part = request.getPart("file");//
        String fileName = extractFileName(part);//file name

  
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);

        dbFileName = UPLOAD_DIR + File.separator + fileName;
        part.write(savePath + File.separator);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jacky", "root", "1001");
            PreparedStatement pst = con.prepareStatement("insert into image_table(created_by,topic,filename,path) "+"values(?,?,?,?)");
           /* pst.setInt(1, id);*/
            pst.setString(1, firstName);
            pst.setString(2, lastName);
            pst.setString(3, dbFileName);
            pst.setString(4, savePath);
            pst.executeUpdate();
            out.println("<center><h1>Image inserted Succesfully......</h1></center>");
            if(t.equals("1")){
              response.sendRedirect("fdoc.jsp");   
            }else{
             response.sendRedirect("documents.jsp");    
            }
           

        } catch (Exception e) {
            out.println(e);
        }

    }
   

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
