/*Exercise 1 
Checklist is a list of Items which Site Manager has to check on construction site (e.g. ‘check windows on floor 1’, ‘check doors’, ‘check painting’ and so on).
And Checklist Template is a global library of such Items – not all of them are required on site.
Items, among other properties, could be Active or Inactive which indicates if they should be included or excluded from actual Checklist.
Database table for Template Items is ApplicationData.CheckListTemplateItem. 

Task: 
Create JS function which should count all Active Items in ApplicationData.CheckListTemplateItem in two ways:
1. query a table using __dal.select_row method
2. query a table using __dal.select method.
So function should have two output parameters respectively, showing same result. 

Additional 1: 
Template Headers table (ApplicationData.CheckListTemplateHeader) is related to Template Items as one-to-many by CheckListTemplateHeaderId field.
Modify function to count Active Items only in one Template Header (add Template Id as function’s input parameter). 

Additional 2:
Only one Template Header at a time can be marked as ‘currently in use’ (CheckListTemplateHeader.IsCurrent = 1).
Add another function’s output parameter which returns ‘true’ if inputted Template Id belongs to current Template and ‘false’ if entered Template is not current.
*/


/*EXERCISE1 TASK1*/
SELECT COUNT(*) FROM ApplicationData.CheckListTemplateItem WHERE IsActive = 1;


/*EXERCISE1 Additional1*/
DECLARE @yourID INT =24;
SELECT COUNT(*) FROM ApplicationData.CheckListTemplateItem WHERE ApplicationData.CheckListTemplateItem.isActive = 1 
AND ApplicationData.CheckListTemplateItem.CheckListTemplateHeaderId = @yourID;


/*EXERCISE1 Additional2*/
DECLARE @yourHeaderID INT =24;
SELECT ApplicationData.CheckListTemplateHeader.IsCurrent FROM ApplicationData.CheckListTemplateHeader
WHERE ApplicationData.CheckListTemplateHeader.CheckListTemplateHeaderId = @yourHeaderID

