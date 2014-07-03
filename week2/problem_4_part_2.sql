SELECT images.gallery_id, COUNT(*)
FROM galleries
JOIN images ON galleries.id = images.gallery_id
WHERE images.name ILIKE '%sushi%'
GROUP BY images.gallery_id;