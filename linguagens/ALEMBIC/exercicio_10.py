"""Exercício resolvido: registrar uma operação customizada de Alembic.

A API customizada é global ao processo. Esta revisão é uma demonstração isolada.
Pré-condição: nenhuma. A operação cria/remova audit_log.
"""
revision = "a1b000000010"
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
from alembic.operations import MigrateOperation, Operations
import sqlalchemy as sa


@Operations.register_operation("create_audit_log")
class CreateAuditLogOp(MigrateOperation):
    def __init__(self, table_name):
        self.table_name = table_name

    @classmethod
    def create_audit_log(cls, operations, table_name):
        return operations.invoke(cls(table_name))

    def reverse(self):
        return DropAuditLogOp(self.table_name)


@Operations.register_operation("drop_audit_log")
class DropAuditLogOp(MigrateOperation):
    def __init__(self, table_name):
        self.table_name = table_name

    @classmethod
    def drop_audit_log(cls, operations, table_name):
        return operations.invoke(cls(table_name))

    def reverse(self):
        return CreateAuditLogOp(self.table_name)


@Operations.implementation_for(CreateAuditLogOp)
def _create_audit_log(operations, operation):
    operations.create_table(
        operation.table_name,
        sa.Column("id", sa.Integer(), primary_key=True),
        sa.Column("event", sa.String(100), nullable=False),
    )


@Operations.implementation_for(DropAuditLogOp)
def _drop_audit_log(operations, operation):
    operations.drop_table(operation.table_name)


def upgrade():
    op.create_audit_log("audit_log")


def downgrade():
    op.drop_audit_log("audit_log")
