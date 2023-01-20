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
    iload 0
    getstatic test_combination/a I
    getstatic test_combination/b I
    if_icmpgt L1
    ldc 0
    goto L2
L1:
    ldc 1
L2:
    ifne L3
    getstatic test_combination/a I
    ldc 1
    if_icmpeq L4
    ldc 0
    goto L5
L4:
    ldc 1
L5:
    ifeq L6
    ldc 1
    goto L7
L6:
    getstatic test_combination/a I
    ldc 0
    if_icmpgt L7
    ldc 0
    goto L8
L7:
    ldc 1
L8:
    ifeq L9
    getstatic test_combination/b I
    ldc 0
    if_icmpgt L10
    ldc 0
    goto L11
L10:
    ldc 1
L11:
    ifeq L12
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
    invokestatic test_combination/comb_0(I)I
    getstatic test_combination/a I
    ldc 1
    isub
    getstatic test_combination/b I
    iadd
    goto L13
L12:
    ldc 1
L13:
    goto L14
L13:
    ldc 0
L14:
L15:
    goto L16
L15:
    ldc 1
L16:
    ireturn
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
