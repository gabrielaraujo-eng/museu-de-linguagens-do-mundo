"""Exercício resolvido: restringir account.age a valores não negativos.

Pré-condição: account.age existe e os registros atuais respeitam age >= 0.
"""
revision = "a1b000000007"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op


def upgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.create_check_constraint("ck_account_age_nonnegative", "age >= 0")


def downgrade():
    with op.batch_alter_table("account") as batch_op:
        batch_op.drop_constraint("ck_account_age_nonnegative", type_="check")
