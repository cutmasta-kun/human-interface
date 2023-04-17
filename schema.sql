CREATE TABLE persons (
  id UUID PRIMARY KEY
);

CREATE TABLE interactions (
  id UUID PRIMARY KEY,
  type VARCHAR(255),
  filters JSONB,
  source_person_id UUID REFERENCES persons(id),
  target_person_ids UUID[] REFERENCES persons(id)
);

CREATE TABLE informations (
  id UUID PRIMARY KEY,
  content TEXT,
  category VARCHAR(255),
  related_information_ids UUID[] REFERENCES informations(id),
  interaction_id UUID REFERENCES interactions(id),
  person_id UUID REFERENCES persons(id)
);
