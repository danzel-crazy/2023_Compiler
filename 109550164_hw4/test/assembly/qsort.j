.class public qsort
.super java/lang/Object
.field public static i I
.field public static j I
.field public static tmp I
.field public static size I
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
.field public static input I
    ldc 0
    putstatic qsort/size I
    invokestatic qsort/readlnI()I
    putstatic qsort/input I
    getstatic qsort/input I
    ldc 0
    if_icmpne L1
    ldc 0
    goto L2
L1:
    ldc 1
L2:
    getstatic qsort/size I
    ldc 1
    iadd
    putstatic qsort/size I
    getstatic qsort/size I
    getstatic qsort/input I
    putstatic qsort/arr I
    invokestatic qsort/readlnI()I
    putstatic qsort/input I
    return
.end method
.method public static split_0(I)I
.limit locals 50
.limit stack 50
    ldc 0
    istore 1
.field public static test I
.field public static left I
.field public static right I
.field public static pivot I
.field public static tmp I
    ldc 1
    iadd
    getstatic qsort/left I
    getstatic qsort/right I
    if_icmple L3
    ldc 0
    goto L4
L3:
    ldc 1
L4:
    ldc 1
    getstatic qsort/left I
    if_icmple L5
    ldc 0
    goto L6
L5:
    ldc 1
L6:
    ldc 0
    getstatic qsort/test I
    ldc 1
    if_icmpeq L7
    ldc 0
    goto L8
L7:
    ldc 1
L8:
    getstatic qsort/left I
    getstatic qsort/pivot I
    if_icmplt L9
    ldc 0
    goto L10
L9:
    ldc 1
L10:
    ldc 0
    getstatic qsort/test I
    ldc 1
    if_icmpeq L11
    ldc 0
    goto L12
L11:
    ldc 1
L12:
    getstatic qsort/left I
    ldc 1
    iadd
    ldc 1
    getstatic qsort/left I
    if_icmple L13
    ldc 0
    goto L14
L13:
    ldc 1
L14:
    ldc 0
    getstatic qsort/test I
    ldc 1
    if_icmpeq L15
    ldc 0
    goto L16
L15:
    ldc 1
L16:
    getstatic qsort/left I
    getstatic qsort/pivot I
    if_icmplt L17
    ldc 0
    goto L18
L17:
    ldc 1
L18:
    ldc 0
    ldc 1
    getstatic qsort/right I
    if_icmpgt L19
    ldc 0
    goto L20
L19:
    ldc 1
L20:
    ldc 0
    getstatic qsort/test I
    ldc 1
    if_icmpeq L21
    ldc 0
    goto L22
L21:
    ldc 1
L22:
    getstatic qsort/right I
    getstatic qsort/pivot I
    if_icmpge L23
    ldc 0
    goto L24
L23:
    ldc 1
L24:
    ldc 0
    getstatic qsort/test I
    ldc 1
    if_icmpeq L25
    ldc 0
    goto L26
L25:
    ldc 1
L26:
    getstatic qsort/right I
    ldc 1
    isub
    ldc 1
    getstatic qsort/right I
    if_icmpgt L27
    ldc 0
    goto L28
L27:
    ldc 1
L28:
    ldc 0
    getstatic qsort/test I
    ldc 1
    if_icmpeq L29
    ldc 0
    goto L30
L29:
    ldc 1
L30:
    getstatic qsort/right I
    getstatic qsort/pivot I
    if_icmpge L31
    ldc 0
    goto L32
L31:
    ldc 1
L32:
    ldc 0
    getstatic qsort/left I
    getstatic qsort/right I
    if_icmplt L33
    ldc 0
    goto L34
L33:
    ldc 1
L34:
    getstatic qsort/left I
    getstatic qsort/left I
    getstatic qsort/right I
    getstatic qsort/right I
    getstatic qsort/tmp I
    getstatic qsort/right I
    getstatic qsort/right I
    getstatic qsort/tmp I
    getstatic qsort/right I
    iload 0
    ireturn
    return
.end method
.method public static split_0(I)I
.limit locals 50
.limit stack 50
    ldc 0
    istore 1
.field public static m I
.field public static splitpt I
    invokestatic qsort/start()I
    invokestatic qsort/stop()I
    if_icmplt L35
    ldc 0
    goto L36
L35:
    ldc 1
L36:
    invokestatic qsort/start()I
    invokestatic qsort/stop()I
    invokestatic qsort/start()I
    invokestatic qsort/stop()I
    putstatic qsort/splitpt I
    invokestatic qsort/start()I
    getstatic qsort/splitpt I
    ldc 1
    isub
    invokestatic qsort/start()I
    getstatic qsort/splitpt I
    ldc 1
    isub
    getstatic qsort/splitpt I
    ldc 1
    iadd
    invokestatic qsort/stop()I
    getstatic qsort/splitpt I
    ldc 1
    iadd
    invokestatic qsort/stop()I
    iload 0
    ireturn
    return
.end method
.method public static split_0(I)I
.limit locals 50
.limit stack 50
    ldc 0
    istore 1
    ldc 1
    getstatic qsort/size I
    ldc 1
    getstatic qsort/size I
    iload 0
    ireturn
    return
.end method
.method public static main([Ljava/lang/String;)V
.limit locals 50
.limit stack 50
    ldc 0
    putstatic qsort/i I
    ldc 0
    putstatic qsort/j I
    ldc 0
    putstatic qsort/tmp I
    ldc 0
    putstatic qsort/size I
    ldc 0
    putstatic qsort/input I
    ldc 0
    putstatic qsort/test I
    ldc 0
    putstatic qsort/left I
    ldc 0
    putstatic qsort/right I
    ldc 0
    putstatic qsort/pivot I
    ldc 0
    putstatic qsort/tmp I
    ldc 0
    putstatic qsort/m I
    ldc 0
    putstatic qsort/splitpt I
    invokestatic qsort/arr()I
    invokestatic qsort/arr()I
    invokestatic qsort/arr()I
    invokestatic qsort/arr()I
    ldc 1
    putstatic qsort/i I
    getstatic qsort/i I
    getstatic qsort/size I
    if_icmple L37
    ldc 0
    goto L38
L37:
    ldc 1
L38:
    invokestatic qsort/arr()I
    getstatic qsort/i I
    invokestatic qsort/writelnI(I)V
    getstatic qsort/i I
    ldc 1
    iadd
    putstatic qsort/i I
    return
.end method
