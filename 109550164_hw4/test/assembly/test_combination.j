.class public test_combination
.super java/lang/Object
.field public static a I
.field public static b I
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
.method public static comb_0(I)I
.limit locals 50
.limit stack 50
    ldc 0
    istore 1
    getstatic test_combination/a I
    getstatic test_combination/b I
    if_icmpgt L1
    ldc 0
    goto L2
L1:
    ldc 1
L2:
    getstatic test_combination/a I
    ldc 1
    if_icmpeq L3
    ldc 0
    goto L4
L3:
    ldc 1
L4:
    ldc 1
    getstatic test_combination/a I
    ldc 0
    if_icmpgt L5
    ldc 0
    goto L6
L5:
    ldc 1
L6:
    getstatic test_combination/b I
    ldc 0
    if_icmpgt L7
    ldc 0
    goto L8
L7:
    ldc 1
L8:
    getstatic test_combination/a I
    ldc 1
    isub
    getstatic test_combination/b I
    ldc 1
    isub
    getstatic test_combination/a I
    ldc 1
    isub
    getstatic test_combination/b I
    ldc 1
    isub
    getstatic test_combination/a I
    ldc 1
    isub
    getstatic test_combination/b I
    getstatic test_combination/a I
    ldc 1
    isub
    getstatic test_combination/b I
    iadd
    ldc 1
    ldc 0
    ldc 1
    iload 0
    ireturn
    return
.end method
.method public static main([Ljava/lang/String;)V
.limit locals 50
.limit stack 50
    ldc 0
    putstatic test_combination/a I
    ldc 0
    putstatic test_combination/b I
    ldc 3
    putstatic test_combination/a I
    ldc 4
    putstatic test_combination/b I
    getstatic test_combination/a I
    ldc 3
    iadd
    getstatic test_combination/b I
    ldc 2
    isub
    getstatic test_combination/a I
    ldc 3
    iadd
    getstatic test_combination/b I
    ldc 2
    isub
    invokestatic test_combination/writelnI(I)V
    return
.end method
