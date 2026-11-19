"""Revisão independente: remove uma coluna obsoleta.

Pré-condição: account possui legacy_code (String(40)), nullable.
O downgrade restaura a coluna, mas não os valores que foram apagados.
"""
revision = "a1e000000003"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.drop_column("legacy_code", existing_type=sa.String(40))


def downgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.add_column(sa.Column("legacy_code", sa.String(40), nullable=True))
