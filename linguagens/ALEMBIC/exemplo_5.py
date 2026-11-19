"""Revisão independente: cria project com nome único.

Pré-condição: nenhuma.
"""
revision = "a1e000000005"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.create_table(
        "project",
        sa.Column("id", sa.Integer(), primary_key=True),
        sa.Column("name", sa.String(120), nullable=False),
        sa.UniqueConstraint("name", name="uq_project_name"),
    )


def downgrade():
    op.drop_table("project")
