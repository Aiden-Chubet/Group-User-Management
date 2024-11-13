## Verify who is in specified group
Get-ADGroupMember -Identity "ZoomSSO"

## Export users in group
Get-ADGroupMember -Identity "Office 365 Standard" |
Select-Object name | Export-Csv "C:\Exports\365StandardGroup.csv"

## Get all users in one OU and add them to the group Office 365 Standard
Get-ADUser -Filter * -SearchScope OneLevel -SearchBase "OU=Employees,DC=Domain,DC=local" | ForEach-Object { Add-ADGroupMember -Identity "CompanyMileageSSO" -Members $_ }

## Export all users in OU
Get-ADUser -Filter * -SearchScope OneLevel -SearchBase "OU=Employees,DC=Domain,DC=local" -Properties cn, DisplayName |
Select-Object -Property cn, DisplayName | Export-Csv "C:\Exports\EmployeeOU.csv"

