from django.contrib import admin
from .models import (
    BagianMasalahModel as BagianMasalah,
    BalaiModel,
    KlasifikasiModel,
    MasalahPokokModel,
    SukuMasalahModel,
    TandaTanganModel,
)


# Register your models here.
class BalaiAdmin(admin.ModelAdmin):
    list_display = ["kode_balai", "nama_balai"]


class MasalahPokokAdmin(admin.ModelAdmin):
    list_display = ["kode", "masalah_pokok", "klasifikasi"]


class BagianMasalahAdmin(admin.ModelAdmin):
    list_display = ["kode", "bagian_masalah", "masalahpokok"]


class SukuMasalahAdmin(admin.ModelAdmin):
    list_display = ["kode", "suku_masalah", "bagianmasalah"]


class TandaTanganAdmin(admin.ModelAdmin):
    list_display = ["kode", "tertanda"]


admin.site.register(BalaiModel, BalaiAdmin)
admin.site.register(KlasifikasiModel)
admin.site.register(MasalahPokokModel, MasalahPokokAdmin)
admin.site.register(BagianMasalah, BagianMasalahAdmin)
admin.site.register(SukuMasalahModel, SukuMasalahAdmin)
admin.site.register(TandaTanganModel, TandaTanganAdmin)
