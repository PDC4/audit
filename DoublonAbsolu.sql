SELECT COUNT(*) AS nbr_doublon, champ1, champ2, champ3
FROM table
GROUP BY champ1, champ2, champ3
HAVING COUNT(*) > 1;