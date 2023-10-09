Import-Module BurntToast

$envFilePath = ".env"
$envFileContent = Get-Content -Path $envFilePath

$envVariables = @{}
foreach ($line in $envFileContent) {
    if ($line -match '^(.*?)=(.*)$') {
        $key = $matches[1].Trim()
        $value = $matches[2].Trim()
        $envVariables[$key] = $value
    }
}

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")

$body = @{
    "StaffList"  = @($envVariables["STAFF_LIST"])
    "Start"      = "2023-01-01T00:00:00"
    "End"        = "2025-01-01T00:00:00"
    "TimeZone"   = "America/Halifax"
    "ServiceId"  = $envVariables["SERVICE_ID"]
} | ConvertTo-Json

$useridentifier = $envVariables["USER_IDENTIFIER"]
$url = "https://outlook.office365.com/owa/calendar/$useridentifier/bookings/service.svc/GetStaffBookability"

$response = Invoke-RestMethod $url -Method 'POST' -Headers $headers -Body $body
$response | ConvertTo-Json

if($response.StaffBookabilities.BookableTimeBlocks.Count -gt 0){
	$itemList = $response.StaffBookabilities.BookableTimeBlocks | ForEach-Object {"Start: $($_.Start), End: $($_.End)"}
	$itemText = $itemList -join "`r`n"
	$notificationText = "Slots available`r`n$itemText"
	New-BurntToastNotification -Text $notificationText
}