print("En la noche se extiende,sin estrellas se hace presente.En el día se esconde sin cesar,¿qué es, que siempre está?")

puntuacion = 0

opciones = {
'a1': "a: La luna.",
'b1': "b: La oscuridad.",
'c1': "c: El día y la noche.",
'op1':'a',
'op2':'b',
'op3':'c',
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
