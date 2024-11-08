# Generated by Django 5.0.7 on 2024-11-08 01:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('masterdata', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='TandaTanganModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('kode', models.IntegerField(max_length=4)),
                ('tertanda', models.CharField(blank=True, max_length=128, null=True)),
            ],
            options={
                'verbose_name_plural': 'Tertanda Surat',
            },
        ),
    ]