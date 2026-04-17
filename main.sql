-- 1-mashq
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM logs l1
JOIN logs l2 ON l1.id = l2.id - 1 AND l1.num = l2.num
JOIN logs l3 ON l1.id = l3.id - 2 AND l1.num = l3.num;
-- 2-mashq
SELECT h.hacker_id, h.name
FROM hackers h
JOIN submissions s ON h.hacker_id = s.hacker_id
JOIN challenges c ON s.challenge_id = c.challenge_id
JOIN difficulty d ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(DISTINCT c.challenge_id) > 1
ORDER BY COUNT(DISTINCT c.challenge_id) DESC, h.hacker_id;
