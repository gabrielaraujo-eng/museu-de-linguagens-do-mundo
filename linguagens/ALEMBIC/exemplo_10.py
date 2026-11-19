"""Revisão independente: atualiza um registro com SQL explícito.

Pré-condição: account contém id=1 e a coluna active; o valor inicial é false.
"""
revision = "a1e000000010"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.execute(sa.text("UPDATE account SET active = 1 WHERE id = 1"))


def downgrade():
    op.execute(sa.text("UPDATE account SET active = 0 WHERE id = 1"))
