# Generated by Django 5.0.7 on 2024-11-07 06:55

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('surat', '0002_alter_suratkeluarmodel_table'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='suratkeluarmodel',
            table='tb_surat_keluar',
        ),
    ]