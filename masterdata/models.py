from django.db import models


# Create your models here.
class BalaiModel(models.Model):
    kode_balai = models.CharField(max_length=32, blank=True)
    nama_balai = models.CharField(max_length=128, blank=True)

    class Meta:
        # verbose_name = "Kode Balai"
        verbose_name_plural = "Kode Balai"

    def __str__(self):
        return f"{self.kode_balai} | {self.nama_balai}"


class KlasifikasiModel(models.Model):
    klasifikasi = [
        (None, "- Pilih - "),
        ("fasilitasif", "Fasilitatif"),
        ("substantif", "Substantif"),
    ]
    klasifikasi_arsip = models.CharField(max_length=64, choices=klasifikasi, blank=True)

    class Meta:
        verbose_name_plural = "Klasifikasi Arsip"

    def __str__(self):
        return self.klasifikasi_arsip.title()


class MasalahPokokModel(models.Model):
    kode = models.CharField(max_length=6, blank=True)
    masalah_pokok = models.CharField(max_length=128, blank=True)
    klasifikasi = models.ForeignKey(
        KlasifikasiModel,
        on_delete=models.CASCADE,
        blank=True,
        null=True,
        verbose_name="Klasifikasi Arsip",
    )

    class Meta:
        verbose_name_plural = "Masalah Pokok"

    def __str__(self):
        return self.masalah_pokok


class BagianMasalahModel(models.Model):
    kode = models.CharField(max_length=6, blank=True)
    bagian_masalah = models.CharField(max_length=128, blank=True)
    masalahpokok = models.ForeignKey(
        MasalahPokokModel,
        on_delete=models.CASCADE,
        blank=True,
        null=True,
        verbose_name="Masalah Pokok",
    )

    class Meta:
        verbose_name_plural = "Bagian Masalah"

    def __str__(self):
        return self.bagian_masalah


class SukuMasalahModel(models.Model):
    kode = models.CharField(max_length=6, blank=True)
    suku_masalah = models.CharField(max_length=128, blank=True)
    bagianmasalah = models.ForeignKey(
        BagianMasalahModel,
        on_delete=models.CASCADE,
        blank=True,
        null=True,
        verbose_name="Bagian Masalah",
    )

    class Meta:
        verbose_name_plural = "Suku Masalah"

    def __str__(self):
        return f"{self.pk} - {self.suku_masalah}"


class TandaTanganModel(models.Model):
    kode = models.CharField(max_length=4, null=True, blank=True)
    tertanda = models.CharField(max_length=128, null=True, blank=True)

    class Meta:
        verbose_name_plural = "Tertanda Surat"

    def __str__(self):
        return f"{self.tertanda}"
