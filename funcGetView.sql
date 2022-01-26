DELIMITER //
CREATE FUNCTION GET_TOTAL_VIEW(ARTIST_ID VARCHAR(100))
	RETURNS INT
	DETERMINISTIC
BEGIN
	DECLARE artView INT;	
    DECLARE galleryView INT;

	SELECT COUNT(*) INTO artview 
	FROM VIEW_ART V, ARTWORK W
	WHERE W.ARTIST_USER_ID = ARTIST_ID AND V.ART_ID = W.ART_ID;
	
	SELECT COUNT(*) INTO galleryView  
	FROM VIEW_GALLERY VG, GALLERY G
	WHERE G.ARTIST_USER_ID = ARTIST_ID AND VG.ART_ID = G.GALLERY_ID;
	
	RETURN artView + galleryView;
END //
DELIMITER ;
