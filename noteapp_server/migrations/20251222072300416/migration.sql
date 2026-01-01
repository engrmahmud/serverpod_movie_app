BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "movie" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "movie" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "desc" text NOT NULL,
    "year" bigint NOT NULL,
    "imagUrl" text NOT NULL,
    "logline" text NOT NULL,
    "directorname" text NOT NULL
);


--
-- MIGRATION VERSION FOR noteapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('noteapp', '20251222072300416', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251222072300416', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20251208110420531-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110420531-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
