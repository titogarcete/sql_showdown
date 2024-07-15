SELECT COUNT(*) FROM Users WHERE location is NULL OR Location = ''

UPDATE Users
SET Location = 'Desconocido'
WHERE Location IS NULL OR Location = '';