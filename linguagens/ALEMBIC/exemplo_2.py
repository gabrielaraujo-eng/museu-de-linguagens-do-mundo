"""Revisão independente: adiciona um apelido opcional.

Pré-condição: account existe com id e name; o banco pode estar vazio.
"""
revision = "a1e000000002"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.add_column(sa.Column("nickname", sa.String(50), nullable=True))


def downgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.drop_column("nickname")
