CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  date_of_birth DATE,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
id INT GENERATED ALWAYS AS IDENTITY,
admitted_at TIMESTAMP,
patient_id INT,
status VARCHAR(255),
ADD CONSTRAINT fk_patients
FOREIGN KEY (patient_id)
REFERENCES patients(id),
PRIMARY KEY (id)
); 

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  ADD CONSTRAINT fk_medical_histories
  FOREIGN KEY (medical_history_id)
  REFERENCES medical_histories(id),
  PRIMARY KEY (id)
);

CREATE TABLE treatments (
id INT GENERATED ALWAYS AS IDENTITY,
type VARCHAR(255),
name VARCHAR(255),
PRIMARY KEY (id)
); 

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  ADD CONSTRAINT fk_invoices
  FOREIGN KEY (invoice_id)
  REFERENCES invoices(id),
  ADD CONSTRAINT fk_treatments
  FOREIGN KEY (treatment_id)
  REFERENCES treatments(id),
  PRIMARY KEY (id)
);