$EmailFrom = "narender5t9.devops@gmail.com"
$EmailTo = "narender6t9.devops@gmail.com"
$Subject = "Test Email from GitHub Actions"
$Body = "This is a test email sent from GitHub Actions using PowerShell."
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$SMTPUsername = "narender5t9.devops@gmail.com"
$SMTPPassword = "Dysc44pks12" # Use your Gmail app password here

# Create email message
$Message = New-Object System.Net.Mail.MailMessage $EmailFrom, $EmailTo
$Message.Subject = $Subject
$Message.Body = $Body
$Message.IsBodyHTML = $true

# Configure SMTP client
$SMTPClient = New-Object System.Net.Mail.SmtpClient($smtp.gmail.com, $587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($narender5t9.devops@gmail.com, $Dysc44pks12)

# Send the email
try {
    $SMTPClient.Send($Message)
    Write-Output "Email sent successfully."
} catch {
    Write-Error "Failed to send email: $_.Exception.Message"
}
