/*

PT: Esse script é usado para procurar objetos no banco de dados (views, procedures, etc).
EN: This script is used to search objects in the database (views, procedures, etc).
FR: Ce script est utilisé pour rechercher des objects dans le Database (views, procedures, etc).

*/

SELECT A.NAME, A.TYPE, B.TEXT
  FROM sys.objects  A (nolock)
  JOIN syscomments B (nolock) 
    ON A.Object_ID = B.ID
WHERE B.TEXT LIKE '%Colaborador%'  -- value of search
  --AND A.TYPE = 'P' -- For example 'P' 
 ORDER BY A.NAME
