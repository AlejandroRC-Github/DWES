print("En la noche se extiende,sin estrellas se hace presente.En el día se esconde sin cesar,¿qué es, que siempre está?")

puntuacion = 0

opciones = {
'a1': "a: La luna.",
'b1': "b: La oscuridad.",
'c1': "c: El día y la noche.",
'op1':'a',
'op2':'b',
'op3':'c',
'a2' :'a: La pera.',
'b2' :'b: La manzana.',
'c2' :'c: La sandía.',
'a3': 'a: La moneda.',
'b3': 'b: El diamante.',
'c3': 'c: El bolsillo.',
}

print(opciones['a1'])
print(opciones['b1'])
print(opciones['c1'])

opcionR = input()

if opcionR == opciones['op1']:
    print("Opción correcta")
    puntuacion = puntuacion + 10
else:
    print("Opción incorrecta")
    puntuacion = puntuacion + 5

print('Blanco por dentro, verde por fuera,si quieres que te lo diga, espera.¿Qué es?')

print(opciones['a2'])
print(opciones['b2'])
print(opciones['c2'])

opcionR = input()

if opcionR == opciones['op2']:
    print("Opción correcta")
    puntuacion = puntuacion + 10
else:
    print("Opción incorrecta")
    puntuacion = puntuacion + 5

print("Es pequeño como un ratón,pero guarda un gran tesoro en su interior.Todos lo quieren tener en su bolsillo,¿qué es este objeto sencillo?")

print(opciones['a3'])
print(opciones['b3'])
print(opciones['c3'])

opcionR = input()

if opcionR == opciones['op3']:
    print("Opción correcta")
    puntuacion = puntuacion + 10
else:
    print("Opción incorrecta")
    puntuacion = puntuacion + 5

print("Puntuación: ",puntuacion)
