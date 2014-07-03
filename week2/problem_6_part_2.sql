SELECT galleries.name
FROM galleries
JOIN images ON galleries.id = images.gallery_id
GROUP BY galleries.id
ORDER BY COUNT(images.id) DESC
LIMIT 1;