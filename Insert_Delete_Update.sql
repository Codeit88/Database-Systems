
INSERT INTO production.brands(brand_id,brand_name) VALUES(1,'A')
INSERT INTO production.brands(brand_id,brand_name) VALUES(2,'B')

SET IDENTITY_INSERT production.brands OFF;  


delete from production.brands WHERE brand_name ='Electra'
delete from production.brands WHERE brand_name ='Haro'
SET IDENTITY_INSERT production.brands ON;  

