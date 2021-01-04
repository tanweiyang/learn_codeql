/**
 * @id my_tutorial
 * @kind problem
 */

import cpp
import semmle.code.cpp.dataflow.DataFlow

//from IfStmt ifstmt, Block block
//where ifstmt.getThen() = block and
//    block.getNumStmt() = 0 and
//    not ifstmt.hasElse()
//select ifstmt, "This 'if' statement is redundant."


//from 
//    Function fopen, 
//    FunctionCall fc
//where 
//    fopen.hasQualifiedName("fopen") and
//    fc.getTarget() = fopen
//select 
//    fc.getArgument(0), "fopen target"
    //fc.getArgument(0)


from 
    Function fopen, 
    FunctionCall fc, 
    Parameter p
where 
    fopen.hasQualifiedName("fopen") and 
    fc.getTarget() = fopen and 
    DataFlow::localFlow(DataFlow::parameterNode(p), DataFlow::exprNode(fc.getArgument(0)))
select 
    p, "fopen target at " + fc.getArgument(0)

