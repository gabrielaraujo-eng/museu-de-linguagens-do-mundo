"""Revisão independente: insere dados iniciais com bulk_insert.

Pré-condição: setting existe com id INTEGER PK, key String(80) e value String(120); os ids 1 e 2 estão livres.
"""
revision = "a1e000000009"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    settings = sa.table(
        "setting",
        sa.column("id", sa.Integer()),
        sa.column("key", sa.String(80)),
        sa.column("value", sa.String(120)),
    )
    op.bulk_insert(
        settings,
        [
            {"id": 1, "key": "site_name", "value": "Museum"},
            {"id": 2, "key": "locale", "value": "pt-BR"},
        ],
    )


def downgrade():
    settings = sa.table("setting", sa.column("id", sa.Integer()))
    op.execute(settings.delete().where(settings.c.id.in_([1, 2])))
