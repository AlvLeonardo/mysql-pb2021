import pandas as pd
import sqlalchemy

engine = sqlalchemy.create_engine('mysql+pymysql://programa_bolsas:pb@hive-metastore.cnpzwadswd70.us-east-1.rds.amazonaws.com:3306/programa_bolsas')

df = pd.read_sql_query('SELECT Cod, Titulo, CodAutor, B.Nome AS Nome_Autor, Valor, Editora AS Cod_Editora, C.Nome AS Editora FROM LIVRO A INNER JOIN AUTOR B ON A.Autor = B.CodAutor INNER JOIN EDITORA C  ON A.Editora = C.CodEditora ORDER BY Valor DESC LIMIT 10;', engine)

print (df)

df.to_csv('10 livros mais caros CSV.CSV', index=False)

df.to_excel('10 livros mais caros Excel.xlsx', sheet_name='10 livros mais caros', index=False)