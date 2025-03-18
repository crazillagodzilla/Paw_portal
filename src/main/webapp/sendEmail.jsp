<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.mail.*, javax.mail.internet.*, java.util.*" %>
<%@ page import="javax.mail.Session" %>
<html>
<head>
    <title>Send Email - Pawportal</title>
    
</head>
<body>
    <%
        // Get the form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Set the email properties
        String host = "smtp.gmail.com"; // Change this to your email provider
        String port = "587"; // Change this to your email provider's port
        String user = "ryrepen9631@gmail.com"; // Change this to your email address
        String pass = "jytv pltt rzbb nujf"; // Change this to your email password
        String to = "ryrepen9631@gmail.com"; // Change this to your email address
        String from = email; // Use the user's email as the from address
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust",host);

        // Create a session and a message
        Session ses= Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });
        ses.setDebug(true);
        MimeMessage msg = new MimeMessage(ses);
        msg.setFrom(new InternetAddress(from));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        msg.setSubject(subject);
        msg.setText("Name: " + name + "\nEmail: " + email + "\nMessage: " + message);

        // Send the email
        try {
            Transport.send(msg);
            out.println("<h1>Email sent successfully!</h1>");
        } catch (Exception e) {
        	
            out.println("<h1>Error sending email!</h1>");
            out.println(e.getMessage());
        }
    %>
</body>
</html>
