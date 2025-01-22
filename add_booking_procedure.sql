CREATE PROCEDURE AddBooking(IN booking_id INT ,IN table_number INT,  IN guestfirstname VARCHAR(225), IN guestlastname VARCHAR(225),IN bookingslot TIME,IN employeID INT)
BEGIN
	INSERT INTO Bookings VALUES(booking_id,table_number,guestfirstname,guestlastname,bookingslot,employeID);
    SELECT "New Booking added successfully";
END // 

DELIMITER ;

-- CALL AddBooking(17,14,"SIMEAN","HAMADO","20:00:02",2);