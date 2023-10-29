DROP TABLE IF EXISTS TRAIN;
CREATE TABLE TRAIN (
    Train_Number int NOT NULL,
    Train_Name varchar(25) NOT NULL,
    Premium_Fare int NOT NULL,
    General_Fare int NOT NULL,
    Source varchar(15) NOT NULL,
    Destination varchar(15) NOT NULL,
    CONSTRAINT pk_Train primary key (Train_Number),
    CONSTRAINT uq_Train UNIQUE (Train_Name)
);

CREATE TABLE AVAILABILITY (
    Train_Number int NOT NULL,
    Day_Available varchar(10) NOT NULL,
    CONSTRAINT pk_Availability primary key (Train_Number, Day_Available),
    CONSTRAINT fk_avail_train foreign key (Train_Number) REFERENCES TRAIN (Train_Number)
);

DROP TABLE IF EXISTS PASSENGER;
CREATE TABLE PASSENGER (
    First_Name varchar(15) NOT NULL,
    Last_Name varchar(15) NOT NULL, 
    Street varchar(25) NOT NULL,
    City varchar(15) NOT NULL,
    County varchar(15) NOT NULL,
    Phone_Number varchar(15),
    SSN int NOT NULL,
    Birthday date NOT NULL,
    CONSTRAINT pk_Passenger primary key (SSN)
);

DROP TABLE IF EXISTS BOOKED;
CREATE TABLE BOOKED (
    Booking_ID int PRIMARY KEY AUTOINCREMENT,
    SSN char(9) NOT NULL,
    Train_Number int NOT NULL,
    Ticket_Type varchar(15) NOT NULL,
    Ticket_Status varchar(15) NOT NULL,
    CONSTRAINT fk_booked_train foreign key (Train_Number) REFERENCES TRAIN (Train_Number),
    CONSTRAINT fk_booked_pass foreign key (SSN) REFERENCES PASSENGER (SSN)
);

DROP TABLE IF EXISTS TRAIN_STATUS;
CREATE TABLE TRAIN_STATUS (
    Train_Date varchar(10) NOT NULL,
    Train_Name varchar(25) NOT NULL,
    Premium_Available int DEFAULT 10,
    General_Available int DEFAULT 10,
    Premium_Occupied int DEFAULT 0,
    General_Occupied int DEFAULT 0,
    CONSTRAINT pk_Train_Status primary key (Train_Date, Train_Name),
    CONSTRAINT fk_status_train foreign key (Train_Name) REFERENCES TRAIN (Train_Name),
    CONSTRAINT chk_Poccupancy CHECK (Premium_Occupied <= 10),
    CONSTRAINT chk_Goccupancy CHECK (General_Occupied <= 10)
);




