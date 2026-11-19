"""Revisão independente: altera amount de inteiro para decimal.

Pré-condição: account.amount é INTEGER NOT NULL; para reversão sem perda,
os valores devem permanecer inteiros.
"""
revision = "a1e000000004"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.alter_column(
            "amount",
            existing_type=sa.Integer(),
            type_=sa.Numeric(12, 2),
            existing_nullable=False,
        )


def downgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.alter_column(
            "amount",
            existing_type=sa.Numeric(12, 2),
            type_=sa.Integer(),
            existing_nullable=False,
        )
