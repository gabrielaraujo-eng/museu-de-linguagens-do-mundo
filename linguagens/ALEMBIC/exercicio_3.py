"""Exercício resolvido: tornar email obrigatório.

Pré-condição: account.email é String(255) nullable e não há valores NULL.
"""
revision = "a1b000000003"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.alter_column(
            "email",
            existing_type=sa.String(255),
            existing_nullable=True,
            nullable=False,
        )


def downgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.alter_column(
            "email",
            existing_type=sa.String(255),
            existing_nullable=False,
            nullable=True,
        )
