.class public test_nestedStmt
.super java/lang/Object
.field public static a I
.field public static b I
.field public static d I
.method public static writelnI(I)V
.limit locals 5
.limit stack 5
    getstatic java/lang/System/out Ljava/io/PrintStream;
    iload 0
    invokevirtual java/io/PrintStream/println(I)V
    return
.end method

.method public static writelnR(F)V
    .limit locals 5
    .limit stack 5
    getstatic java/lang/System/out Ljava/io/PrintStream;
    fload 0
    invokevirtual java/io/PrintStream/println(F)V
    return
.end method

.method public static writelnS(Ljava/lang/String;)V
    .limit locals 5
    .limit stack 5
    getstatic java/lang/System/out Ljava/io/PrintStream;
    aload 0
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
    return
.end method

.method public static readlnI()I
    .limit locals 10
    .limit stack 10
    ldc 0
    istore 1
LAB1:
    getstatic java/lang/System/in Ljava/io/InputStream;
    invokevirtual java/io/InputStream/read()I
    istore 2
    iload 2
    ldc 10
    isub
    ifeq LAB2
    iload 2
    ldc 32
    isub
    ifeq LAB2
    iload 2
    ldc 48
    isub
    ldc 10
    iload 1
    imul
    iadd
    istore 1
    goto LAB1
LAB2:
    iload 1
    ireturn
.end method
.method public static main([Ljava/lang/String;)V
.limit locals 50
.limit stack 50
    ldc 0
    putstatic test_nestedStmt/a I
    ldc 0
    putstatic test_nestedStmt/b I
    ldc 0
    putstatic test_nestedStmt/d I
    ldc 1
    putstatic test_nestedStmt/a I
    ldc 7
    putstatic test_nestedStmt/b I
    ldc 9
    putstatic test_nestedStmt/d I
    getstatic test_nestedStmt/a I
    getstatic test_nestedStmt/b I
    ldc 3
    iadd
    if_icmplt L1
    ldc 0
    goto L2
L1:
    ldc 1
L2:
    getstatic test_nestedStmt/a I
    ldc 5
    iadd
    getstatic test_nestedStmt/b I
    ldc 2
    isub
    if_icmpgt L3
    ldc 0
    goto L4
L3:
    ldc 1
L4:
    getstatic test_nestedStmt/a I
    getstatic test_nestedStmt/b I
    if_icmplt L5
    ldc 0
    goto L6
L5:
    ldc 1
L6:
    getstatic test_nestedStmt/b I
    ldc 11
    if_icmplt L7
    ldc 0
    goto L8
L7:
    ldc 1
L8:
    getstatic test_nestedStmt/b I
    ldc 2
    iadd
    putstatic test_nestedStmt/b I
    getstatic test_nestedStmt/a I
    ldc 10
    iadd
    putstatic test_nestedStmt/a I
    getstatic test_nestedStmt/d I
    ldc 100
    iadd
    putstatic test_nestedStmt/d I
    getstatic test_nestedStmt/d I
    ldc 1000
    iadd
    putstatic test_nestedStmt/d I
    getstatic test_nestedStmt/a I
    invokestatic test_nestedStmt/writelnI(I)V
    getstatic test_nestedStmt/b I
    invokestatic test_nestedStmt/writelnI(I)V
    getstatic test_nestedStmt/d I
    invokestatic test_nestedStmt/writelnI(I)V
    return
.end method
