-- Re-create the database clean
DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;

-- Connect to the newly created database
\c universe

--------------------------------------------------
-- 1. TABLE: galaxy
--------------------------------------------------
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  age_in_millions_of_years INT,
  galaxy_types NUMERIC,
  description TEXT NOT NULL,
  distance_from_earth INT UNIQUE
);

--------------------------------------------------
-- 2. TABLE: star
--------------------------------------------------
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  age_in_millions_of_years INT,
  description TEXT NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  distance_from_earth INT UNIQUE
);

--------------------------------------------------
-- 3. TABLE: planet
--------------------------------------------------
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  age_in_millions_of_years INT,
  planet_types NUMERIC,
  description TEXT NOT NULL,
  has_life BOOLEAN DEFAULT FALSE,
  is_spherical BOOLEAN DEFAULT TRUE,
  star_id INT NOT NULL REFERENCES star(star_id),
  distance_from_earth INT UNIQUE
);

--------------------------------------------------
-- 4. TABLE: moon
--------------------------------------------------
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  age_in_millions_of_years INT,
  description TEXT NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  distance_from_earth INT UNIQUE
);

--------------------------------------------------
-- 5. TABLE: planet_types (Required 5th Table)
--------------------------------------------------
CREATE TABLE planet_types (
  planet_types_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  description TEXT NOT NULL,
  is_gas_giant BOOLEAN NOT NULL DEFAULT FALSE
);

--------------------------------------------------
-- DATA INSERTIONS
--------------------------------------------------

-- Insert 6 Galaxy records
INSERT INTO galaxy (name, age_in_millions_of_years, galaxy_types, description, distance_from_earth) 
VALUES
  ('Milky Way', 13600, 1, 'The galaxy containing our Solar System.', 0),
  ('Andromeda', 10000, 1, 'A barred spiral galaxy near Milky Way.', 2500000),
  ('Triangulum', 12000, 1, 'A spiral galaxy located in Triangulum constellation.', 2730000),
  ('Large Magellanic Cloud', 11000, 2, 'A satellite galaxy of the Milky Way.', 163000),
  ('Small Magellanic Cloud', 6500, 2, 'A dwarf irregular galaxy near Milky Way.', 200000),
  ('Sombrero Galaxy', 13250, 1, 'An unbarred spiral galaxy in Virgo.', 31100000);

-- Insert 6 Star records
INSERT INTO star (name, age_in_millions_of_years, description, galaxy_id, distance_from_earth) 
VALUES
  ('Sun', 4600, 'The G-type main-sequence star.', (SELECT galaxy_id FROM galaxy WHERE name = 'Milky Way'), 0),
  ('Proxima Centauri', 4850, 'A small, low-mass red dwarf star.', (SELECT galaxy_id FROM galaxy WHERE name = 'Milky Way'), 4),
  ('Sirius', 242, 'The brightest star in the night sky.', (SELECT galaxy_id FROM galaxy WHERE name = 'Milky Way'), 9),
  ('Betelgeuse', 10, 'A luminous red supergiant star.', (SELECT galaxy_id FROM galaxy WHERE name = 'Milky Way'), 642),
  ('Alpha Andromeda A', 300, 'A bright star in Andromeda galaxy region.', (SELECT galaxy_id FROM galaxy WHERE name = 'Andromeda'), 97),
  ('R136a1', 2, 'Massive star in the Large Magellanic Cloud.', (SELECT galaxy_id FROM galaxy WHERE name = 'Large Magellanic Cloud'), 163000);

-- Insert 12 Planet records
INSERT INTO planet (name, age_in_millions_of_years, planet_types, description, has_life, is_spherical, star_id, distance_from_earth) 
VALUES
  ('Mercury', 4503, 1, 'Smallest planet in the Solar System.', FALSE, TRUE, (SELECT star_id FROM star WHERE name = 'Sun'), 91),
  ('Venus', 4503, 1, 'Second planet with toxic atmosphere.', FALSE, TRUE, (SELECT star_id FROM star WHERE name = 'Sun'), 41),
  ('Earth', 4543, 1, 'Third planet from the Sun with life.', TRUE, TRUE, (SELECT star_id FROM star WHERE name = 'Sun'), 0),
  ('Mars', 4603, 1, 'Fourth planet known as the Red Planet.', FALSE, TRUE, (SELECT star_id FROM star WHERE name = 'Sun'), 78),
  ('Jupiter', 4603, 2, 'Fifth planet and largest in Solar System.', FALSE, TRUE, (SELECT star_id FROM star WHERE name = 'Sun'), 628),
  ('Saturn', 4503, 2, 'Sixth planet known for its rings.', FALSE, TRUE, (SELECT star_id FROM star WHERE name = 'Sun'), 1275),
  ('Uranus', 4503, 3, 'Seventh planet with tilted rotation axis.', FALSE, TRUE, (SELECT star_id FROM star WHERE name = 'Sun'), 2724),
  ('Neptune', 4503, 3, 'Eighth and farthest planet in Solar System.', FALSE, TRUE, (SELECT star_id FROM star WHERE name = 'Sun'), 4351),
  ('Proxima Centauri b', 4850, 1, 'Exoplanet in habitable zone.', FALSE, TRUE, (SELECT star_id FROM star WHERE name = 'Proxima Centauri'), 4),
  ('Proxima Centauri c', 4850, 1, 'Exoplanet orbiting Proxima Centauri.', FALSE, TRUE, (SELECT star_id FROM star WHERE name = 'Proxima Centauri'), 5),
  ('Sirius b Planet candidate', 242, 1, 'Hypothetical exoplanet system.', FALSE, TRUE, (SELECT star_id FROM star WHERE name = 'Sirius'), 9),
  ('R136a1 Planet alpha', 2, 2, 'Volatile gas planet orbiting R136a1.', FALSE, TRUE, (SELECT star_id FROM star WHERE name = 'R136a1'), 163001);

