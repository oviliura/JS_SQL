
/*Exercise 2
Various problems may appear during construction process like tools damaging, theft, fire - 
there is Issue Management application in COINS Construction Cloud fully dedicated for different problems handling.
Main database table there is ApplicationData.Issue. Issues have different attributes such as creation date,
due date, status, description, type, etc. In order to resolve Issue, one or more Tasks can be created for it (ApplicationData.IssueTask). 

Task:
Create JS function which should display following information about Issue by given Issue Id:
-	Reference
-	Description (truncated to 20 characters + ‘…’ if its length > 20)
-	Issue Status (ApplicationData.IssueStatus.Description)
-	Issue Reason if specified (ApplicationData.IssueCause.Description)
-	Created At (in format dd/mm/yyyy hh:mm) – in this case, format the date using SQL functions directly in query.
-	Due Date (in format dd/mm/yyyy hh:mm) – in this case, format the date using __date.format JS method.
-	Calculate number of days spent since Due Date till today.
-	Using __engine.console() print to debugger’s console log, line by line, all Tasks created for requested Issue (if they are present).
Line should contain Task Reference, Task Work Status (ApplicationData. IssueTaskWorkStatus.Code), Estimated Hours, Actual Hours.
If they are not same, calculate percent difference between these hours (if Actual > Estimated print it as +xx%, otherwise -xx%). (New column.)

Additional 1:
Add new input parameter called rate (string). Convert it to decimal variable if possible (__number.is_valid).
Use Rate to calculate Issue Tasks Estimated and Actual Costs by formula (costs = hrs * rate). Round the results to two digits after comma (__number.round).  
*/


/*EXERCISE2 PART1*/
DECLARE @yourIssueID INT =492;

SELECT [ApplicationData].[Issue].[Reference], [ApplicationData].[Issue].[Description] AS IssueDescription,
[ApplicationData].[IssueStatus].[Description] AS IssueStatusDescription, [ApplicationData].[IssueCause].[Description] AS IssueCauseDescription,
CONCAT(CONVERT(varchar,[ApplicationData].[Issue].[CreatedAt], 103), ' ' , CONVERT(varchar(5),[ApplicationData].[Issue].[CreatedAt], 24))AS [CreatedAt],
[ApplicationData].[Issue].[DueDate], --FORMAT IN JS Editor IF NULL
DATEDIFF (DAY, [ApplicationData].[Issue].[DueDate], CONVERT(datetimeoffset, GETDATE())) AS DIFF --BETTER IN JSEditor(IF NULL)
FROM [ApplicationData].[Issue] JOIN [ApplicationData].[IssueStatus]
ON [ApplicationData].[Issue].[IssueStatusId]=[ApplicationData].[IssueStatus].[IssueStatusId]
JOIN [ApplicationData].[IssueCause] 
ON [ApplicationData].[Issue].[IssueCauseId]=[ApplicationData].[IssueCause].[IssueCauseId]
WHERE [ApplicationData].[Issue].[IssueInternalId] = @yourIssueID


/*EXERCISE2 PART2*/
DECLARE @yourIssueInternalID INT =492;

SELECT [ApplicationData].[IssueTask].[Reference], [ApplicationData].[IssueTaskWorkStatus].[Code],
[ApplicationData].[IssueTask].[EstimateHours], [ApplicationData].[IssueTask].[ActualHours],
CONCAT(CONVERT(varchar,(ISNULL([IssueTask].[ActualHours]-[IssueTask].[EstimateHours], 0))),'%') AS DIFF
FROM [ApplicationData].[IssueTask]
JOIN [ApplicationData].[IssueTaskWorkStatus]
ON [ApplicationData].[IssueTask].[IssueTaskWorkStatusId]=[ApplicationData].[IssueTaskWorkStatus].[IssueTaskWorkStatusId]
JOIN [ApplicationData].[Issue]
ON [ApplicationData].[Issue].[IssueGUID]=[ApplicationData].[IssueTask].[IssueGUID]
WHERE [ApplicationData].[Issue].[IssueInternalId]=@yourIssueInternalID

