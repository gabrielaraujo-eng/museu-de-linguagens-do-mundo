"""Revisão independente: renomeia old_name para name.

Pré-condição: account.old_name é String(50) NOT NULL e account.name não existe.
"""
revision = "a1e000000008"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.alter_column(
            "old_name",
            new_column_name="name",
            existing_type=sa.String(50),
            existing_nullable=False,
        )


def downgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.alter_column(
            "name",
            new_column_name="old_name",
            existing_type=sa.String(50),
            existing_nullable=False,
        )
