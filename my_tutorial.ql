/**
 * @id my_tutorial
 * @kind problem
 */

import cpp

from IfStmt ifstmt, Block block
where ifstmt.getThen() = block and
    block.getNumStmt() = 0 and
    not ifstmt.hasElse()
select ifstmt, "This 'if' statement is redundant."

