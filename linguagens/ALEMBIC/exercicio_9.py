"""Exercício resolvido: criar índice composto para nome e data.

Pré-condição: account possui name e created_at.
"""
revision = "a1b000000009"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op


def upgrade():
    op.create_index("ix_account_name_created", "account", ["name", "created_at"])


def downgrade():
    op.drop_index("ix_account_name_created", table_name="account")
