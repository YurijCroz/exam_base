CREATE TABLE "Conversations"(
  "id" serial PRIMARY KEY,
  "participant0" integer REFERENCES "Users"("id") NOT NULL,
  "participant1" integer REFERENCES "Users"("id") NOT NULL,
  "blackList" boolean ARRAY[2] DEFAULT ARRAY[false, false],
  "favoriteList" boolean ARRAY[2] DEFAULT ARRAY[false, false],
  "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
  "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE "Messages"(
  "id" serial PRIMARY KEY,
  "sender" integer REFERENCES "Users"("id") NOT NULL,
  "body" text NOT NULL,
  "conversation" integer REFERENCES "Conversations"("id") NOT NULL,
  "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
  "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE "Catalogs"(
  "id" serial PRIMARY KEY,
  "userId" integer REFERENCES "Users"("id") NOT NULL,
  "catalogName" varchar(64) NOT NULL,
  "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
  "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE "ConversationsToCatalogs"(
  "id" serial PRIMARY KEY,
  "conversationId" integer REFERENCES "Conversations"("id") NOT NULL,
  "catalogId" integer REFERENCES "Catalogs"("id") NOT NULL,
  "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
  "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);