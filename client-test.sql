/*
	SQL for SQLite
*/

CREATE TABLE Client (
    id INTEGER PRIMARY KEY,
    company_name string  NOT NULL ,
	email string NOT NULL,
    id_state INTEGER  NOT NULL ,
	FOREIGN KEY(id_state) REFERENCES State (id)
);

CREATE TABLE State (
    id INTEGER PRIMARY KEY,
    code string  NOT NULL ,
    state_name string  NOT NULL
);

CREATE TABLE Telephone (
    id INTEGER PRIMARY KEY,
    client_id INTEGER NOT NULL ,
    number string NOT NULL ,
    telephone_type_id INTEGER NOT NULL ,
	FOREIGN KEY(client_id) REFERENCES Client (id),
	FOREIGN KEY(telephone_type_id) REFERENCES TelephoneType (id)
);

CREATE TABLE TelephoneType (
    id INTEGER PRIMARY KEY,
    description string  NOT NULL
);

INSERT INTO TelephoneType (id, description) VALUES (null, "celular");
INSERT INTO TelephoneType (id, description) VALUES (null, "comercial");


INSERT INTO State (id, code, state_name) VALUES (null, "SP", "São Paulo");
INSERT INTO State (id, code, state_name) VALUES (null, "RJ", "Rio de Janeiro");
INSERT INTO State (id, code, state_name) VALUES (null, "DF", "Distrito Federal");


INSERT INTO Client (id, company_name, email, id_state) VALUES (null, "ABC .co", "contact@abc.com", 1);
INSERT INTO Client (id, company_name, email, id_state) VALUES (null, "XYZ .inc", "contact@xyz.inc", 2);
INSERT INTO Client (id, company_name, email, id_state) VALUES (null, "NNN .org", "contact@nnn.org", 1);


INSERT INTO Telephone (id, client_id, number, telephone_type_id) VALUES (null, 1, "1211232141", 1);
INSERT INTO Telephone (id, client_id, number, telephone_type_id) VALUES (null, 1, "2222222222", 1);
INSERT INTO Telephone (id, client_id, number, telephone_type_id) VALUES (null, 1, "3333333333", 2);

INSERT INTO Telephone (id, client_id, number, telephone_type_id) VALUES (null, 2, "3333333333", 1);
INSERT INTO Telephone (id, client_id, number, telephone_type_id) VALUES (null, 2, "5555555555", 2);

INSERT INTO Telephone (id, client_id, number, telephone_type_id) VALUES (null, 3, "7777777777", 1);

select s.code, c.company_name, c.email, t.number, tt.description from Client as c
	join State as s on c.id_state = s.id
	join Telephone as t on t.client_id = c.id
	join TelephoneType as tt on t.telephone_type_id = tt.id
	where s.code = "SP";
