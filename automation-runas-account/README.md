### PowerShell script to create a Run As account that uses a custom role for its service account

1. Start PowerShell with elevated ***user rights***.

2. Download script to create a custom role to use as an example for our next command. you should create your own.

    ```powershell
    curl -O https://raw.githubusercontent.com/raddaoui/azure_toolset/main/automation-runas-account/Create-CustomRole.ps1
    ```

3. Create a custom role. this script will create a custom role called **My Custom Role** under the specified subscription id scope.

    ```powershell
     .\Create-CustomRole.ps1 -SubscriptionId <SubscriptionId>
    ````

4. Download script to create an Azure automation Run-As account

    ```powershell
    curl -O https://raw.githubusercontent.com/raddaoui/azure_toolset/main/automation-runas-account/Create-RunAsAccount.ps1
    ```


5. Create the Run-As account while specifying the Azure role name you want to assign to the service principal

    ```powershell
    .\Create-RunAsAccount.ps1 -ResourceGroup <ResourceGroupName> -AutomationAccountName <NameofAutomationAccount> -SubscriptionId <SubscriptionId> -ApplicationDisplayName <DisplayNameofAADApplication> -SelfSignedCertPlainPassword <StrongPassword> -CreateClassicRunAsAccount $false -RoleDefinitionName "My Custom Role"
    ```

6. After the script has executed, you're prompted to authenticate with Azure. Sign in with an account that's a member of the subscription administrators role.
