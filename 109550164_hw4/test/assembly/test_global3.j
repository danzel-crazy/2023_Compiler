.class public test_global3
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
.method public static tt_0()I
.limit locals 50
.limit stack 50
    ldc 2
    multianewarray [I 1
    astore_1
    ldc 2
    multianewarray [I 1
    astore_2
    aload_1
    ldc 1
    ldc 1
    isub
    ldc 10
    iastore
    aload_2
    ldc 1
    ldc 1
    isub
    aload_1
    ldc 1
    ldc 1
    isub
    iaload
    ldc 11
    iadd
    iastore
    aload_2
    ldc 1
    ldc 1
    isub
    iaload
    ireturn
    ireturn
.end method
.method public static main([Ljava/lang/String;)V
.limit locals 50
.limit stack 50
    ldc 0
    putstatic test_global3/a I
    ldc 0
    putstatic test_global3/b I
    ldc 0.0
    putstatic test_global3/c F
    ldc 3
    putstatic test_global3/a I
    ldc 4
    putstatic test_global3/b I
    invokestatic test_global3/tt_0()I
    invokestatic test_global3/writelnI(I)V
    return
.end method
