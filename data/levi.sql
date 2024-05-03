CREATE TABLE "Context" (
  "context_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "context_type" TEXT NOT NULL
);

CREATE TABLE "Marmoset" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "species" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "sex" TEXT NOT NULL
);

CREATE TABLE "Signal_info" (
  "signal_info_id" INTEGER NOT NULL PRIMARY KEY,
  "signal_type" TEXT NOT NULL,
  "file_name" DATE NOT NULL,
  "context" INTEGER NOT NULL REFERENCES "Context" ("context_id") ON DELETE CASCADE,
  "marmoset" INTEGER NOT NULL REFERENCES "Marmoset" ("id") ON DELETE CASCADE,
  "video_date" TEXT NOT NULL
);

CREATE INDEX "idx_signal_info__context" ON "Signal_info" ("context");

CREATE INDEX "idx_signal_info__marmoset" ON "Signal_info" ("marmoset");

CREATE TABLE "Variable" (
  "variable_id" INTEGER NOT NULL PRIMARY KEY,
  "signal_info" INTEGER REFERENCES "Signal_info" ("signal_info_id") ON DELETE CASCADE,
  "final_interaction_outcome" TEXT NOT NULL,
  "recipient_id" TEXT NOT NULL,
  "response_waiting_while_persisting" TEXT NOT NULL,
  "response_waiting_at_end" TEXT NOT NULL,
  "persistence" TEXT NOT NULL,
  "reciever_attending_before" TEXT NOT NULL,
  "reciever_attending_after" TEXT NOT NULL,
  "receiver_immediate_response" TEXT NOT NULL,
  "video_quality" TEXT NOT NULL,
  "elaboration" TEXT NOT NULL,
  "presumed_goal" TEXT NOT NULL,
  "mechanical_ineffectiveness" TEXT NOT NULL,
  "signaler_id" TEXT NOT NULL
);

CREATE INDEX "idx_variable__signal_info" ON "Variable" ("signal_info");




INSERT INTO marmoset (id, species, name, sex) VALUES 
  (1, 'White Fronted Marmoset', 'Coral', 'F'),
  (2, 'White Fronted Marmoset', 'Inferno', 'M'),
  (3, 'White Fronted Marmoset', 'Baby Marmoset', 'N/A');

INSERT INTO context (context_type) VALUES 
  ('play'),
  ('groom'),
  ('locomotion'),
  ('affiliative'),
  ('agonistic');

INSERT INTO signal_info (signal_info_id, signal_type, context, marmoset,  file_name, video_date) VALUES 
  (1, 'hand_gesture', 'groom', 2, '5_23_23 VID3_Saki LN.eaf', '5/23/23'),
  (2, 'face_protruded_lips', 2, 'affiliative', '5_23_23_VID8_Saki LN.eaf',   '5/23/23'),
  (3, 'body_gesture', 'groom', 1, '5_23_23_VID31_Saki LN.eaf', '5/23/23'),
  (4, 'body_gesture', 'affiliative', 2, '5_23_23_VID8_Saki LN.eaf',           '5/23/23'),
  (5, 'body_gesture', 'groom', 1, '8_8_23_VID2_Saki LN.eaf', '8/8/23'),
  (6, 'hand_gesture', 'affiliative', 3, '8_8_23_VID2_Saki LN.eaf','8/8/23'),
  (7, 'hand_gesture', 'play', 3, '8_8_23_VID2_Saki LN.eaf','8/8/23'),
  (8, 'hand_gesture', 'play', 3, '8_8_23_VID2_Saki LN.eaf','8/8/23'),
  (9, 'hand_gesture', 'play', 2, '8_8_23_VID2_Saki LN.eaf','8/8/23'),
  (10, 'head_gesture', 'food', 3, '7_25_23_VID8_Saki LN.eaf', '7/25/23'),
  (11, 'head_gesture', 'food', 3, '8_8_23_VID2_Saki LN.eaf','7/25/23'),
  (12, 'head_gesture', 'agonistic', 1, '8_8_23_VID2_Saki LN.eaf','7/25/23');


INSERT INTO variable (signal_info, final_interaction_outcome, recipient_id, response_waiting_while_persisting, response_waiting_at_end, persistence, reciever_attending_before, reciever_attending_after, receiver_immediate_response, video_quality, elaboration, presumed_goal, mechanical_ineffectiveness, signaler_id) VALUES 
  (1, 'yes', 'coral', 'no', 'no', 'yes', 'no', 'yes', 'no', 'good', 'no', 'yes', 'no', 'inferno'),
  (2, 'yes', 'coral', 'yes', 'yes', 'yes', 'no', 'yes', 'no', 'good', 'yes', 'yes', 'yes', 'inferno'),
  (3, 'yes', 'inferno', 'no', 'yes', 'no', 'yes', 'yes', 'no', 'good', 'no', 'yes', 'yes', 'coral'),
  (4, 'yes', 'coral', 'yes', 'unsure', 'yes', 'no', 'no', 'yes', 'excellent', 'no', 'yes', 'yes', 'inferno'),
  (5, 'yes', 'inferno', 'yes', 'yes', 'yes', 'no', 'no', 'no', 'good', 'no', 'yes', 'yes', 'coral');
   


SELECT si.video_date
FROM signal_info si
JOIN marmoset m ON m.id = si.marmoset 
JOIN context c ON si.context = c.context_id
JOIN variable v ON si.signal_info_id = v.signal_info
WHERE context_type = 'groom' AND v.final_interaction_outcome = 'yes';
        




  

  
  
