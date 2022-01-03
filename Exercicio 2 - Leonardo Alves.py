import pandas as pd
import sqlalchemy

engine = sqlalchemy.create_engine('mysql+pymysql://programa_bolsas:pb@hive-metastore.cnpzwadswd70.us-east-1.rds.amazonaws.com:3306/programa_bolsas')

df = pd.read_sql_query('SELECT A.EDITORA AS Cod_Editora, B.Nome, COUNT(Editora) AS Número_de_Livros FROM LIVRO A INNER JOIN EDITORA B ON A.EDITORA = B.CodEditora GROUP BY A.EDITORA, B.Nome ORDER BY Número_de_Livros DESC LIMIT 5;', engine)

print (df)

df.to_csv('5 editoras que mais tem livros na biblioteca CSV.CSV', index=False)

df.to_excel('5 editoras que mais tem livros na biblioteca Excel.xlsx', sheet_name='5 Editoras com mais livros', index=False)