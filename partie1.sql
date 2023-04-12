-- 1. Afficher toutes les informations concernant les employés.

SELECT * FROM employe;

-- 2. Afficher toutes les informations concernant les départements.
-- A la place de « * » on peut donner la liste des colonnes souhaitées, dans l'ordre
-- souhaité, en écrivant la requête sur une ou plusieurs lignes. L'écriture sur plusieurs
-- lignes est conseillée en vue de rendre plus simple la relecture et la modification de la
-- requête

SELECT * FROM dept;

-- 3. Afficher le nom, la date d'embauche, le numéro du supérieur, le
-- numéro de département et le salaire de tous les employés

SELECT nom, dateemb, nosup, nodep, salaire FROM employe;

-- 4. Afficher le titre de tous les employés.

SELECT titre from employe;

-- 5. Afficher les différentes valeurs des titres des employés

SELECT DISTINCT titre FROM employe;

-- 6. Afficher le nom, le numéro d'employé et le numéro du
-- département des employés dont le titre est « Secrétaire ».

SELECT nom, noemp, nodep FROM employe WHERE titre = "secrétaire";

-- 7. Afficher le nom et le numéro de département dont le numéro de
-- département est supérieur à 40

SELECT nom, nodep FROM employe WHERE nodep > 40;

-- 8. Afficher le nom et le prénom des employés dont le nom est
-- alphabétiquement antérieur au prénom.

SELECT nom, prenom FROM employe WHERE LEFT(nom,1) < LEFT (prenom,1)

-- 9. Afficher le nom, le salaire et le numéro du département des employés
-- dont le titre est « Représentant », le numéro de département est 35 et
-- le salaire est supérieur à 20000.

SELECT nom, salaire, numdep FROM employe WHERE titre = "représentant" AND nodep = 35 AND salaire > 20000;

-- 10.Afficher le nom, le titre et le salaire des employés dont le titre est
-- « Représentant » ou dont le titre est « Président ».

SELECT nom, titre, salaire FROM employe WHERE titre = "représentant" OR titre = "président";

-- 11.Afficher le nom, le titre, le numéro de département, le salaire des
-- employés du département 34, dont le titre est « Représentant » ou
-- « Secrétaire ».

SELECT nom, titre, nodep, salaire FROM employe WHERE (titre = "représentant" OR titre = "secrétaire") AND nodep = 34;

-- 12.Afficher le nom, le titre, le numéro de département, le salaire des
-- employés dont le titre est Représentant, ou dont le titre est Secrétaire
-- dans le département numéro 34.

SELECT nom, titre, nodep, salaire FROM employe WHERE titre = "représentant" OR (titre = "secrétaire" AND nodep = 34);

-- 13.Afficher le nom, et le salaire des employés dont le salaire est compris
-- entre 20000 et 30000

SELECT nom, salaire FROM employe WHERE salaire BETWEEN 20000 AND 30000;

-- 15.Afficher le nom des employés commençant par la lettre « H ».

SELECT nom from employe WHERE LEFT(nom,1) = 'H';

-- 16.Afficher le nom des employés se terminant par la lettre « n ».

SELECT nom from employe WHERE RIGHT(nom,1) = 'N';

-- 17.Afficher le nom des employés contenant la lettre « u » en 3ème
-- position.

SELECT nom from employe WHERE SUBSTRING(nom, 3, 1) = 'U';

-- 18.Afficher le salaire et le nom des employés du service 41 classés par
-- salaire croissant.

SELECT salaire, nom FROM employe WHERE nodep = 41 ORDER BY salaire ASC;

-- 19.Afficher le salaire et le nom des employés du service 41 classés par
-- salaire décroissant.

SELECT salaire, nom FROM employe WHERE nodep = 41 ORDER BY salaire DESC;

-- 20.Afficher le titre, le salaire et le nom des employés classés par titre
-- croissant et par salaire décroissant.

SELECT titre, salaire, nom FROM employe ORDER BY titre ASC, salaire DESC;

-- 21.Afficher le taux de commission, le salaire et le nom des employés
-- classés par taux de commission croissante.

SELECT tauxcom, salaire, nom FROM employe ORDER BY tauxcom ASC;

-- 22.Afficher le nom, le salaire, le taux de commission et le titre des
-- employés dont le taux de commission n'est pas renseigné.

SELECT nom, salaire, tauxcom, titre FROM employe WHERE tauxcom IS NULL;

-- 23.Afficher le nom, le salaire, le taux de commission et le titre des
-- employés dont le taux de commission est renseigné.

SELECT nom, salaire, tauxcom, titre FROM employe WHERE tauxcom IS NOT NULL;

-- 24.Afficher le nom, le salaire, le taux de commission, le titre des
-- employés dont le taux de commission est inférieur à 15.

SELECT nom, salaire, tauxcom, titre FROM employe WHERE tauxcom < 15;

-- 25. Afficher le nom, le salaire, le taux de commission, le titre des
-- employés dont le taux de commission est supérieur à 15.

SELECT nom, salaire, tauxcom, titre FROM employe WHERE tauxcom > 15;

-- 26.Afficher le nom, le salaire, le taux de commission et la commission des
-- employés dont le taux de commission n'est pas nul. (la commission
-- est calculée en multipliant le salaire par le taux de commission)

SELECT nom, salaire, tauxcom, (salaire*tauxcom) AS commission FROM employe WHERE tauxcom IS NOT NULL;

-- 27. Afficher le nom, le salaire, le taux de commission, la commission des
-- employés dont le taux de commission n'est pas nul, classé par taux de
-- commission croissant

SELECT nom, salaire, tauxcom, (salaire*tauxcom) AS commission FROM employe WHERE tauxcom IS NOT NULL ORDER BY commission ASC;

-- 28. Afficher le nom et le prénom (concaténés) des employés. Renommer
-- les colonnes

SELECT nom, prenom, CONCAT(prenom,' ',nom) AS concaténation FROM employe

-- 29. Afficher les 5 premières lettres du nom des employés.

SELECT LEFT(nom,5) FROM employe;

-- 30. Afficher le nom et le rang de la lettre « r » dans le nom des
-- employés.

SELECT nom, LOCATE('r',nom) AS indice FROM employe WHERE nom LIKE '%r%';

-- 31. Afficher le nom, le nom en majuscule et le nom en minuscule de
-- l'employé dont le nom est Vrante.

SELECT UPPER(nom) AS Nom, LOWER(prenom) AS Prénom FROM employe WHERE nom = 'vrante';

-- 32. Afficher le nom et le nombre de caractères du nom des employés.

SELECT nom, LENGTH(nom) AS nbr_char FROM employe;