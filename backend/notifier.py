import smtplib
from email.message import EmailMessage
import os
import socket

def send_email(to_email, subject, message):
    EMAIL = os.getenv("SMTP_EMAIL") or os.getenv("EMAIL")
    PASSWORD = os.getenv("SMTP_PASSWORD") or os.getenv("PASSWORD")
    SMTP_HOST = os.getenv("SMTP_HOST", "smtp.gmail.com")
    SMTP_PORT = int(os.getenv("SMTP_PORT", "465"))
    SMTP_TIMEOUT = float(os.getenv("SMTP_TIMEOUT", "5"))

    if not EMAIL or not PASSWORD:
        print("❌ EMAIL FAILED: missing SMTP credentials. Set SMTP_EMAIL and SMTP_PASSWORD (or EMAIL/PASSWORD).")
        return False

    msg = EmailMessage()
    msg["From"] = EMAIL
    msg["To"] = to_email
    msg["Subject"] = subject
    msg.set_content(message)

    socket.setdefaulttimeout(SMTP_TIMEOUT)
    
    try:
        with smtplib.SMTP_SSL(SMTP_HOST, SMTP_PORT, timeout=SMTP_TIMEOUT) as smtp:
            smtp.login(EMAIL, PASSWORD)
            smtp.send_message(msg)
        print("✅ EMAIL SENT TO:", to_email)
        return True
    except Exception as e:
        print(f"❌ EMAIL FAILED TO: {to_email} - {e}")
        return False
