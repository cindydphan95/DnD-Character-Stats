
SELECT * FROM dnd_chars;

--Let's clean up the data

ALTER TABLE dnd_chars
DROP COLUMN finger;

ALTER TABLE dnd_chars
DROP COLUMN hash;

--What is the most popular class and level?

SELECT class, justClass, COUNT(justClass) AS sum_class FROM dnd_chars
GROUP BY justClass, class
ORDER BY sum_class DESC;

--What about race or background?

SELECT race, COUNT(race) AS sum_race FROM dnd_chars
GROUP BY race
ORDER BY sum_race DESC;

SELECT background, COUNT(background) AS sum_bg FROM dnd_chars
GROUP BY background
ORDER BY sum_bg DESC;

--Which country produced the most characters?

SELECT country, COUNT(countryCode) AS sum_country FROM dnd_chars
GROUP BY country
ORDER BY sum_country DESC;

--Highest level character?

SELECT race, class, subclass, MAX(level) AS highest_lvl FROM dnd_chars
GROUP BY race, class, subclass
ORDER BY highest_lvl DESC;

--Percentage of characters made in each country

SELECT country, COUNT(country) * 100.0 / SUM(COUNT(country)) OVER () AS percentage FROM dnd_chars
GROUP BY country
ORDER BY percentage DESC;

