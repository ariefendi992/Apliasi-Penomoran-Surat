from django.db import models


# Create your models here.
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
