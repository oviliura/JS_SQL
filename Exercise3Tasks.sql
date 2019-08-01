/*Exercise 3 Tasks
Plot – in construction industry is a unit of construction (for example house or apartment).
Construction Site may contain many Plots each of them can be described by its House Type, Dwelling Type, Construction Method, etc.
Process of Plot Construction can be split in Stages. Each Stage has Sequence number which indicates order in which they should be built. 

Prepare JS function (let’s call it GetPlotInfo) which selects required Plot record (ApplicationData.HBPlot) from database by given Plot Id.
DB query should select following fields: Plot Number, Site Id, House Type Id, Dwelling Type Id and Construction Stage Id.
Function should return message saying whether record is found or not. 

Also, create separate simple function for each of following purposes:
 1.	Using Site Id as input parameter, function should return Site’s Name and Status as separate output parameters.
 2.	Using House Type Id as input parameter, function should return House Type’s Code, Bathrooms, Bedrooms.
 3.	Using Dwelling Type Id as input parameter, function should return Dwelling Type Code or appropriate message if Dwelling Type is not found.
 4.	Using Construction Stage Id as input parameter, function should return Stage Name or appropriate message if it was not found.
  Besides name of requested Stage, function should also return next Stage in Sequence order.

Go back to the first GetPlotInfo function which selects record IDs from HBPlot database table. Modify it to call another four functions described above (__call interface). Pass retrieved IDs as input parameters to them. In result function should return following output parameters:
-	plot_number
-	plot_site - in format ‘Site Name (Status)’
-	plot_house_type – in format ‘House Type Code (Bathrooms, Bedrooms)’
-	plot_dwelling_type – Dwelling Type Code
-	plot_stage – in format ‘Stage name (next Stage will be: next stage name)’
*/

/*EXERCISE3 TASK0*/
DECLARE @yourPlotID int = 3054;
SELECT [ApplicationData].[HBPlot].[PlotNumber], [ApplicationData].[HBPlot].[SiteId],
[ApplicationData].[HBPlot].[HouseTypeId], [ApplicationData].[HBPlot].[HBDwellingTypeId],
[ApplicationData].[HBPlot].[HBConstructionStageId] 
FROM [ApplicationData].[HBPlot]
WHERE [ApplicationData].[HBPlot].[PlotId]=@yourPlotID;

/*EXERCISE3 TASK1*/
DECLARE @yourSiteID int = 185;
SELECT [ApplicationData].[HBSite].[SiteName], [ApplicationData].[HBSite].[Status]
FROM [ApplicationData].[HBSite]
WHERE [ApplicationData].[HBSite].[SiteId]=@yourSiteID;

/*EXERCISE3 TASK2*/
DECLARE @yourHouseTypeID int = 703;
SELECT [ApplicationData].[HBHouseType].[Bathrooms], [ApplicationData].[HBHouseType].[Bedrooms]
FROM [ApplicationData].[HBHouseType]
WHERE [ApplicationData].[HBHouseType].[HouseTypeId]=@yourHouseTypeID;

/*EXERCISE3 TASK3*/
DECLARE @yourDwellingTypeID int = 31;
SELECT [ApplicationData].[HBDwellingType].[Code]
FROM [ApplicationData].[HBDwellingType]
WHERE [ApplicationData].[HBDwellingType].[HBDwellingTypeId]=@yourDwellingTypeID;

/*EXERCISE3 TASK4*/
DECLARE @yourConstructionStageID int = 36;

DECLARE @currDisplaySequence int =(SELECT [ApplicationData].[HBConstructionStage].[DisplaySequence]
FROM [ApplicationData].[HBConstructionStage]
WHERE [ApplicationData].[HBConstructionStage].[HBConstructionStageId]=@yourConstructionStageID);

SELECT [ApplicationData].[HBConstructionStage].[Stage]
FROM [ApplicationData].[HBConstructionStage]
WHERE [ApplicationData].[HBConstructionStage].[HBConstructionStageId]=@yourConstructionStageID;

SELECT TOP 1 [ApplicationData].[HBConstructionStage].[Stage] FROM [ApplicationData].[HBConstructionStage]
WHERE [ApplicationData].[HBConstructionStage].[DisplaySequence]>@currDisplaySequence 
ORDER BY [ApplicationData].[HBConstructionStage].[DisplaySequence];




