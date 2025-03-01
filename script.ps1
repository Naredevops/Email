$EmailFrom = "narender5t9.devops@gmail.com"
$EmailTo = "narender6t9.devops@gmail.com"
$Subject = "Test Gmail from BitBuket"
$Body = "A console that allows users to observe functions "
$Signature = "`r`nRegards`r`nNarender Reddy"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$SMTPUsername = "narender5t9.devops@gmail.com"
$SMTPPassword = "bbhb canf dpcd creb" # Use your Gmail app password here

# Concatenate message body and signature with line breaks
$FullBody = "$Body$Signature"

# Create email message
$Message = New-Object System.Net.Mail.MailMessage($EmailFrom, $EmailTo)
$Message.Subject = $Subject
$Message.Body = $FullBody
$Message.IsBodyHTML = $true

# Configure SMTP client
$SMTPClient = New-Object System.Net.Mail.SmtpClient("smtp.gmail.com", 587)  # Fixed issue with SMTP server string
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("narender5t9.devops@gmail.com", $SMTPPassword)  # Fixed issue with email formatting

# Send the email
try {
    $SMTPClient.Send($Message)
    Write-Output "Email sent successfully."
} catch {
    Write-Error "Failed to send email: $_.Exception.Message"
}
