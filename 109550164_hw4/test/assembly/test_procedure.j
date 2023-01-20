.class public test_procedure
.super java/lang/Object
.field public static a I
.field public static b I
.field public static c F
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
.method public static ss_0()I
.limit locals 50
.limit stack 50
    ldc 3
    ldc 4
    ldc 5
    imul
    iadd
    ireturn
.end method
.method public static tt_0()V
.limit locals 50
.limit stack 50
    invokestatic test_procedure/ss_0()I
    ldc 33
    invokestatic test_procedure/ss_0()I
    imul
    iadd
    getstatic test_procedure/a I
    iadd
    putstatic test_procedure/a I
    ldc 0.500000
    putstatic test_procedure/c F
    return
.end method
.method public static main([Ljava/lang/String;)V
.limit locals 50
.limit stack 50
    ldc 0
    putstatic test_procedure/a I
    ldc 0
    putstatic test_procedure/b I
    ldc 0.0
    putstatic test_procedure/c F
    invokestatic test_procedure/ss_0()I
    invokestatic test_procedure/ss_0()I
    imul
    invokestatic test_procedure/ss_0()I
    iadd
    putstatic test_procedure/a I
    invokestatic test_procedure/tt_0()V
    invokestatic test_procedure/tt_0()V
    invokestatic test_procedure/tt_0()V
    getstatic test_procedure/a I
    invokestatic test_procedure/writelnI(I)V
    return
.end method
