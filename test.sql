-- optimize queries performance 
CREATE INDEX visits_animals_id ON visits(animal_id);
CREATE INDEX visits_vets_id ON visits(vets_id);
CREATE INDEX visits_owners_id ON owners(email); 
