-- ===================================================================
-- = Name: posts; Type: TABLE; Schema: public; Owner: 0; Tablespace: =
-- ===================================================================

CREATE TABLE posts (
    id integer NOT NULL,
    title character varying(255),
    body text,
    created_at timestamp without time zone,
    published_on date,
    published boolean,
    rating double precision
);
