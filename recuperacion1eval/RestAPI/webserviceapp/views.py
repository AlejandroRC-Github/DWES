from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from .models import Tjuegos, Tusuarios, Tcomentarios
from django.views.decorators.csrf import csrf_exempt
import json

def devolver_juego(request):
	lista = Tjuegos.objects.all()
	respuesta_final = []
	for fila_sql in lista:
		diccionario = {}
		diccionario['id'] = fila_sql.id
		diccionario['nombre'] = fila_sql.nombre
		diccionario['url_imagen'] = fila_sql.url_imagen
		diccionario['año_publicacion'] = fila_sql.año_publicacion
		diccionario['editorial'] = fila_sql.editorial
		respuesta_final.append(diccionario)
	return JsonResponse(respuesta_final, safe=False)

def devolver_juego_por_id(request,juego_id):
	juego = Tjuegos.objects.get(id=juego_id)
	comentarios = juego.tcomentarios_set.all()
	lista_comentarios = []
	for fila_comentario_sql in comentarios:
		diccionario = {}
		diccionario['id'] = fila_comentario_sql.id
		diccionario['comentario'] = fila_comentario_sql.comentario
		lista_comentarios.append(diccionario)
	resultado = {
		'id':juego.id,
		'titulo':juego.nombre,
		'url_imagen':juego.url_imagen,
		'fecha':juego.año_publicacion,
		'comentarios':lista_comentarios
	}
	return JsonResponse(resultado, json_dumps_params={'ensure_ascii': False})

@csrf_exempt

def devolver_comentarios(request, juego_id):
    if request.method != 'POST':
        return JsonResponse({"error": "Método HTTP no soportado."}, status=405)

    try:
        json_peticion = json.loads(request.body)
        nuevo_comentario = json_peticion.get('nuevo_comentario')

        if not nuevo_comentario:
            return JsonResponse({"error": "Falta el nuevo comentario en la solicitud."}, status=400)

        juego = Tjuegos.objects.get(id=juego_id)
        comentario = Tcomentarios(comentario=nuevo_comentario, juego=juego)
        comentario.save()

        comentarios_actualizados = list(juego.tcomentarios_set.values('id', 'comentario'))

        return JsonResponse({"status": "ok", "comentarios": comentarios_actualizados}, status=201)

    except json.JSONDecodeError:
        return JsonResponse({"error": "Error al decodificar el JSON."}, status=400)
    except Tjuegos.DoesNotExist:
        return JsonResponse({"error": "El juego no existe."}, status=404)
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)


