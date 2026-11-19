"""Exercício resolvido: criar e preencher display_name.

Pré-condição: account tem first_name e last_name; display_name não existe.
"""
revision = "a1b000000008"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.add_column("account", sa.Column("display_name", sa.String(121), nullable=True))
    op.execute(
        sa.text(
            "UPDATE account SET display_name = "
            "trim(first_name || ' ' || last_name)"
        )
    )


def downgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.drop_column("display_name")
