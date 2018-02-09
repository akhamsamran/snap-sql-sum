


ALTER DATABASE kmaru CHARACTER SET utf8 COLLATE utf8_unicode_ci;
DROP TABLE IF EXISTS ledger;
DROP TABLE IF EXISTS card;



-- card table:
CREATE TABLE card(
	-- attribute for primary key:
	cardId BINARY(16) NOT NULL,
	-- attribute for foreign key:
	cardCategoryId BINARY(16) NOT NULL,
	-- attributes for card:
	cardAnswer VARCHAR(255) NOT NULL,
	cardPoints FLOAT,
	cardQuestion VARCHAR(255),
	-- unique index created:
	INDEX (cardCategoryId),
	INDEX (cardPoints),
	-- create foreign keys and relationships:
	FOREIGN KEY (cardCategoryId) REFERENCES category(categoryId),
	-- Primary Key:
	PRIMARY KEY(cardId)
);


-- ledger table:
CREATE TABLE ledger(
	-- attribute for foreign keys:
	ledgerBoardId BINARY(16) NOT NULL,
	ledgerCardId BINARY(16) NOT NULL,
	ledgerProfileId BINARY(16) NOT NULL,
	-- attributes for ledger:
	ledgerPoints FLOAT,
	ledgerType TINYINT UNSIGNED,
	-- unique index created:
	INDEX (ledgerBoardId),
	INDEX (ledgerCardId),
	INDEX (ledgerProfileId),
	-- create foreign keys and relationships:
	FOREIGN KEY (ledgerBoardId) REFERENCES board(boardId),
	FOREIGN KEY (ledgerCardId) REFERENCES card(cardId),
	FOREIGN KEY (ledgerProfileId) REFERENCES profile(profileId),
	-- Primary Key (compound key):
	PRIMARY KEY (ledgerBoardId, ledgerCardId, ledgerProfileId)
);

-- write a FUNCTION (not a procedure) in mySQL that takes two inputs as FLOAT and returns the sum of the two inputs as FLOAT

DROP FUNCTION IF EXISTS addTwoNumbers(first FLOAT, second FLOAT) RETURNS FLOAT
SELECT SUM(ledger.ledgerPoints, card.cardPoints)
FROM ledger, card
[WHERE conditions];