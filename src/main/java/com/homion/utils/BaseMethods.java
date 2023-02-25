package com.homion.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

public class BaseMethods {
	
	private static final String FROM = "homionapp@gmail.com";

	public static int generateOTP() {
		Random rnd = new Random();
	    int otp = rnd.nextInt(999999);
	    otp = Integer.parseInt(String.format("%06d", otp));
	    System.out.println(otp);
		return otp;
	}
	
	public static void sendMail(String to, String subject, String text, JavaMailSender emailSender) throws Exception {
		MimeMessage message = emailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, "utf-8");
        helper.setFrom(FROM);
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(text, true);
        emailSender.send(message);
	}
	
	public static int sendVerificationMail(String to, String firstName, JavaMailSender emailSender) throws Exception {
		int otp = generateOTP();
		String subject = "Email Verificaton";
		String text = "<h3>Hi "+firstName+",</h3> <br> Thank you for registering on <b>Homion</b>. "
				+ "You need to verify your email before you start using homion. <br> <h2> OTP : "+otp+" </h2> <br> "
				+ "Thank you.";
		
		sendMail(to, subject, text, emailSender);
		return otp;
	}
	
	public static void sendChefRegistrationMail(String to, String firstName, JavaMailSender emailSender) throws Exception {
		String subject = "Registration Successful";
		String text = "<b>Thank you "+firstName+" for registraing on homion.</b> <br><br> Your request has been sent to admin for review. "
				+ "Kindly wait for the request to be accepted. We will update you through mail on your request status. "
				+ "<br><br> <b>- Homion Team</b>";
		sendMail(to, subject, text, emailSender);
	}
	
	public static void sendChefActivationMail(String firstName, String to, JavaMailSender emailSender) throws Exception {
	    String subject = "Status Activated!";
	    String text = "<h3>Hi "+ firstName +", </h3> Your status has been updated to <b> Active. </b>"
	        + "We are glad to tell you that you are now an active member of Homion. <br><br> "
	        + "Thank You, <br> "
	        + "Homion Team";
	    sendMail(to, subject, text, emailSender);
	}
	
	public static void sendChefRequestRejectanceMail(String firstName, String to, JavaMailSender emailSender) throws Exception {
		String subject = "Request Rejected!";
		String text = "<h3>Hi " + firstName +", </h3> Sorry your request has been <b>Rejected. </b> "
				+ "Please try again later. <br><br>"
				+ "Thank You, <br> "
				+ "Homion Team";
		sendMail(to, subject, text, emailSender);
	}
	
	public static void sendChefBlockedMail(String firstName, String to, JavaMailSender emailSender) throws Exception {
	    String subject = "Account Blocked!";
	    String text = "<h3>Hi " + firstName + ", </h3> Your account has been <b>Blocked</b> due to some reason.<br><br>"
	        + "Thank You, <br> "
	        + "Homion Team";
	    
	    sendMail(to, subject, text, emailSender);
	}
	
	public static int sendMailForPasswordReset(String to, String firstName, JavaMailSender emailSender) throws Exception {
	    int otp = generateOTP();
	    String subject = "Homion password reset instructions";
	    String text = "<h3>Hi "+firstName+",</h3> <br> As you have requested for reset password instructions, here they are : <br> "
	        + "Please use the below OTP to reset your password   <br> <h2> OTP : "+otp+" </h2> <br> "
	        + "Thank you.";
	    
	    sendMail(to, subject, text, emailSender);
	    return otp;
	  }
	
	public static String uploadImage(MultipartFile file, String folder, String chefId) throws Exception {
		Map<String, String> config = new HashMap<String, String>();
		config.put("cloud_name", "homioncloud");
		config.put("api_key", "818869983615671");
		config.put("api_secret", "YVflgRz8Qz3_BiqFfGAAT8nAsN4");
		Cloudinary cloudinary = new Cloudinary(config);
		@SuppressWarnings("rawtypes")
		Map uploadedFile = cloudinary.uploader().upload(file.getBytes(), ObjectUtils.asMap("folder", folder, "public_id", chefId));
		String imageURL= (String)uploadedFile.get("url");
		return imageURL;
	}
	
	public static void sendChefRequestRejectionMail(String firstName, String to, JavaMailSender emailSender) throws Exception {
	    String subject = "Request Rejected!";
	    String text = "<h3>Hi " + firstName +", </h3> Sorry your request has been <b>Rejected. </b> "
	        + "Please try again later. <br><br>"
	        + "Thank You, <br> "
	        + "Homion Team";
	    
	    sendMail(to, subject, text, emailSender);
	}
	
}
