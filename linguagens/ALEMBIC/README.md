# Alembic — revisões de migração SQLAlchemy

Alembic é a ferramenta de migração de banco de dados do ecossistema SQLAlchemy; não é uma linguagem de programação independente. Os arquivos desta pasta são exemplos de scripts de revisão Python: cada um declara `revision` e `down_revision` e implementa mudanças em `upgrade()` e `downgrade()` usando `alembic.op`.

Cada arquivo é uma revisão didática independente, não um elo da mesma cadeia. Eles usam `down_revision = None` e não devem ser copiados todos para o mesmo diretório `versions/`, pois isso criaria várias cabeças de revisão. Os docstrings de cada fonte informam a operação e o esquema prévio necessário. A reversão de uma mudança destrutiva pode recuperar a estrutura, mas não dados já removidos.

## Exemplos

1. `exemplo_1.py` — criar a tabela `account`.
2. `exemplo_2.py` — adicionar uma coluna opcional.
3. `exemplo_3.py` — remover uma coluna em modo batch, compatível com SQLite.
4. `exemplo_4.py` — alterar o tipo de uma coluna em modo batch.
5. `exemplo_5.py` — criar tabela com restrição de unicidade.
6. `exemplo_6.py` — remover tabela e restaurar sua estrutura na reversão.
7. `exemplo_7.py` — renomear tabela.
8. `exemplo_8.py` — renomear coluna em modo batch.
9. `exemplo_9.py` — inserir dados iniciais com `op.bulk_insert()` e removê-los por chaves estáveis.
10. `exemplo_10.py` — executar uma instrução SQL controlada com `op.execute()`.

## Exercícios resolvidos

1. Criar um índice não exclusivo para e-mail.
2. Adicionar uma coluna booleana opcional.
3. Tornar e-mail obrigatório quando os dados existentes já satisfazem a condição.
4. Preencher dados históricos em uma coluna de status.
5. Criar uma tabela de eventos com chave estrangeira.
6. Criar um índice exclusivo de e-mail.
7. Adicionar uma restrição `CHECK` nomeada.
8. Criar e preencher uma coluna `display_name`.
9. Criar um índice composto.
10. Registrar uma operação Alembic customizada para criar e remover uma tabela de auditoria.

## Ambiente e execução

A pasta contém somente as vinte revisões de exemplo e este README. Ela não contém `alembic.ini`, `env.py`, `script.py.mako`, `versions/` nem um banco da aplicação; portanto, executar `python arquivo.py` não aplica a migração. A URL do banco, o ambiente da CLI e as dependências pertencem ao projeto Alembic que usa a revisão.

Para experimentar **um arquivo por vez**, crie um ambiente novo, configure um banco descartável e coloque apenas a revisão escolhida em `alembic/versions/`:

```sh
python -m venv .venv
. .venv/bin/activate
python -m pip install "alembic==1.20.1"
alembic init alembic
```

Configure `sqlalchemy.url` em `alembic.ini` para um arquivo SQLite temporário, copie uma revisão para `alembic/versions/` e crie o esquema prévio descrito no docstring dela, quando houver. Em seguida, `alembic upgrade head` aplica a revisão e `alembic downgrade base` a reverte. Faça isso somente em um banco descartável. `batch_alter_table()` usa o fluxo de reconstrução de tabela necessário para várias alterações SQLite.

Os vinte arquivos foram testados em contexto Alembic com SQLite em memória, verificando `upgrade()` e `downgrade()` em bancos isolados. Ambiente de validação: Python 3.12.3, Alembic 1.20.1 e SQLAlchemy 2.1.9. Essa validação cobre apenas SQLite e as versões indicadas, não todos os dialetos nem esquemas de produção. A data de criação da ferramenta não é informada porque o repositório não fornece fonte primária para esse dado.
