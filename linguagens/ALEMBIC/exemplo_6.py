"""Revisão independente: remove legacy_account.

Pré-condição: legacy_account tem id INTEGER PK e external_ref String(80) NOT NULL.
O downgrade recria a estrutura, mas não recupera linhas descartadas.
"""
revision = "a1e000000006"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.drop_table("legacy_account")


def downgrade():
    op.create_table(
        "legacy_account",
        sa.Column("id", sa.Integer(), primary_key=True),
        sa.Column("external_ref", sa.String(80), nullable=False),
    )
