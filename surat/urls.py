from django.urls import path
from .views import *

app_name = "surat"

urlpatterns = [
    path("surat-masuk/", daftar_suratmasuk_page, name="daftarsuratmasuk"),
    path("surat-masuk/tambah-data", tambah_suratmasuk_page, name="tambahsuratmasuk"),
    path("surat-kelaur/", daftar_suratkeluar_page, name="daftarsuratkeluar"),
    path("surat-kelaur/tambah-data", tambah_suratkeluar_page, name="tambahsuratkeluar"),
]
