
# Tipos de datos ----------------------------------------------------------

## Enteros -----------------------------------------------------------------

x = 4L
typeof(x) # ¿Qué tipo de dato se almacena en x?
is.integer(x) # ¿x es un dato de tipo entero?

y = 4
typeof(y)
is.integer(y)

(z = 4.3L) # gana el decimal
typeof(z)
is.integer(z)

M = 5L
N = 10L
P = M + N
P
typeof(P)

## Double ------------------------------------------------------------------

x = 36
typeof(x)
is.integer(x)
is.double(x)

y = 40.3
typeof(y)
is.integer(y)
is.double(y)

pi
typeof(pi)

# coerción implícita
r = 40L # integer
u = 20  # double
s = r + u # double
typeof(s)

# coerción explícita (as.integer)
r = 40L # integer
u = 20  # double
s = r + as.integer(u) # integer + integer
typeof(s)
is.numeric(s)

p = 30.34
e = 14.9999999999999999
o = as.integer(p) + as.integer(e)
o

## Complejos ---------------------------------------------------------------

z = 1 + 2i
typeof(z)
is.integer(z)
is.double(z)
is.complex(z)
is.numeric(z)
as.numeric(z)

t = 1i
typeof(t)
is.integer(t)
is.double(t)
is.complex(t) # is: pregunta
as.numeric(t) # as: conversión o coerción

w = 10 + 0i
typeof(w)
is.integer(w)
is.double(w)
is.complex(w)

v = 10
typeof(v)
is.integer(v)
is.double(v)
is.complex(v)

## Lógicos -----------------------------------------------------------------

a = TRUE
typeof(a)
is.integer(a)
is.double(a)
is.complex(a)
is.logical(a)

3 == 5.2     # ¿3=5.2?
4.6 <= 8.1   # ¿4.6 es menor o igual que 8.1?
12 > 3.5     # ¿12 es mayor que 3.5?
5 != 8       # ¿5 es distinto de 8?
b = (4 == 5) # En b se almacena el resultado de comparar 4 = 5
b

S = TRUE + FALSE # coerción implícita
is.logical(S)
typeof(S)
S

R = 3L - (3>1) # coerción implícita
R
is.integer(R)

B = 3L - as.double(3>1) # coerción explícita
B
typeof(B)

W = (54 <= 80) * pi - 4L
typeof(W)

## Caracter ----------------------------------------------------------------

p = "Universidad Agraria"
typeof(p)
is.integer(p)
is.double(p)
is.complex(p)
is.logical(p)
is.character(p)
as.numeric(p) # NA = Not Available

q = '70096321'
typeof(q)
as.integer(q)

s = 'R is a free software environment for statistical computing and graphics. 
To download R, please choose your preferred CRAN mirror.'
typeof(s)


# Estructuras de datos ----------------------------------------------------

## Vector atómico ----------------------------------------------------------

x1 = c(3,4,5,12,3.4)
typeof(x1)
str(x1)
is.double(x1)
is.atomic(x1)
is.integer(x1)
x1[1]
x1[1:3]
x1[c(1:3)]
x1[c(1,2,3)]
x1[-2]
x1[-c(1:3)]
x1[3.12] # coerción implícita

r1 = c(1,5,4,8,5,6,5,2,3,5,4,8,10)
# Obtener las posiciones 2, 5, 6 y 10
r1[c(2,5,6,10)]

y1 = c(FALSE, 5L, 6.3, 'abc123')
y1
typeof(y1)
str(y1)
is.double(y1)
is.atomic(y1)
y1[3]

(a  = c(9,4,2,3,4))
rep(4,3)
(a1 = rep(4,3))
(a2 = seq(1,5))
(a2 = 1:5)
(a3 = seq(1,5,0.25))
(a4 = rev(a))
(a5 = sort(a))
(a6 = unique(a))
(a7 = letters)
(a8 = c(letters[1:14],"ñ",letters[15:26]))
(a9 = LETTERS)
which(letters=="d")
which(a9 == "D")

x5 = c(1,5,13,5,7)
which(x5 == 13)
which(x5 == 5)

(M = rep(c(1,3,8),2))

N = c(5,8,3,-2,4,-1)
sort(N)
rev(sort(N))
sort(N, decreasing = TRUE)

P = c("o","a","b","j","c")
sort(P)
sort(P, decreasing = TRUE)

S = c(1,1.5,2,2.5,3,3,2.5,2,1.5,1)
s1 = seq(1,3,0.5)
S = c(s1,rev(s1))
S


## Lista -------------------------------------------------------------------

x2 = list(1L, 'a')
typeof(x2)
str(x2)
is.atomic(x2)
is.list(x2)
x2[2]
x2[[2]]
str(x2[2])
str(x2[[2]])
is.double(x2)
is.integer(x2)
is.character(x2)
x3 = list(1L, 2L)
is.integer(x3)
x3 = c(1L, 2L)
is.integer(x3)

y2 = list(m = c(3,4,5), n = c(7,24,25))
typeof(y2)
str(y2)
is.atomic(y2)
is.list(y2)
y2[[2]]
y2$n
y2$n[3]

b1 = list(x = 4L, y = TRUE, 5-3i)
names(b1)
unlist(b1)

b2 = list(x = c("r","a","f"), y = TRUE, z = list(0,1))
names(b2)
unlist(b2)


# MATRIZ ------------------------------------------------------------------

x3 = matrix(c(7,3,5,8,6,6),ncol=2)
x3
x3 = matrix(c(7,3,5,8,6,6),nrow=3)
x3
typeof(x3)
str(x3)
is.double(x3)
is.vector(x3)
is.list(x3)
is.matrix(x3)
x3[1,2]
x3[2,]
x3[,2]
str(x3[,2])
x3[c(1,3),2]
x3[2:3,2]

y3 = matrix(c(7,TRUE,5,8,1,2),nrow=3)
typeof(y3)
str(y3)
is.double(y3)
is.vector(y3)
is.list(y3)
is.matrix(y3)
y3[3,1]
y3[2,]
y3[,2]

c1 = matrix(c(5,6,3,4,3,3,1,1),
            ncol = 4, 
            byrow = TRUE, 
            dimnames = list(c("f1","f2"),c("co1","co2","co3","co4")))
dim(c1)
rownames(c1)
colnames(c1)
t(c1)
c1
c2 = matrix(c(3,4,3,4),nrow = 2)
c2
cbind(c1,c2)
c3 = matrix(c(3,4,3,4),ncol = 4)
rbind(c1,c3)

var1 = c(4,5,3,5,3)
var2 = c('1','3','66','12','15')
x4 = data.frame(var1, var2)
x4
str(x4)
typeof(x4)
is.double(x4)
is.vector(x4)
is.list(x4)
is.matrix(x4)
is.data.frame(x4)
x4[1,2]
x4[2,] # 2da fila
x4[,2] # 2da columna
x4$var1
x4$var2[3]
