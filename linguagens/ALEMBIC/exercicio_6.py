"""Exercício resolvido: criar índice exclusivo para account.email.

Pré-condição: account.email existe e não contém duplicatas.
"""
revision = "a1b000000006"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op


def upgrade():
    op.create_index("uq_account_email", "account", ["email"], unique=True)


def downgrade():
    op.drop_index("uq_account_email", table_name="account")
