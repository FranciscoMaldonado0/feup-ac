PRAGMA foreign_keys=OFF;
-- BEGIN TRANSACTION;
-- .mode columns
-- .headers on

---------------------

DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS coaches;
DROP TABLE IF EXISTS awards_players;
DROP TABLE IF EXISTS players_teams;
DROP TABLE IF EXISTS series_post;
DROP TABLE IF EXISTS teams_post;

---------------------

CREATE TABLE players(
  bioID TEXT PRIMARY KEY,
  pos TEXT,
  firstseason INTEGER,
  lastseason INTEGER,
  height REAL,
  weight INTEGER,
  college TEXT,
  collegeOther TEXT,
  birthDate TEXT,
  deathDate TEXT
);

CREATE TABLE teams(
  year INTEGER,
  lgID TEXT,
  tmID TEXT,
  franchID TEXT,
  confID TEXT,
  divID TEXT,
  rank INTEGER,
  playoff TEXT,
  seeded INTEGER,
  firstRound TEXT,
  semis TEXT,
  finals TEXT,
  name TEXT,
  o_fgm INTEGER,
  o_fga INTEGER,
  o_ftm INTEGER,
  o_fta INTEGER,
  o_3pm INTEGER,
  o_3pa INTEGER,
  o_oreb INTEGER,
  o_dreb INTEGER,
  o_reb INTEGER,
  o_asts INTEGER,
  o_pf INTEGER,
  o_stl INTEGER,
  o_to INTEGER,
  o_blk INTEGER,
  o_pts INTEGER,
  d_fgm INTEGER,
  d_fga INTEGER,
  d_ftm INTEGER,
  d_fta INTEGER,
  d_3pm INTEGER,
  d_3pa INTEGER,
  d_oreb INTEGER,
  d_dreb INTEGER,
  d_reb INTEGER,
  d_asts INTEGER,
  d_pf INTEGER,
  d_stl INTEGER,
  d_to INTEGER,
  d_blk INTEGER,
  d_pts INTEGER,
  tmORB INTEGER,
  tmDRB INTEGER,
  tmTRB INTEGER,
  opptmORB INTEGER,
  opptmDRB INTEGER,
  opptmTRB INTEGER,
  won INTEGER,
  lost INTEGER,
  GP INTEGER,
  homeW INTEGER,
  homeL INTEGER,
  awayW INTEGER,
  awayL INTEGER,
  confW INTEGER,
  confL INTEGER,
  min INTEGER,
  attend INTEGER,
  arena TEXT,
  PRIMARY KEY(year, tmID)
);

CREATE TABLE coaches(
  coachID TEXT,
  year INTEGER,
  tmID TEXT,
  lgID TEXT,
  stint INTEGER,
  won INTEGER,
  lost INTEGER,
  post_wins INTEGER,
  post_losses INTEGER,
  PRIMARY KEY(coachID, year, tmID, stint),
  CONSTRAINT fk_year_tmID FOREIGN KEY(year, tmID) REFERENCES teams(year, tmID)
);



CREATE TABLE awards_players(
  playerID TEXT,
  award TEXT,
  year INTEGER,
  lgID TEXT,
  CONSTRAINT fk_playerID FOREIGN KEY(playerID) REFERENCES players(bioID)
);



CREATE TABLE players_teams(
  playerID TEXT,
  year INTEGER,
  stINTEGER INTEGER,
  tmID TEXT,
  lgID TEXT,
  GP INTEGER,
  GS INTEGER,
  minutes INTEGER,
  points INTEGER,
  oRebounds INTEGER,
  dRebounds INTEGER,
  rebounds INTEGER,
  assists INTEGER,
  steals INTEGER,
  blocks INTEGER,
  turnovers INTEGER,
  PF INTEGER,
  fgAttempted INTEGER,
  fgMade INTEGER,
  ftAttempted INTEGER,
  ftMade INTEGER,
  threeAttempted INTEGER,
  threeMade INTEGER,
  dq INTEGER,
  PostGP INTEGER,
  PostGS INTEGER,
  PostMinutes INTEGER,
  PostPoints INTEGER,
  PostoRebounds INTEGER,
  PostdRebounds INTEGER,
  PostRebounds INTEGER,
  PostAssists INTEGER,
  PostSteals INTEGER,
  PostBlocks INTEGER,
  PostTurnovers INTEGER,
  PostPF INTEGER,
  PostfgAttempted INTEGER,
  PostfgMade INTEGER,
  PostftAttempted INTEGER,
  PostftMade INTEGER,
  PostthreeAttempted INTEGER,
  PostthreeMade INTEGER,
  PostDQ INTEGER,
  CONSTRAINT fk_playerID FOREIGN KEY(playerID) REFERENCES players(bioID),
  CONSTRAINT fk_year_tmID FOREIGN KEY(year, tmID) REFERENCES teams(year, tmID)
);

CREATE TABLE series_post(
  year INTEGER,
  round TEXT,
  series TEXT,
  tmIDWinner TEXT,
  lgIDWinner TEXT,
  tmIDLoser TEXT,
  lgIDLoser TEXT,
  W INTEGER,
  L INTEGER,
  CONSTRAINT fk_year_tmIDWinner FOREIGN KEY(year, tmIDWinner) REFERENCES teams(year, tmID),
  CONSTRAINT fk_year_tmIDLoser FOREIGN KEY(year, tmIDLoser) REFERENCES teams(year, tmID)
);
CREATE TABLE teams_post(
  year INTEGER,
  tmID TEXT,
  lgID TEXT,
  W INTEGER,
  L INTEGER,
  CONSTRAINT fk_year_tmID FOREIGN KEY(year, tmID) REFERENCES teams(year, tmID)
);

-- COMMIT;