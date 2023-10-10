# SlotsAvailabilityCheck - Powershell Script

## Introduction
This is a Powershell script that makes REST calls to Microsoft Bookings API and sends a notification on your desktop if there is a lot available. Task Scheduler can be used to run the script in intervals.

## Setup Instructions

1. **Environment Variables**

   Create a `.env` file in the same directory as your script and add the following environment variables:
   - `STAFF_LIST`
   - `SERVICE_ID`
   - `USER_IDENTIFIER`

   Open the SlotsAvailabilityChecker.ps1 script and provide the full path to the .env file under $envFilePath variable.

2. **Install Required Modules**

   Use the requirements file to install the required PowerShell modules. Run the following command:
   ```powershell
   Install-Module -Name <ModuleName> -Force

3. **Running the Script**

   To test the script manually, follow these steps:
   1. Open PowerShell with administrator privileges.
   2. Navigate to the directory where your script is located.
   3. Run the script using the following command:
      ```powershell
      powershell -ExecutionPolicy Bypass -File "<Path>\SlotsAvailabilityChecker.ps1"

   Alternatively, you can run the script directly from PowerShell:
   1. Open PowerShell with administrator privileges.
   2. Navigate to the directory where your script is located.
   3. Run the script using the following command:
     ```powershell
     cd <Path>
     .\SlotsAvailabilityChecker.ps1

4. **Scheduling the Script with Task Scheduler**

   To schedule your PowerShell script to run at a 15-minute interval using Windows Task Scheduler, follow these steps:
   1. Open the Windows Task Scheduler by searching for "Task Scheduler" in the Windows Start menu.

      ![image](https://github.com/princetondcunha/SlotsAvailabilityChecker_PS/assets/103622011/a1ebdaf2-ac2a-469b-801b-c3a58014f497)
      
   2. In the Task Scheduler Library, click on "Create Task" in the right-hand panel.

      ![image](https://github.com/princetondcunha/SlotsAvailabilityChecker_PS/assets/103622011/cccc9fae-1804-4a74-9bec-764363f72c32)

   3. In the "General" tab of the Create Task window, provide a name and description for your task.
      
      ![image](https://github.com/princetondcunha/SlotsAvailabilityChecker_PS/assets/103622011/29147900-4fba-4002-aafb-43a03dacd58d)

   4. In the "Triggers" tab, click "New" to create a new trigger.

      ![image](https://github.com/princetondcunha/SlotsAvailabilityChecker_PS/assets/103622011/7c8b6828-a796-45e0-85c9-c06f46c14262)

   5. Select "Daily" as the trigger type. Set the "Recur every" field to "1 days". Check the "Repeat task every" box and set it to "15 minutes".
      
      ![image](https://github.com/princetondcunha/SlotsAvailabilityChecker_PS/assets/103622011/3e642577-429c-4b6e-a890-654623635dcf)

   6. In the "Actions" tab, click "New" to create a new action.
  
      ![image](https://github.com/princetondcunha/SlotsAvailabilityChecker_PS/assets/103622011/cbe09648-1edd-47b9-acd7-92599dc12b51)

   7. Select "Start a program" as the action type. In the "Program/script" field, enter "powershell". In the "Add arguments (optional)" field, enter "-ExecutionPolicy Bypass -File "<Path>\SlotsAvailabilityChecker.ps1" 

      ![image](https://github.com/princetondcunha/SlotsAvailabilityChecker_PS/assets/103622011/4045c5a9-0a94-4e7d-a250-010b8e682a21)

   8. Click "OK" to save your task.
   9. Right-click on the task & click Run to test the setup.
      ![image](https://github.com/princetondcunha/SlotsAvailabilityChecker_PS/assets/103622011/2b4f58db-8f06-4a35-9fe0-2ab4dc70774f)
      
   Now, your PowerShell script will run at a 15-minute interval according to the schedule you've configured in Task Scheduler.

   Alternatively, you can use the Scheduler.xml present in the repo and import it into your Task Scheduler. Navigate to Actions and update the path to the script in 'Add arguments (optional)'.
