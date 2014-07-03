SELECT gallery_id, COUNT(*) 
FROM images
GROUP BY gallery_id
ORDER BY count DESC
LIMIT 1;