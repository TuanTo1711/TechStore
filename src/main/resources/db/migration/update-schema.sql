alter table product
    add CONSTRAINT FK_PRODUCT_ON_CATEGORY FOREIGN KEY (category_id) REFERENCES category (id)
GO

declare @sql [nvarchar](MAX)
select @sql = N'ALTER TABLE users DROP CONSTRAINT ' + QUOTENAME([df].[name])
from [sys].[columns] AS [c]
         INNER JOIN [sys].[default_constraints] AS [df] ON [df].[object_id] = [c].[default_object_id]
where [c].[object_id] = OBJECT_ID(N'users')
  AND [c].[name] = N'create_at'
EXEC sp_executesql @sql
GO

ALTER TABLE users
    DROP COLUMN create_at
GO

declare @sql [nvarchar](MAX)
select @sql = N'ALTER TABLE users DROP CONSTRAINT ' + QUOTENAME([df].[name])
from [sys].[columns] AS [c]
         INNER JOIN [sys].[default_constraints] AS [df] ON [df].[object_id] = [c].[default_object_id]
where [c].[object_id] = OBJECT_ID(N'users')
  AND [c].[name] = N'delete_at'
EXEC sp_executesql @sql
GO

ALTER TABLE users
    DROP COLUMN delete_at
GO

declare @sql [nvarchar](MAX)
select @sql = N'ALTER TABLE users DROP CONSTRAINT ' + QUOTENAME([df].[name])
from [sys].[columns] AS [c]
         INNER JOIN [sys].[default_constraints] AS [df] ON [df].[object_id] = [c].[default_object_id]
where [c].[object_id] = OBJECT_ID(N'users')
  AND [c].[name] = N'update_at'
EXEC sp_executesql @sql
GO

ALTER TABLE users
    DROP COLUMN update_at
GO

ALTER TABLE users
    ADD create_at date
GO

ALTER TABLE users
    ADD delete_at date
GO

ALTER TABLE users
    ADD update_at date
GO