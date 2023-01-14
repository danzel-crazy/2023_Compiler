.class public test_array
.super java/lang/Object
.field public static a [I
.field public static b I
.field public static c [[I
.method public <init>()V
	aload_0
	invokenonvirtual java/lang/Object/<init>()V
	return
.end method
.method public static printInt(I)V
	.limit locals 1
	.limit stack 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	iload_0
	invokevirtual java/io/PrintStream/println(I)V
	return
.end method
.method public static printReal(F)V
	.limit locals 1
	.limit stack 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	fload_0
	invokevirtual java/io/PrintStream/println(F)V
	return
.end method
.method public static printString(Ljava/lang/String;)V
	.limit locals 1
	.limit stack 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	aload_0
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	return
.end method
.method public static ss(I)I
	.limit locals 4
	.limit stack 8
	iload_0
	istore_1
	iload_1
	ireturn
.end method
.method public static main([Ljava/lang/String;)V
	.limit locals 100
	.limit stack 200
	iconst_2
	newarray int
	putstatic test_array/a [I
	iconst_2
	iconst_2
	multianewarray [[I 2
	putstatic test_array/c [[I
	getstatic test_array/a [I
	iconst_1
	iconst_1
	isub
	iconst_1
	iastore
	getstatic test_array/a [I
	iconst_2
	iconst_1
	isub
	iconst_1
	iastore
	getstatic test_array/c [[I
	iconst_1
	iconst_1
	isub
	aaload
	iconst_1
	iconst_1
	isub
	iconst_1
	iastore
	getstatic test_array/c [[I
	iconst_1
	iconst_1
	isub
	aaload
	iconst_2
	iconst_1
	isub
	iconst_2
	iastore
	getstatic test_array/c [[I
	iconst_2
	iconst_1
	isub
	aaload
	iconst_1
	iconst_1
	isub
	iconst_3
	iastore
	getstatic test_array/c [[I
	iconst_2
	iconst_1
	isub
	aaload
	iconst_2
	iconst_1
	isub
	iconst_1
	iastore
	getstatic test_array/c [[I
	getstatic test_array/c [[I
	iconst_1
	invokestatic test_array/ss(I)I
	iconst_1
	isub
	aaload
	iconst_2
	invokestatic test_array/ss(I)I
	iconst_1
	isub
	iaload
	invokestatic test_array/ss(I)I
	iconst_1
	isub
	aaload
	getstatic test_array/c [[I
	getstatic test_array/a [I
	iconst_1
	iconst_1
	isub
	iaload
	invokestatic test_array/ss(I)I
	iconst_1
	isub
	aaload
	getstatic test_array/a [I
	iconst_2
	iconst_1
	isub
	iaload
	iconst_1
	isub
	iaload
	iconst_1
	isub
	getstatic test_array/a [I
	getstatic test_array/a [I
	getstatic test_array/a [I
	iconst_1
	iconst_1
	isub
	iaload
	invokestatic test_array/ss(I)I
	iconst_1
	isub
	iaload
	invokestatic test_array/ss(I)I
	iconst_1
	isub
	iaload
	iastore
	getstatic test_array/c [[I
	iconst_2
	iconst_1
	isub
	aaload
	iconst_1
	iconst_1
	isub
	iaload
	invokestatic test_array/printInt(I)V
	return
.end method
