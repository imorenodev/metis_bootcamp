SELECT galleries.id FROM galleries
JOIN images ON galleries.id = images.gallery_id;