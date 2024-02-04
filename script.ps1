# Assign secrets to variables from environment variables
$EmailFrom = $env:SMTP_USERNAME
$EmailTo = $env:EMAIL_TO
$SMTPPassword = $env:SMTP_PASSWORD
$SMTPUsername = $env:SMTP_USERNAME

# Subject, body, and SMTP server details
$Subject = "PF Account UAN not activated"
$Body = @"
Hi PF Team,

It's been a long time, Can you please provide feedback on this item.

Regards
Narender Reddy.
"@
$SMTPServer = "smtp.gmail.com"
$SMTPPort = 587

# Debugging output
Write-Output "SMTP_USERNAME: $($env:SMTP_USERNAME)"
Write-Output "SMTP_PASSWORD: $($env:SMTP_PASSWORD)"
Write-Output "EmailFrom: $EmailFrom"

# Check if $EmailFrom is null or empty
if ([string]::IsNullOrEmpty($EmailFrom)) {
    Write-Error "SMTP_USERNAME environment variable is null or empty."
} else {
    # Create email message
    $Message = New-Object System.Net.Mail.MailMessage
    $Message.From = $EmailFrom
    $Message.To.Add($EmailTo)
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
}