-- Insert 20 Moon records
INSERT INTO moon (name, age_in_millions_of_years, description, planet_id, distance_from_earth) 
VALUES
  ('Moon', 4510, 'Earth natural satellite.', (SELECT planet_id FROM planet WHERE name = 'Earth'), 384),
  ('Phobos', 4500, 'Innermost satellite of Mars.', (SELECT planet_id FROM planet WHERE name = 'Mars'), 78000001),
  ('Deimos', 4500, 'Outermost satellite of Mars.', (SELECT planet_id FROM planet WHERE name = 'Mars'), 78000002),
  ('Io', 4500, 'Innermost Galilean moon of Jupiter.', (SELECT planet_id FROM planet WHERE name = 'Jupiter'), 62800001),
  ('Europa', 4500, 'Galilean moon with an ice shell.', (SELECT planet_id FROM planet WHERE name = 'Jupiter'), 62800002),
  ('Ganymede', 4500, 'Largest satellite in the Solar System.', (SELECT planet_id FROM planet WHERE name = 'Jupiter'), 62800003),
  ('Callisto', 4500, 'Second-largest moon of Jupiter.', (SELECT planet_id FROM planet WHERE name = 'Jupiter'), 62800004),
  ('Mimas', 4500, 'Moon of Saturn discovered in 1789.', (SELECT planet_id FROM planet WHERE name = 'Saturn'), 127500001),
  ('Enceladus', 4500, 'Sixth-largest moon of Saturn.', (SELECT planet_id FROM planet WHERE name = 'Saturn'), 127500002),
  ('Tethys', 4500, 'Mid-sized moon of Saturn.', (SELECT planet_id FROM planet WHERE name = 'Saturn'), 127500003),
  ('Dione', 4500, 'Moon of Saturn discovered by Cassini.', (SELECT planet_id FROM planet WHERE name = 'Saturn'), 127500004),
  ('Rhea', 4500, 'Second-largest moon of Saturn.', (SELECT planet_id FROM planet WHERE name = 'Saturn'), 127500005),
  ('Titan', 4500, 'Largest moon of Saturn.', (SELECT planet_id FROM planet WHERE name = 'Saturn'), 127500006),
  ('Hyperion', 4500, 'Sponge-like moon of Saturn.', (SELECT planet_id FROM planet WHERE name = 'Saturn'), 127500007),
  ('Iapetus', 4500, 'Two-tone colored moon of Saturn.', (SELECT planet_id FROM planet WHERE name = 'Saturn'), 127500008),
  ('Miranda', 4500, 'Smallest major moon of Uranus.', (SELECT planet_id FROM planet WHERE name = 'Uranus'), 272400001),
  ('Ariel', 4500, 'Fourth-largest moon of Uranus.', (SELECT planet_id FROM planet WHERE name = 'Uranus'), 272400002),
  ('Umbriel', 4500, 'Moon of Uranus discovered in 1851.', (SELECT planet_id FROM planet WHERE name = 'Uranus'), 272400003),
  ('Titania', 4500, 'Largest moon of Uranus.', (SELECT planet_id FROM planet WHERE name = 'Uranus'), 272400004),
  ('Triton', 4500, 'Largest satellite of Neptune.', (SELECT planet_id FROM planet WHERE name = 'Neptune'), 435100001);

-- Insert 5 Planet Types records
INSERT INTO planet_types (name, description, is_gas_giant)
VALUES
  ('Terrestrial', 'Solid surface made of silicates and metals.', FALSE),
  ('Gas Giant', 'Composed primarily of hydrogen and helium.', TRUE),
  ('Ice Giant', 'Composed mainly of water, ammonia, and methane.', FALSE),
  ('Dwarf Planet', 'Massive enough to be spherical but hasn''t cleared orbit.', FALSE),
  ('Super-Earth', 'Mass larger than Earth, smaller than ice giants.', FALSE);