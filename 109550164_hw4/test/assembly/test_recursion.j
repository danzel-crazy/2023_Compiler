.class public test_recursion
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
.method public static fact_0(I)I
.limit locals 50
.limit stack 50
    iload 0
    ldc 1
    if_icmpeq L1
    ldc 0
    goto L2
L1:
    ldc 1
L2:
    ifeq L3
    goto L4
L3:
    ldc 1
    isub
    ldc 1
    isub
    imul
L4:
    ireturn
.end method
.method public static main([Ljava/lang/String;)V
.limit locals 50
.limit stack 50
    ldc 0
    putstatic test_recursion/a I
    ldc 0
    putstatic test_recursion/b I
    ldc 0.0
    putstatic test_recursion/c F
    ldc 4
    invokestatic test_recursion/fact_0(I)I
    ldc 4
    putstatic test_recursion/a I
    getstatic test_recursion/a I
    invokestatic test_recursion/writelnI(I)V
    return
.end method
