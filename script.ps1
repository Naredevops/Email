# Assign secrets to variables
$EmailFrom = $env:SMTP_USERNAME
$EmailTo = "narender6t9.devops@gmail.com"
$SMTPPassword = $env:SMTP_PASSWORD
$SMTPUsername = "narender5t9.devops@gmail.com"
$Subject = "PF Account UAN not activated"
$Body = @"
Hi PF Team,

It's been a long time, Can you please provide feedback on this item.

Regards
Narender Reddy.
"@
$SMTPServer = "smtp.gmail.com"
$SMTPPort = 587

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
    Write-Error "Failed to send email: $($_.Exception.Message)"
}
