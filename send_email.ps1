$EmailFrom = "your_email@gmail.com"
$EmailTo = "recipient_email@gmail.com"
$Subject = "Test Email from GitHub Actions"
$Body = "This is a test email sent from GitHub Actions using PowerShell."
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$SMTPUsername = "your_email@gmail.com"
$SMTPPassword = "your_app_password" # Use your Gmail app password here

# Create email message
$Message = New-Object System.Net.Mail.MailMessage $EmailFrom, $EmailTo
$Message.Subject = $Subject
$Message.Body = $Body
$Message.IsBodyHTML = $true

# Configure SMTP client
$SMTPClient = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($SMTPUsername, $SMTPPassword)

# Send the email
try {
    $SMTPClient.Send($Message)
    Write-Output "Email sent successfully."
} catch {
    Write-Error "Failed to send email: $_.Exception.Message"
}