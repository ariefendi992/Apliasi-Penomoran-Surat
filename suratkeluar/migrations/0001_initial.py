# Generated by Django 5.0.7 on 2024-11-15 02:41

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('masterdata', '0003_alter_tandatanganmodel_kode'),
    ]

    operations = [
        migrations.CreateModel(
            name='SuratKeluarModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tgl_surat', models.DateField(blank=True, null=True)),
                ('hal', models.CharField(blank=True, max_length=150, null=True)),
                ('no_urut', models.CharField(blank=True, max_length=6, null=True)),
                ('file', models.FileField(blank=True, null=True, upload_to='surat_keluar/')),
                ('kode_balai', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='masterdata.balaimodel')),
                ('suku_masalah', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='masterdata.sukumasalahmodel')),
                ('ttd', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='masterdata.tandatanganmodel')),
            ],
            options={
                'verbose_name': 'SuratKeluarModel',
                'verbose_name_plural': 'SuratKeluarModels',
                'db_table': 'tb_surat_keluar',
                'managed': True,
            },
        ),
    ]
