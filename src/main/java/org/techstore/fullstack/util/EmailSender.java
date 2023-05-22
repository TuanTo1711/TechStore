package org.techstore.fullstack.util;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.nio.charset.StandardCharsets;

@Component
@RequiredArgsConstructor
public class EmailSender {

    private static final int PORT = 4001;
    private static final String BASE_URL_REDIRECT
            = "http://localhost:%d/api/v1/auth/registration/confirm?token=".formatted(PORT);
    private final JavaMailSender mailSender;
    private final TemplateEngine templateEngine;

    @Value("${spring.mail.username}")
    private String senderEmail;

    @Async
    public void send(String toEmail, String token) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(
                message,
                MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                StandardCharsets.UTF_8.name()
        );

        // Load template and set variables
        Context context = new Context();
        context.setVariable("link", BASE_URL_REDIRECT + token);

        // Generate HTML toEmail content from the template
        String htmlContent = templateEngine.process("verification", context);

        helper.setTo(toEmail);
        helper.setSubject("Email Verification");
        helper.setFrom(senderEmail);
        helper.setText(htmlContent, true);

        // Send toEmail
        mailSender.send(message);
    }
}
