SELECT name, gallery_id
FROM images
WHERE id IN (
    SELECT MIN(id)
    FROM images
    GROUP BY gallery_id
);