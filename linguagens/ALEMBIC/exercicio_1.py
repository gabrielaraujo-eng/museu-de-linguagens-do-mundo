"""Exercício resolvido: criar um índice não exclusivo para account.email.

Pré-condição: account.email existe; o banco pode estar vazio.
"""
revision = "a1b000000001"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op


def upgrade():
    op.create_index("ix_account_email", "account", ["email"], unique=False)


def downgrade():
    op.drop_index("ix_account_email", table_name="account")
