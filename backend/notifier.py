import smtplib
from email.message import EmailMessage

def send_email(to_email, subject, message):
    EMAIL = "likhithakadavakolla@gmail.com"
    PASSWORD = "optthjciglohvspw"  # app password

    try:
        msg = EmailMessage()
        msg["From"] = EMAIL
        msg["To"] = to_email
        msg["Subject"] = subject
        msg.set_content(message)

        with smtplib.SMTP_SSL("smtp.gmail.com", 465) as smtp:
            smtp.login(EMAIL, PASSWORD)
            smtp.send_message(msg)

        print("EMAIL SENT TO:", to_email)

    except Exception as e:
        print("EMAIL ERROR:", e)
