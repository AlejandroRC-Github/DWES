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
		'fecha':juego.año_publicacion,
		'comentarios':lista_comentarios
	}
	return JsonResponse(resultado, json_dumps_params={'ensure_ascii': False})

@csrf_exempt	
def devolver_comentario(request, juego_id):
	if request.method != 'POST':
		return None;

	json_peticion = json.loads(request.body)
	comentario = Tcomentarios()
	comentario.comentario = json_peticion['nuevo_comentario']
	comentario.juego = Tjuegos.objects.get(id = juego_id)
	comentario.save()
	return JsonResponse({"status":"ok"})

# Create your views here.
