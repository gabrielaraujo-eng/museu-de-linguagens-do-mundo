"""Exercício resolvido: criar tabela de eventos relacionada a account.

Pré-condição: account.id é chave primária inteira.
"""
revision = "a1b000000005"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.create_table(
        "account_event",
        sa.Column("id", sa.Integer(), primary_key=True),
        sa.Column("account_id", sa.Integer(), nullable=False),
        sa.Column("event", sa.String(100), nullable=False),
        sa.ForeignKeyConstraint(
            ["account_id"], ["account.id"], name="fk_account_event_account"
        ),
    )


def downgrade():
    op.drop_table("account_event")
