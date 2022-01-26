SELECT  A.ARTIST_USER_ID,
        U.NAME,
        U.SURNAME,
        A.RATING
FROM    ARTIST A LEFT JOIN PAINTPLZ_USER U 
ON U.PAINTPLZ_USER_ID = A.ARTIST_USER_ID
WHERE     LOCATE(@artistName, U.NAME) > 0 AND
        @minimumPriceRate <= A.MIN_PRICE AND
        @maximumPriceRate >= A.MAX_PRICE AND
        @minimumRating <= A.RATING AND
        @maximumRating >= A.RATING AND
        (@artworkTagName = "" OR EXISTS(
            SELECT W.ARTIST_USER_ID
            FROM ARTWORK W, ARTWORK_ARTTAG AA, ART_TAG T
            WHERE     A.ARTIST_USER_ID = W.ARTIST_USER_ID AND
                    W.ART_ID = AA.TAG_ID AND
                    T.TAG_ID = AA.TAG_ID AND
                    FIND_IN_SET(T.TAG_NAME, @artworkTagName) > 0
        ));