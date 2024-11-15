from django.urls import path
from .views import *

app_name = "suratkeluar"
urlpatterns = [
    path("surat-kelaur/", daftar_suratkeluar_page, name="daftarsuratkeluar"),
    path("surat-kelaur/tambah-data", tambah_suratkeluar_page, name="tambahsuratkeluar"),
]
