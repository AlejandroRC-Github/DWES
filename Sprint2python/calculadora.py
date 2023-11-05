from operaciones import suma, resta, multiplicacion, division

while True:
    try:
        num1 = float(input("Introduce el primer número: "))
        num2 = float(input("Introduce el segundo número: "))
    except ValueError:
        print("Introduce números válidos.")
        continue

    operacion = input("¿Qué operación deseas realizar? (+ para suma, - para resta, * para multiplicación, / para división): ")

    if operacion == '+':
        resultado = suma(num1, num2)
    elif operacion == '-':
        resultado = resta(num1, num2)
    elif operacion == '*':
        resultado = multiplicacion(num1, num2)
    elif operacion == '/':
        resultado = division(num1, num2)
    else:
        print("Operación no válida")
        continue

    print("El resultado de la operación es: ", resultado)

    continuar = input("¿Quieres hacer más operaciones? (s/n): ")
    if continuar.lower() != 's':
        break
