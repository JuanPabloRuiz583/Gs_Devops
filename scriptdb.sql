-- SQL
CREATE TABLE vaga
(
    id         BIGINT IDENTITY(1,1) NOT NULL,
    titulo     VARCHAR(120),
    requisitos VARCHAR(300),
    empresa    VARCHAR(100),
    local      VARCHAR(200),
    CONSTRAINT pk_vaga PRIMARY KEY (id)
);

CREATE TABLE candidatura
(
    id               BIGINT IDENTITY(1,1) NOT NULL,
    vaga_id          BIGINT NOT NULL,
    nome             VARCHAR(150) NOT NULL,
    email            VARCHAR(200),
    telefone         VARCHAR(50),
    curriculo        VARCHAR(MAX),
    status           VARCHAR(50) DEFAULT 'PENDENTE',
    data_aplicacao   DATETIMEOFFSET DEFAULT SYSDATETIMEOFFSET(),
    CONSTRAINT pk_candidatura PRIMARY KEY (id),
    CONSTRAINT fk_candidatura_vaga FOREIGN KEY (vaga_id) REFERENCES vaga (id) ON DELETE CASCADE
);

CREATE INDEX idx_candidatura_vaga_id ON candidatura (vaga_id);