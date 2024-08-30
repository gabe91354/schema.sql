-- Create Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Friends Table
CREATE TABLE Friends (
    FriendID INT PRIMARY KEY AUTO_INCREMENT,
    FriendWhoAdded INT,
    FriendBeingAdded INT,
    IsAccepted BOOLEAN,
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (FriendWhoAdded) REFERENCES Users(UserID),
    FOREIGN KEY (FriendBeingAdded) REFERENCES Users(UserID)
);

-- Create Groups Table
CREATE TABLE Groups (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(100) NOT NULL,
    CreatedBy INT,
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserID)
);

-- Create Posts Table
CREATE TABLE Posts (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    PostDescription VARCHAR(255) NOT NULL,
    PostedBy INT,
    IsPublic BOOLEAN,
    IsOnlyForFriends BOOLEAN,
    GroupID INT,
    DatePosted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostedBy) REFERENCES Users(UserID),
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
);

-- Create Group Membership Requests Table
CREATE TABLE GroupMembershipRequests (
    GroupMemberShipRequestsID INT PRIMARY KEY AUTO_INCREMENT,
    GroupID INT,
    GroupMemberUserID INT,
    IsGroupMemberShipAccepted BOOLEAN,
    DateAccepted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (GroupMemberUserID) REFERENCES Users(UserID)
);
