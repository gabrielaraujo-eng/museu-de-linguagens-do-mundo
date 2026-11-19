"""Revisão independente: cria a tabela account.

Pré-condição: nenhuma. É a revisão inicial de uma demonstração.
"""
revision = "a1e000000001"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.create_table(
        "account",
        sa.Column("id", sa.Integer(), primary_key=True),
        sa.Column("name", sa.String(100), nullable=False),
        sa.Column("email", sa.String(255), nullable=False, unique=True),
    )


def downgrade():
    op.drop_table("account")
