Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework

$totalAmountOfTimeStudied = 0 

function programs {
while ($true){
    for ($i = $studyAmountInSeconds; $i -ne 0 ; $i--){
        Clear-Host
        Write-Host "Time remaining = $i : Total amount of seconds studied = $totalAmountOfTimeStudied"
        $totalAmountOfTimeStudied += 1
        Start-Sleep -Seconds 1
    }

    [System.Windows.MessageBox]::Show("Time for rest")
    Clear-Host 

    for ($i = $restAmountInSeconds; $i -ne 0 ; $i--){
        Clear-Host
        Write-Host "Time remaining = $i : Total amount of seconds studied = $totalAmountOfTimeStudied"
        Start-Sleep -Seconds 1
    }

    $result = [System.Windows.Forms.MessageBox]::Show("Rest time over, do you want to add 5 more minutes to break?", "Confirmation", 
    [System.Windows.Forms.MessageBoxButtons]::YesNo, 
    [System.Windows.Forms.MessageBoxIcon]::Question)

    if ($result -eq "Yes") {
        for ($i = 300; $i -ne 0 ; $i--){
        Clear-Host 
        Write-Host "Time remaining = $i : Total amount of seconds studied = $totalAmountOfTimeStudied"
        Start-Sleep -Seconds 1
    }
        [System.Windows.MessageBox]::Show("Time for study")
         
    } elseif ($result -eq "No") {
        [System.Windows.MessageBox]::Show("Back to study then!")
        Clear-Host
    }
}
}
 # prompter 

    Clear-Host

    $studyAmountPrompt = "Enter amount of minutes to study for . . . "
    foreach ($char in $studyAmountPrompt.ToCharArray()) {
        Write-Host -NoNewline $char
        Start-Sleep -Milliseconds 20  
    }

    $studyAmount = Read-Host 
    $studyAmountConverted = [Convert]::ToInt32($studyAmount) 
    $studyAmountInSeconds = $studyAmountConverted * 60 

    $restAmountPrompt = "Enter amount of minutes to rest  for . . . "
    foreach ($char in $restAmountPrompt.ToCharArray()) {
        Write-Host -NoNewline $char
        Start-Sleep -Milliseconds 20  
    }

    $restAmount = Read-Host 
    $restAmountConverted = [Convert]::ToInt32($restAmount) 
    $restAmountInSeconds = $restAmountConverted * 60 
    
    Write-Host 
    "Press ctrl + c at anytime to exit program "
    Start-Sleep -Seconds 5

    Clear-Host
    programs


