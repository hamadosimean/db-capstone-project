DELIMITER //
CREATE PROCEDURE CheckBooking(booking_slot TIME,table_number INT)
BEGIN
    DECLARE status INT;
    SELECT COUNT(*) INTO status FROM Bookings WHERE BookingSlot = booking_slot AND TableNo = table_number;
    IF status < 0 THEN 
		SELECT CONCAT("Table", " ", table_number, " ", "is available") as Status;
	ELSE 
		SELECT CONCAT("Table", " ",table_number, " ", "is already booked") as Status;
    END IF;
END //

DELIMITER ;