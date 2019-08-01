/*Task:
Back to ApplicationData.CheckListTemplateItem table – Items library table for Checklist application.
Please create JS function with one input parameter called db_mode. 
If db_mode = ‘insert’, script should call another function which inserts (__bll.insert)  CheckListTemplateItem record with following fields assigned:

-	CheckListTemplateItemId = newUniqueId. To get new ID use following method:
newUniqueId = __dal.unique_key("private", "ApplicationData.CheckListTemplateItem_Seq");
-	CheckListTemplateHeaderId = hard code to 54
-	DisplaySequence = 1
-	Description = ‘My test item’ 
-	IsActive = 0
-	IsSiteManagerOnly = 0

Other fields are not required.

If db_mode = ‘update’, script should call another function which activates all inactive Items (IsActive = 0)
and changes their Description to ‘I am testing updates’ (there could be multiple records with same description in this case). Use __bll.update for this.

If db_mode = ‘delete’, script should delete Template Items with Display Sequence greater than 10 but less than 30.
Use __bll.delete for this.

Please note: if you run __bll methods like this: var res = __bll.insert(…)  - then res will contain object with success,
message and affected_rows attributes: res.success will indicate if operation successfully completed, res.message will contain error text
in case of error and res.affected_rows will contain number of inserted, updated or deleted records.

So each of described function should return result of its operation as such object.
Main script should have three output parameters for operation’s result attributes. 
*/

/*EXERCISE4*/
DECLARE @id int;
INSERT INTO [ApplicationData].[CheckListTemplateItem] ([CheckListTemplateItemId], [CheckListTemplateHeaderId], [DisplaySequence],
[Description], [IsActive], [IsSiteManagerOnly]) VALUES (@id, 54, 1, 'My test item', 0, 0);

UPDATE [ApplicationData].[CheckListTemplateItem]
SET [IsActive] = 1, [Description] = 'I am testing updates'
WHERE [IsActive] = 0;

DELETE FROM [ApplicationData].[CheckListTemplateItem] WHERE [DisplaySequence] BETWEEN 10 AND 30;

