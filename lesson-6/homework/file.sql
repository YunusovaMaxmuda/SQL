Finding Distinct Values (по 2 колонкам)

Задача: убрать дубликаты и учесть, что (a, b) и (b, a) — это одно и то же.

Способ 1: Использовать LEAST() и GREATEST() (в SQL Server — CASE)

SELECT DISTINCT
       CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
       CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;

 Способ 2: Использовать ROW_NUMBER()

WITH CTE AS (
    SELECT 
        CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
        CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2,
        ROW_NUMBER() OVER (
            PARTITION BY 
                CASE WHEN col1 < col2 THEN col1 ELSE col2 END,
                CASE WHEN col1 < col2 THEN col2 ELSE col1 END
            ORDER BY (SELECT NULL)
        ) AS rn
    FROM InputTbl
)
SELECT col1, col2
FROM CTE
WHERE rn = 1;


✔ Результат:

col1 | col2
-----+-----
a    | b
c    | d
m    | n
 Удалить строки, где все значения = 0
SELECT *
FROM TestMultipleZero
WHERE NOT (A = 0 AND B = 0 AND C = 0 AND D = 0);

Альтернативно, можно проверить сумму:

SELECT *
FROM TestMultipleZero
WHERE (A + B + C + D) <> 0;

 Найти строки с нечётными id
SELECT *
FROM section1
Человек с минимальным id
SELECT TOP 1 *
FROM section1
ORDER BY id ASC;

 Человек с максимальным id
SELECT TOP 1 *
FROM section1
ORDER BY id DESC;

Люди, чьё имя начинается с b (без учета регистра)
SELECT *
FROM section1
WHERE name LIKE 'B%';

Найти строки, где Code содержит символ _
  Здесь _ в LIKE — это один любой символ, поэтому чтобы искать именно подчёркивание, нужно экранировать:

SELECT *
FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';


✔ Результат:

X_456
X_ABC
