"""Exercício resolvido: preencher status ausente em registros existentes.

Pré-condição: account.status existe como String(20); todos os valores são NULL.
O downgrade restaura NULLs conforme essa pré-condição didática.
"""
revision = "a1b000000004"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.execute(sa.text("UPDATE account SET status = 'active' WHERE status IS NULL"))


def downgrade():
    op.execute(sa.text("UPDATE account SET status = NULL WHERE status = 'active'"))
