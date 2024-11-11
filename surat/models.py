from datetime import datetime
from django.db import models
from masterdata.models import SukuMasalahModel, BalaiModel, TandaTanganModel


class SuratKeluarModel(models.Model):
    suku_masalah = models.ForeignKey(
        SukuMasalahModel,
        on_delete=models.CASCADE,
        blank=True,
        null=True,
    )
    kode_balai = models.ForeignKey(
        BalaiModel,
        on_delete=models.CASCADE,
        blank=True,
        null=True,
    )
    tgl_surat = models.DateField(blank=True, null=True)
    hal = models.CharField(blank=True, null=True, max_length=150)
    ttd = models.ForeignKey(
        TandaTanganModel,
        on_delete=models.CASCADE,
        null=True,
        blank=True,
    )
    no_urut = models.CharField(blank=True, null=True, max_length=6)
    file = models.FileField(upload_to="surat_keluar/", blank=True, null=True)

    def __str__(self):
        return f"{self.hal}"

    class Meta:
        db_table = "tb_surat_keluar"
        managed = True
        verbose_name = "SuratKeluarModel"
        verbose_name_plural = "SuratKeluarModels"


class SuratMasukModel(models.Model):
    no_surat = models.CharField(max_length=150, blank=True, null=True)
    tgl_surat = models.DateField(blank=True, null=True)
    hal = models.CharField(blank=True, null=True, max_length=150)
    file = models.FileField(upload_to="surat_masuk/", blank=True, null=True)

    def __str__(self):
        return f"{self.no_surat}"

    class Meta:
        db_table = "tb_surat_masuk"
        managed = True
        verbose_name = "SuratMasukModel"
        verbose_name_plural = "SuratMasukModels"
