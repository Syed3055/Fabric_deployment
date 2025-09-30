function Get-PowerBIToken {
  param (
    [string]$clientId,
    [string]$clientSecret,
    [string]$tenantId
  )

  $body = @{
    grant_type    = "client_credentials"
    client_id     = $clientId
    client_secret = $clientSecret
    resource      = "https://analysis.windows.net/powerbi/api"
  }

  $response = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$tenantId/oauth2/token" -Method Post -Body $body
  return $response.access_token
}
