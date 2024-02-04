# Define SMTP server settings
$Username = $env:EMAIL_USERNAME
$Password = $env:EMAIL_PASSWORD
$SMTPServer = "smtp.example.com"
$Port = 587  # Update with the appropriate port number
$From = "your-email@example.com"
$To = "recipient@example.com"
$Subject = "Test Email"
$Body = "This is a test email from GitHub Actions."

# Send email using Send-MailMessage cmdlet
Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -Port $Port -Credential (New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username, (ConvertTo-SecureString -String $Password -AsPlainText -Force)) -UseSsl
