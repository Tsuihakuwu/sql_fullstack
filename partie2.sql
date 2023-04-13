-- Rechercher le prénom des employés et le numéro de la région de leur
-- département

SELECT prenom, noregion FROM employe JOIN dept ON nodep = nodept ORDER BY noregion ASC, prenom ASC;

-- Rechercher le numéro du département, le nom du département, le
-- nom des employés classés par numéro de département (renommer les
-- tables utilisées).

SELECT nodept AS 'Numéro département', dept.nom AS 'Nom département', employe.nom AS 'Nom employé' FROM employe JOIN dept ON nodep = nodept ORDER BY nodept ASC;

-- Rechercher le nom des employés du département Distribution

SELECT employe.nom FROM employe JOIN dept ON nodep = nodept WHERE dept.nom = 'distribution';

-- Rechercher le nom et le salaire des employés qui gagnent plus que
-- leur patron, et le nom et le salaire de leur patron

SELECT emp.nom, emp.salaire, patron.nom, patron.salaire FROM employe AS emp JOIN employe AS patron ON emp.nosup = patron.noemp WHERE emp.salaire > patron.salaire;

-- Rechercher le nom et le titre des employés qui ont le même titre que
-- Amartakaldire

SELECT nom, titre FROM employe WHERE titre = (SELECT titre FROM employe WHERE nom = 'Amartakaldire');

-- Rechercher le nom, le salaire et le numéro de département des
-- employés qui gagnent plus qu'un seul employé du département 31,
-- classés par numéro de département et salaire.

SELECT nom, salaire, nodep FROM employe WHERE salaire > ANY (SELECT salaire FROM employe WHERE nodep = 31) ORDER BY nodep ASC, salaire ASC;

-- Rechercher le nom, le salaire et le numéro de département des
-- employés qui gagnent plus que tous les employés du département 31,
-- classés par numéro de département et salaire

SELECT nom, salaire, nodep FROM employe WHERE salaire > ALL (SELECT salaire FROM employe WHERE nodep = 31) ORDER BY nodep ASC, salaire ASC;

-- Rechercher le nom et le titre des employés du service 31 qui ont un
-- titre que l'on trouve dans le département 32.

SELECT nom, titre FROM employe WHERE nodep = 31 AND titre IN (SELECT titre FROM employe WHERE nodep = 32);

-- Rechercher le nom et le titre des employés du service 31 qui ont un
-- titre l'on ne trouve pas dans le département 32.

SELECT nom, titre FROM employe WHERE nodep = 31 AND titre NOT IN (SELECT titre FROM employe WHERE nodep = 32);

-- Rechercher le nom, le titre et le salaire des employés qui ont le même
-- titre et le même salaire que Fairant

SELECT nom, titre, salaire FROM employe WHERE titre IN (SELECT titre FROM employe WHERE nom = "Fairent") AND salaire IN (SELECT salaire FROM employe WHERE nom = "Fairent");

-- Rechercher le numéro de département, le nom du département, le
-- nom des employés, en affichant aussi les départements dans lesquels
-- il n'y a personne, classés par numéro de département

SELECT nodep, dept.nom, employe.nom FROM dept LEFT JOIN employe ON nodept = nodep ORDER BY nodept ASC;

-- 1. Calculer le nombre d'employés de chaque titre.

SELECT COUNT(*), titre FROM employe GROUP BY titre;

-- 2. Calculer la moyenne des salaires et leur somme, par région

SELECT nodep, AVG(salaire), SUM(salaire) FROM employe GROUP BY nodep;

-- 3. Afficher les numéros des départements ayant au moins 3 employés.

SELECT nodep, COUNT(*) FROM employe GROUP BY nodep HAVING COUNT(*) >= 3;

-- 4. Afficher les lettres qui sont l'initiale d'au moins trois employés.

SELECT LEFT(nom,1) FROM employe HAVING COUNT(LEFT(nom,1)) >= 3;

-- 5. Rechercher le salaire maximum et le salaire minimum parmi tous les
-- salariés et l'écart entre les deux.

SELECT MAX(salaire), MIN(salaire), (MAX(salaire)-MIN(salaire)) AS ecart FROM employe;

-- 6. Rechercher le nombre de titres différents.

SELECT DISTINCT titre FROM employe;

-- 7. Pour chaque titre, compter le nombre d'employés possédant ce titre.

SELECT DISTINCT titre, COUNT(*) FROM employe GROUP BY titre;

-- 8. Pour chaque nom de département, afficher le nom du département et
-- le nombre d'employés.

SELECT dept.nom, COUNT(noemp) FROM dept JOIN employe ON nodep = nodept GROUP BY nodep;

-- 9. Rechercher les titres et la moyenne des salaires par titre dont la
-- moyenne est supérieure à la moyenne des salaires des Représentants.

SELECT titre, AVG(salaire) FROM employe WHERE salaire > (SELECT AVG(salaire) FROM employe WHERE titre='représentant') GROUP BY titre ORDER BY AVG(salaire) ASC;

-- 10. Rechercher le nombre de salaires renseignés et le nombre de taux de
-- commission renseignés.

SELECT COUNT(salaire), COUNT(tauxcom) FROM employe;