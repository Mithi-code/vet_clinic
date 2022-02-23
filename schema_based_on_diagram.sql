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
