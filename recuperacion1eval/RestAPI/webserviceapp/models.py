# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Tcomentarios(models.Model):
    comentario = models.CharField(max_length=500, blank=True, null=True)
    usuario = models.ForeignKey('Tusuarios', models.DO_NOTHING, blank=True, null=True)
    juego = models.ForeignKey('Tjuegos', models.DO_NOTHING)
    fecha = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tcomentarios'


class Tjuegos(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    url_imagen = models.CharField(max_length=255, blank=True, null=True)
    año_publicacion = models.TextField(blank=True, null=True)  # This field type is a guess.
    editorial = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tjuegos'


class Tusuarios(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    email = models.CharField(max_length=100, blank=True, null=True)
    fecha_registro = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tusuarios'
