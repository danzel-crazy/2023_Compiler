.class public test2
.super java/lang/Object
.field public static aa I
.field public static bb I
.field public static cc I
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
.field public static z I
    return
.end method
.method public static tt_0(I)I
.limit locals 50
.limit stack 50
    ldc 0
    istore 1
.field public static z I
    ldc 3
    ldc 4
    ldc 5
    imul
    iadd
    getstatic test2/z I
    invokestatic test2/writelnI(I)V
    ldc 5
    iadd
    iload 0
    ireturn
    return
.end method
.method public static main([Ljava/lang/String;)V
.limit locals 50
.limit stack 50
    ldc 0
    putstatic test2/aa I
    ldc 0
    putstatic test2/bb I
    ldc 0
    putstatic test2/cc I
    ldc 0
    putstatic test2/z I
    ldc 0
    putstatic test2/z I
    getstatic test2/aa I
    ldc 3
    getstatic test2/bb I
    imul
    iadd
    ldc 4
    ldc 2
    idiv
    isub
    putstatic test2/aa I
    getstatic test2/aa I
    invokestatic test2/writelnI(I)V
    getstatic test2/bb I
    invokestatic test2/writelnI(I)V
    getstatic test2/aa I
    getstatic test2/bb I
    if_icmple L1
    ldc 0
    goto L2
L1:
    ldc 1
L2:
    getstatic test2/aa I
    ldc 0
    if_icmplt L3
    ldc 0
    goto L4
L3:
    ldc 1
L4:
    ldc 333
    putstatic test2/aa I
    ldc 111
    putstatic test2/aa I
    ldc 222
    putstatic test2/aa I
    getstatic test2/aa I
    invokestatic test2/writelnI(I)V
    getstatic test2/bb I
    ldc 5
    if_icmplt L5
    ldc 0
    goto L6
L5:
    ldc 1
L6:
    ldc 0
    putstatic test2/aa I
    getstatic test2/aa I
    ldc 5
    if_icmplt L7
    ldc 0
    goto L8
L7:
    ldc 1
L8:
    getstatic test2/aa I
    ldc 1
    iadd
    putstatic test2/aa I
    getstatic test2/bb I
    ldc 1
    iadd
    putstatic test2/bb I
    getstatic test2/bb I
    invokestatic test2/writelnI(I)V
    ldc 0
    ldc 3
    ldc 4
    getstatic test2/aa I
    invokestatic test2/r()I
    ldc 1
    ldc 4
    iadd
    ldc 2
    ldc 3
    ldc 4.000000
    ldc 6.500000
    ldc 2
    ldc 3
    ldc 4.000000
    ldc 6.500000
    iadd
    putstatic test2/g I
    invokestatic test2/g()I
    ldc 0
    ldc 3
    ldc 4
    invokestatic test2/writelnI(I)V
    return
.end method
