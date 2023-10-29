-- //Train Project queries//

-- Given a passenger’s last name and first name and retrieve all trains they are booked on.
SELECT T.Train_Name, B.Train_Number
FROM BOOKED B, PASSENGER P, TRAIN T
WHERE P.First_Name = "James" AND P.Last_Name = "Butt" AND B.SSN = P.SSN 
        AND B.Ticket_Status = "Booked" AND B.Train_Number = T.Train_Number;

-- Given a day list the passengers traveling on that day with confirmed tickets. 
SELECT P.First_Name, P.Last_Name
FROM TRAIN_STATUS TS, TRAIN T, PASSENGER P, BOOKED B
WHERE TS.Train_Date = "Saturday" AND T.Train_Name = TS.Train_Name AND T.Train_Number = B.Train_Number AND B.SSN = P.SSN AND B.Ticket_Status = "Booked";

-- List train name, day and number of passenger on that train. 
SELECT Train_Name, Train_Date, (Premium_Occupied + General_Occupied)
FROM TRAIN_STATUS;

-- Enter a train name and retrieve all the passengers with confirmed status traveling on that train.
SELECT P.First_Name, P.Last_Name
FROM PASSENGER P, BOOKED B, TRAIN T
WHERE T.Train_Name LIKE "%Golden Arrow%" AND T.Train_Number = B.Train_Number AND B.Ticket_Status = "Booked" AND B.SSN = P.SSN;

-- List passengers that are waitlisted including the name of the train.
SELECT P.First_Name, P.Last_Name, T.Train_Name
FROM PASSENGER P, TRAIN T, BOOKED B
WHERE B.Ticket_Status = "WaitL" AND B.Train_Number = T.Train_Number AND B.SSN = P.SSN;

-- List passenger names in descending order that have '605' phone area code.
SELECT First_Name
FROM PASSENGER
WHERE Phone_Number LIKE "605%"
ORDER BY First_Name DESC;

-- List name of passengers that are traveling on Thursdays in ascending order.
SELECT P.First_Name, P.Last_Name
FROM PASSENGER P, TRAIN_STATUS TS, BOOKED B, TRAIN T
WHERE TS.Train_Date = "Tuesday" AND T.Train_Name = TS.Train_Name AND T.Train_Number = B.Train_Number AND B.SSN = P.SSN
ORDER BY P.First_Name ASC, P.Last_Name ASC;