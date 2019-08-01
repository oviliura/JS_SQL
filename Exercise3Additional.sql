/*EXERCISE3
Additional 1:
Checklists briefly described in Exercise 1 are being created for each Plot.
So create function which checks if Plot has created Checklist and returns ‘Yes’ – if so and ‘No’ – otherwise.
Function should have Plot Id as input parameter. To see if there is a Checklist for it, verify whether related ApplicationData. 
CheckListHeader record exists which has one-to-one relation with ApplicationData.HBPlot. 
Call this function along with others in GetPlotInfo and show result as new output parameter.

Additional 2:
As it briefly described in Exercise 2, various issues may appear during Plot building process.
Plots may have many Issues, single Issue could be linked to many Plots - so there is many-to-many relation between ApplicationData.
Issue and ApplicationData.HBPlot tables.  In database it is resolved through cross-reference table ApplicationData.IssueXRefPlot. 

Please, create JS function which counts number of Opened Issues for Plot (as before, Plot Id is input parameter).
Basically, to count Plot’s Issues it is enough to count related XRef records, but task is to count Issues with Status = ‘Open’.
So SQL query has to JOIN Issue table additionally (and ApplicationData.IssueStatus optionally). 
Call this function from GetPlotInfo and show result as new output parameter.
*/

/*EXERCISE3 ADDITIONAL1*/
DECLARE @yourPlotID int = 30;
IF EXISTS (SELECT [ApplicationData].[CheckListHeader].[ForeignTableId]
FROM [ApplicationData].[CheckListHeader] 
WHERE [ApplicationData].[CheckListHeader].[ForeignTableId]=@yourPlotID)
PRINT('YES')
ELSE
PRINT('NO')

/*EXERCISE3 ADDITIONAL2*/
DECLARE @PlotID int = 3110;
SELECT COUNT([ApplicationData].[IssueXRefPlot].[IssueGUID]) AS OpenedIssues
FROM [ApplicationData].[IssueXRefPlot]
JOIN [ApplicationData].[Issue]
ON [ApplicationData].[Issue].[IssueGUID]=[ApplicationData].[IssueXRefPlot].[IssueGUID]
JOIN [ApplicationData].[IssueStatus] 
ON [ApplicationData].[IssueStatus].[IssueStatusId]=[ApplicationData].[Issue].[IssueStatusId]
WHERE [ApplicationData].[IssueStatus].[Description] = 'Closed' AND
[ApplicationData].[IssueXRefPlot].[PlotId] = @PlotID


