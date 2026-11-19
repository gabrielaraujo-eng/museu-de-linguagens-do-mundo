"""Revisão independente: renomeia account_old para account.

Pré-condição: account_old existe e account não existe.
"""
revision = "a1e000000007"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op


def upgrade():
    op.rename_table("account_old", "account")


def downgrade():
    op.rename_table("account", "account_old")
