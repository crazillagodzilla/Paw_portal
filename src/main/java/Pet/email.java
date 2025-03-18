package Pet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Properties;

@WebServlet("/email")
public class email extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String name = request.getParameter("name");
        String recipient = request.getParameter("email");
        String subject = request.getParameter("subject");
        String body = request.getParameter("message");
        //System.setProperty("javax.net.ssl.trustStore", "C:/Users/ryrep/.p2/pool/plugins/org.eclipse.justj.openjdk.hotspot.jre.full.win32.x86_64_17.0.10.v20240120-1143/jre/lib/security/cacerts");
        // Set up properties for the mail session
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        
        // Create a session
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("ryrepen9631@gmail.com", "pork#850");
            }
        });

        try {
            // Create a MimeMessage
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("ryrepen9631@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            message.setText(name);
            message.setSubject(subject);
            message.setText(body);
            session.setDebug(true);
            // Send the message
            Transport.send(message);
            
            response.getWriter().println("Email sent successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println(System.getProperty("javax.net.ssl.trustStore"));
            response.getWriter().println("Error sending email: " + e.getMessage());
        }
    }
}
