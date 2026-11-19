"""Exercício resolvido: adicionar uma coluna booleana opcional.

Pré-condição: account existe e não possui active.
"""
revision = "a1b000000002"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.add_column("account", sa.Column("active", sa.Boolean(), nullable=True))


def downgrade():
    op.drop_column("account", "active")
