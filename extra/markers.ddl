CREATE TABLE geopanpoint (
    id character varying(150) NOT NULL,
    latlng point,
    taken date,
    copy character varying(50),
    descr character varying(150)
);