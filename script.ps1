$EmailFrom = "narender5t9.devops@gmail.com"
$EmailTo = "narender6t9.devops@gmail.com"
$Subject = "Test Gmail from GitLab"
$Body = "This is a test email by using PowerShell, hence we are doing test azure."
$Signature = "`r`nRegards`r`nNarender Reddy"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$SMTPUsername = "narender5t9.devops@gmail.com"
$SMTPPassword = "bbhb canf dpcd creb" # Use your Gmail app password here

# Concatenate message body and signature with line breaks
$FullBody = "$Body$Signature"

# Create email message
$Message = New-Object System.Net.Mail.MailMessage $EmailFrom, $EmailTo
$Message.Subject = $Subject
$Message.Body = $FullBody
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
