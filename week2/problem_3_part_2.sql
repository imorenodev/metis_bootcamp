SELECT COUNT(*), galleries.name
FROM images
JOIN galleries ON galleries.id= images.gallery_id
GROUP BY galleries.name;