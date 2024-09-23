#! /usr/bin/python3

import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

smtp_server = 'smtp.gmail.com'
sender_email = 'mckeags7@gmail.com'
receiver_email = 'adrian.stringer@withintelligence.com' #'recipent@example.com'
password = 'my_password'

message = MIMEMultipart()
message['From'] = sender_email
message['To'] = receiver_email
message['Subject'] = 'On Holiday'

body = 'Hello, I am currently out of the office and unable to respond to emails promptly.'
message.attach(MIMEText(body, 'plain'))

with smtplib.SMTP(smtp_server, 587) as server:
  server.starttls()
  server.login(sender_email, password)
  server.sendmail(sender_email, receiver_email, message.as_string())
  
