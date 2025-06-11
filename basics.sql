/* multi line comment
*/
-- single line comment 
create database DBtest; -- creating database
use DBtest; -- selecting the database to perform operations
create table tabletest( 

test_column int -- creating column in database of type integar 
);
describe tabletest; -- show details of database 
alter table tabletest -- altering by either adding or deleting 
add another_column varchar(255); -- varchar used for string with maximum 255 characters
alter table tabletest
drop another_column; -- deleting the column

